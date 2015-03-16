/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.agiletec.plugins.jpnewsletter.apsadmin.newsletter;

import com.agiletec.aps.system.ApsSystemUtils;
import com.agiletec.apsadmin.system.BaseAction;
import com.agiletec.plugins.jacms.aps.system.services.content.IContentManager;
import com.agiletec.plugins.jpnewsletter.aps.system.services.newsletter.INewsletterManager;
import com.agiletec.plugins.jpnewsletter.aps.system.services.newsletter.model.NewsletterReport;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author vale
 */
public class NewsletterStatisticsAction extends BaseAction  {
  
    public Map<String, Integer> countMail(){
            int listMail = 0;
            int count = 0;
            //per ogni newsletter (identificate da un id) serve sapere quante mail sono state inviate
            Map<String, Integer> map = new HashMap<String, Integer>();
            try{
                        List<String> newsId = this.getNewsletterManager().getNewsletterId();
                       
                        for(String n : newsId)
                        {
                            listMail=Integer.parseInt(n);
                            count = this.getNewsletterManager().getMail(listMail);
                            map.put(n, count);
                        }
            }catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "listMail");
            }
            return map;
    }
    
    public String detail() {
        return SUCCESS;
    }
    
    
    public Map<String, List<String>> getDetails(){
            
            List<String> mailaddress;
            int listId = 0;
            //per ogni newsletter (identificate da un id) serve sapere quante mail sono state inviate
            Map<String, List<String>> mapMail = new HashMap<String, List<String>>();
            try{
                        List<String> newsId = this.getNewsletterManager().getNewsletterId();
                       
                        for(String n : newsId)
                        {
                            listId=Integer.parseInt(n);
                            mailaddress = this.getNewsletterManager().getMailAddress(listId);
                            mapMail.put(n, mailaddress);
                            
                        }
                       
            }catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "detail");
            }
            return mapMail;
    }
    
    
    public Map<String, Date> getDates(){
            
            Date date;
            int listId = 0;
            //per ogni newsletter (identificate da un id) serve sapere quante mail sono state inviate
            Map<String, Date> mapDate = new HashMap<String, Date>();
            try{
                        List<String> newsId = this.getNewsletterManager().getNewsletterId();
                       
                        for(String n : newsId)
                        {
                            listId=Integer.parseInt(n);
                            date = this.getNewsletterManager().getDate(listId);
                            mapDate.put(n, date);
                            
                        }
                       
            }catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "getDates");
            }
            return mapDate;
    }
    
     public List<String> listNewsletter(){
            List<String> listNewsletterId = new ArrayList<String>();
            try{
                    listNewsletterId = this.getNewsletterManager().getNewsletterId();
                        
            }catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "listNewsletter");
            }
            return listNewsletterId;
    }
     
    public Map<String, String> getSubject(){
            
            String subject;
            int listId = 0;
            //per ogni newsletter (identificate da un id) serve sapere quante mail sono state inviate
            Map<String, String> mapSubject = new HashMap<String, String>();
            try{
                        List<String> newsId = this.getNewsletterManager().getNewsletterId();
                       
                        for(String n : newsId)
                        {
                            listId=Integer.parseInt(n);
                            subject = this.getNewsletterManager().getSubject(listId);
                            mapSubject.put(n, subject);
                            
                        }
                       
            }catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "getDates");
            }
            return mapSubject;
    }
     
     public  NewsletterReport getNewsletterReport(Integer newsletterId) {
                NewsletterReport newsletterreport= null;
                
               
		try {
			
                            newsletterreport =this.getNewsletterManager().getNewsletterReport(newsletterId);
                        
			
		} catch (Throwable t) {
			ApsSystemUtils.logThrowable(t, this, "getCards");
			throw new RuntimeException("Errore in ricerca cards", t);
		}
		return newsletterreport;
	}
    
   
    public Date getDateId() {
        return _dateId;
    }

    public void setDateId(Date dateId) {
        this._dateId = dateId;
    }
    
    public List<String> getRecipients()
            {
                return _recipients;
            }
    
    public void setRecipients(List<String> recipients)
    {
        this._recipients = recipients;
    }
    
    public Integer getNewsletterId() {
		return _newsletterId;
	}
    
    public void setNewsletterId(Integer newsletterId) {
		this._newsletterId = newsletterId;
        }
    
    public Integer getCount() {
		return _count;
	}
    
    public void setCount(Integer count) {
		this._count =  count;
        }
    
    
    protected IContentManager getContentManager() {
		return _contentManager;
	}
	public void setContentManager(IContentManager contentManager) {
		this._contentManager = contentManager;
        }
    protected INewsletterManager getNewsletterManager() {
		return _newsletterManager;
	}
    
    public void setNewsletterManager(INewsletterManager newsletterManager) {
		this._newsletterManager = newsletterManager;
	}
    
    private INewsletterManager _newsletterManager;
    private IContentManager _contentManager;
    private Integer _newsletterId;
    private List<String> _recipients;
    private Integer _count;
    private Date _dateId;

    

    

    
}
