<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<wp:headInfo type="CSS" info="../../plugins/jpsurvey/view_portal/css/glyphicons-extended.min.css" />
<wp:headInfo type="CSS" info="../../plugins/jpsurvey/view_portal/css/view_portal.css" />

<% pageContext.setAttribute("newLine", "\n"); %> 
<s:set name="surveyInfo" value="voterResponse.survey" />
<s:set name="currentQuestion" value="currentQuestion" />
<div class="jpsurvey flowquestion">
	<form 
		action="<wp:action path="/ExtStr2/do/jpsurvey/Front/Survey/saveResponse.action" />" 
		method="post" 
		class="form-horizontal">
		
		<h1 id="title"><s:property value="%{getLabel(#surveyInfo.titles)}" /></h1>

		<s:if test="hasFieldErrors()">
			<div class="alert alert-block">
				<p><strong><s:text name="message.title.FieldErrors" /></strong></p>
				<ul class="unstyled">
					<s:iterator value="fieldErrors">
						<s:iterator value="value">
							<li><s:property escape="false" /></li>
						</s:iterator>
					</s:iterator>
				</ul>
			</div>
		</s:if>

		<s:if test="hasActionErrors()">
			<div class="alert alert-block">
				<p><strong><s:text name="message.title.ActionErrors" /></strong></p>
				<ul class="unstyled">
					<s:iterator value="actionErrors">
						<s:iterator value="actionErrors">
							<li><s:property/></li>
						</s:iterator>
					</s:iterator>
				</ul>
			</div>
		</s:if>

                <h4 class="center">
				<wp:i18n key="JPSURVEY_QUESTION" />&#32;
				<s:property value="%{currentQuestionIndex+1}" />&#32;
				<wp:i18n key="JPSURVEY_QUESTION_OF" />&#32;
				<s:property value="%{#surveyInfo.questions.size()}" />
                </h4>
                <div class="panel">
		<dl class="dl-horizontal">
			<%--
			<dt><wp:i18n key="JPSURVEY_TITLE" /></dt>
				<dd><p><s:property value="%{getLabel(#surveyInfo.titles)}" /></p></dd>
			--%>
			
                        
                        
                        
                        <dt><p>
					<s:property value="%{currentQuestionIndex+1}" />. 
                        
                                        <c:set var="questionVar"><s:property value="%{getLabel(#currentQuestion.questions)}" /></c:set>
					<c:out value="${fn:replace(questionVar, newLine, '<br />')}" escapeXml="false"  />
			
			</p></dt>
                        <dd><p>
			<s:if test="!#currentQuestion.singleChoice">
				<wp:i18n key="JPSURVEY_NUMBER_MIN_ANSWERS" />&#32;<s:property value="#currentQuestion.minResponseNumber" />&#32;
				&#32;<wp:i18n key="JPSURVEY_NUMBER_MAX_ANSWERS" />&#32;<s:property value="#currentQuestion.maxResponseNumber" />
			</s:if>
                            </p></dd>
			
				<dd>
					<s:iterator var="choice" value="#currentQuestion.choices" status="rowstatus">
						<p>
							<label class="<s:if test="#currentQuestion.singleChoice">radio</s:if><s:else>checkbox</s:else>">
								<input 
										type="<s:if test="#currentQuestion.singleChoice">radio</s:if><s:else>checkbox</s:else>" 
										name="choiceIds" 
										value="<s:property value="#choice.id" />" 
										id="choiceIds-<s:property value="#rowstatus.index"/>" 
										<s:if test="choiceIds.contains(#choice.id)"> checked="checked "</s:if> 
										/>
								<s:if test="#choice.freeText">
									<wp:i18n key="JPSURVEY_FREE_TEXT" />
									&ensp;
									<wpsf:textfield 
										useTabindexAutoIncrement="true" 
										name="insertedFreeText" 
										 />
								</s:if>
								<s:else>
									<c:set var="choiceTextVar"><s:property value="%{getLabel(#choice.choices)}" /></c:set>
									<c:out value="${fn:replace(choiceTextVar, newLine, '<br />')}" escapeXml="false"  /> 
								</s:else>
							</label>
						</p>
					</s:iterator>
					<p class="center">
                                            <wp:i18n key="JPSURVEY_GO"  var="labelSubmit" />
						<wpsf:submit useTabindexAutoIncrement="true" value="%{#attr.labelSubmit}" cssClass="btn btn-success" />
					</p>
				</dd>
		</dl>
                </div>
	</form>
                                        
</div>