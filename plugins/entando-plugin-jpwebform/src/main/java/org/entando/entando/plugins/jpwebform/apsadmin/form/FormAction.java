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
package org.entando.entando.plugins.jpwebform.apsadmin.form;

import org.entando.entando.plugins.jpwebform.apsadmin.AbstractConfigAction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.agiletec.aps.system.exception.ApsSystemException;

/**
 *
 * @author S.Loru
 */
public class FormAction extends AbstractConfigAction {

	private static final Logger _logger =  LoggerFactory.getLogger(FormAction.class);

	public String removeFormWorkVersion(){
		try {
			this.getFormManager().deleteAllWorkGuiConfig(this.getEntityTypeCode());
			this.getFormManager().deleteTypeVersion(this.getEntityTypeCode());
			this.getFormManager().deleteStepsConfig(this.getEntityTypeCode());
		} catch (ApsSystemException ex) {
			_logger.error("error in removeFormWorkVersion", ex);
		}
		return SUCCESS;
	}


	public int getAttributeIndex() {
		return _attributeIndex;
	}

	public void setAttributeIndex(int attributeIndex) {
		this._attributeIndex = attributeIndex;
	}

	private int _attributeIndex;
}
