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
package org.entando.entando.plugins.jpfrontshortcut.aps.internalservlet.portal;

import com.agiletec.aps.system.ApsSystemUtils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxyFactory;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.HashMap;

/**
 * @author E.Santoboni
 */
public class SpecialWidgetWardenInterceptor extends AbstractInterceptor {
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		FrontPageConfigAction action = (FrontPageConfigAction) invocation.getAction();
		ActionProxyFactory proxyFactory = (ActionProxyFactory) invocation.getInvocationContext().getContainer().getInstance(ActionProxyFactory.class);
		try {
			proxyFactory.createActionProxy("/do/jpfrontshortcut/Page/SpecialWidget", action.getShowletAction(), null, new HashMap());
		} catch (Throwable t) {
			ApsSystemUtils.getLogger().error("There is no Action mapped for namespace /do/jpfrontshortcut/Page/SpecialWidget and action name " + action.getShowletAction() + ".");
			return "configSimpleParameter";
		}
		return invocation.invoke();
	}
	
}