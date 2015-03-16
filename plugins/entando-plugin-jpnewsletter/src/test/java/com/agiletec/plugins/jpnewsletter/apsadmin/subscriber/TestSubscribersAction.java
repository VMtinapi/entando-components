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

import com.agiletec.plugins.jpnewsletter.aps.system.JpnewsletterSystemConstants;
import com.agiletec.plugins.jpnewsletter.aps.system.services.newsletter.INewsletterManager;
import com.agiletec.plugins.jpnewsletter.apsadmin.ApsAdminPluginBaseTestCase;
import com.opensymphony.xwork2.Action;

public class TestSubscribersAction extends ApsAdminPluginBaseTestCase {

	@Override
	protected void setUp() throws Exception {
        super.setUp();
        this.init();
    }
	
	public void testDeleteSubscriber() throws Throwable{
		String mail = "inesistente@inesistente.in";
		try {
			this.initAction("/do/jpnewsletter/Front/RegSubscriber", "addSubscription");
			this.addParameter("mailAddress", mail);
			String result = this.executeAction();
			assertEquals(Action.SUCCESS, result);
			assertNotNull(this._newsletterManager.loadSubscriber(mail));
			this.setUserOnSession("admin");
			
			this.initAction("/do/jpnewsletter/Subscriber", "delete");
			this.addParameter("mailAddress", mail);
			result = this.executeAction();
			assertEquals(Action.SUCCESS, result);
			assertNull(this._newsletterManager.loadSubscriber(mail));
		} catch (Throwable t) {
			this._newsletterManager.deleteSubscriber(mail);
			throw t;
		}
	}
        
        public void testInsertMail() throws Throwable
        {
            String mailInsert ="valentinamancasedilo@gmail.com,e.santoboni@entando.com";
            try{
                this.initAction("/do/jpnewsletter/Subscriber", "insertMail");
                this.addParameter("mailInsert", mailInsert);
                this.setUserOnSession("admin");
                String result = this.executeAction();
		assertEquals(Action.INPUT, result);
                //assertNull(this._newsletterManager.loadSubscribers());
            }catch(Throwable t){
                this._newsletterManager.deleteSubscriber(mailInsert);
		throw t;
            }
        }
	
	private void init() throws Exception {
		try {
			this._newsletterManager = (INewsletterManager) this.getService(JpnewsletterSystemConstants.NEWSLETTER_MANAGER);
		} catch (Exception e) {
			throw e;
		}
	}
	
	private INewsletterManager _newsletterManager;
	
}