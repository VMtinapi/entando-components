/*
 * Copyright 2013-Present Entando Corporation (http://www.entando.com) All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package com.agiletec.plugins.jpnewsletter.apsadmin.subscriber;

import com.agiletec.aps.system.ApsSystemUtils;
import com.agiletec.aps.util.FileTextReader;
import com.agiletec.apsadmin.system.BaseAction;
import com.agiletec.plugins.jpnewsletter.aps.system.services.newsletter.INewsletterManager;
import java.io.BufferedReader;
import java.util.StringTokenizer;
import com.agiletec.plugins.jpnewsletter.aps.system.services.newsletter.model.Subscriber;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 * @author V.Manca
 */
public class SubscriberAction extends BaseAction  {

        
	public String trashSubscriber() {
		return SUCCESS;
	}
	
	public String deleteSubscriber() {
		try {
			this.getNewsletterManager().deleteSubscriber(this.getMailAddress());
			return SUCCESS;
		} catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "deleteSubscriber");
			return FAILURE;
		}

	}
      
        public String readText(String text)
        {
            try {
                        StringReader stringReader= new StringReader(text);
                        BufferedReader br = new BufferedReader(stringReader);
                        List<Subscriber> subscribers = this.getNewsletterManager().searchSubscribers(null, Boolean.TRUE);
                        List<Subscriber> subscribers_2 = this.getNewsletterManager().searchSubscribers(null, Boolean.FALSE);
                        subscribers.addAll(subscribers_2);
                        List<String> subscribersMails = new ArrayList<String>();
                        for (int i = 0; i < subscribers.size(); i++) {
                                Subscriber subscriber = subscribers.get(i);
                                subscribersMails.add(subscriber.getMailAddress());
                        }
                        while(true){
                            text=br.readLine();
                            if(text==null) break;
                            String [] splits = text.split("\\n|;|,|''");
                            for(String mail:splits){
                                mail = mail.trim();
                                mail = mail.replaceAll("\\s+","");
                             if(subscribersMails.contains(mail)) {
                                                this.addActionError(this.getText("Errors.newsletter.emailDuplicated", new String[]{mail}));
                                        } else {
                                            subscribersMails.add(mail);
                                                this.addActionMessage(this.getText("message.newsletter.emailValid", new String[]{mail}));
                                                this.getNewsletterManager().addSubscriber(mail);
                                        }         
                            }                        
                        }
                        if (this.hasActionErrors()) {
                                    return INPUT;
                                }
                                if (this.hasActionMessages()) {
                                    return INPUT;
                                }                        
                        } catch (Throwable t) {
                            ApsSystemUtils.logThrowable(t, this, "upload");
                            return FAILURE;
                        }
                return SUCCESS;         
        }
        
        public String upload() {
                try {  
                        InputStream is = new FileInputStream(this.getFileUpload());
                        String text = FileTextReader.getText(is);  
                        readText(text);
                }catch (Throwable t) {
                            ApsSystemUtils.logThrowable(t, this, "upload");
                            return FAILURE;
                }
                return SUCCESS;
        }

        public String insertMail() {
                try {
                        String text = getMailInsert();
                        readText(text);                    
                    }catch (Throwable t) {
                            ApsSystemUtils.logThrowable(t, this, "upload");
                            return FAILURE;
                }      
                return SUCCESS;             
        }
        
        
        
        public void setMailInsert(String mailInsert){
            this._insertMail = mailInsert;
        }
        
        public String getMailInsert(){
            return _insertMail;
        }
        
        public void setFileUploadContentType(String contentType){
            this._contentType = contentType;
        }
        
        public void setFileUpload(File fileUpload){
            this._file = fileUpload;
        }
        public void setFileUploadName(String fileName){
            this._fileName = fileName;
        }
        
        public String getFileUploadContentType(){
            return _contentType;
        }
       
        public File getFileUpload(){
            return _file;
        }
        public String getFileUploadName(){
             return _fileName;
        }
        
	public String getMailAddress() {
		return _mailAddress;
	}
	public void setMailAddress(String mailAddress) {
		_mailAddress = mailAddress;
	}
	
            protected INewsletterManager getNewsletterManager() {
		return _newsletterManager;
	}
	public void setNewsletterManager(INewsletterManager newsletterManager) {
		_newsletterManager = newsletterManager;
        }
        
	private String _mailAddress;
      
	private INewsletterManager _newsletterManager;
        
        private String _insertMail;
        private File _file;
        private String _contentType;
        private String _fileName;
    
    
        

}