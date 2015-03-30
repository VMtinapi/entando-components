<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jpsu" uri="/jpsurvey-aps-core" %>
<wp:headInfo type="CSS" info="../../plugins/jpsurvey/view_portal/css/glyphicons-extended.min.css" />
<wp:headInfo type="CSS" info="../../plugins/jpsurvey/view_portal/css/view_portal.css" />

<% pageContext.setAttribute("newLine", "\n"); %>
<s:set var="surveyInfo" value="survey" />

<h1 id="title"><s:property value="%{getLabel(#surveyInfo.titles)}" /></h1>

<div >

                        
			 <div class="row-fluid">
                            			<%-- Description --%>

                        <div class="span9">
			<c:set var="surveyDescriptionVar"><s:property value="%{getLabel(#surveyInfo.descriptions)}" /></c:set>
			<p><c:out value="${fn:replace(surveyDescriptionVar, newLine, '<br />')}" escapeXml="false"  /></p>
                        </div>
                        			<%-- Image --%>

                            <div class="span3">
			<s:set name="imageURL" value="%{getSurveyImageURL(surveyInfo.imageId,2)}" />
			<s:if test="#imageURL != null && #imageURL != '' ">
				<p>
					<img 
						class="img-polaroid" 
						alt="<s:property value="%{getLabel(#surveyInfo.imageDescriptions)}" />" 
						src="<s:property value="#imageURL"/>" />
				</p>
			</s:if>
                            </div>
                                                </div>
                        
		        <div class="center">
                        <s:if test="voted">
					
                                        <span class="label label-success">
                                                <wp:i18n key="JPSURVEY_YOU_VOTED" />
                                        </span>
                        </s:if>
                        <s:else>
					
                                        
                                        <div class="row-fluid"><span class="label label-primary"><wp:i18n key="JPSURVEY_YOU_NOT_VOTED" /></span></div>
                                        <div class="row-fluid"><button class="btn btn-primary">
                                                <a class="link" href="<wp:action path="/ExtStr2/do/jpsurvey/Front/Survey/startSurvey.action" ><wp:parameter name="surveyId"><s:property value="#surveyInfo.id" /></wp:parameter></wp:action>">

                                                    <span class="icon icon-edit icon-white"></span>
                                                    <wp:i18n key="JPSURVEY_COMPILE" />
                                                </a>
                                            </button></div>
                                       
                                        
                        </s:else>
                        </div>
                       
                        
			<div class="table table-resposive">
                        <table class="table table-bordered">
                            <th><span class="icon icon-calendar"></span><wp:i18n key="JPSURVEY_START_DATE" /></th>
                            <th><span class="icon icon-calendar"></span><wp:i18n key="JPSURVEY_END_DATE" /></th>
                            <th><span class="icon icon-user"></span><wp:i18n key="JPSURVEY_VOTED_TOT" /></th>
                            <tr>
			
			&#32;
                        <td><time class="label" datetime="<s:date name="#surveyInfo.startDate" format="yyyy-MM-dd" />">
					<s:date name="#surveyInfo.startDate" format="EEEE dd/MM/yyyy" />
                            </time></td>
				<s:if test="null != #surveyInfo.endDate">&#32;
					
                                                <td> <time class="label" datetime="<s:date name="#surveyInfo.endDate" format="yyyy-MM-dd" />">
						<s:date name="#surveyInfo.endDate" format="EEEE dd/MM/yyyy" />
                                                    </time></td>
				</s:if>
		
			
				
		
                                <td><p><s:property value="%{getTotalVoters(#surveyInfo.id)}" />&#32;<wp:i18n key="JPSURVEY_PERSON" /></p></td>
                        </tr>
                        </table>
                        </div>

                                
<s:iterator value="#surveyInfo.questions" var="question" status="questionsStatus">
	
	<hr />

	<s:set var="occurrences" value="%{getQuestionStatistics(#question.id)}" />
	<h2>
		<span class="label"><wp:i18n key="JPSURVEY_QUESTION" />&#32;<s:property value="#questionsStatus.count"/></span><span class="noscreen">:</span>&#32;
		<c:set var="questionText"><s:property value="%{getLabel(#question.questions)}" /></c:set>
		<c:out value="${fn:replace(questionText, newLine, '<br />')}" escapeXml="false"  />
	</h2>
	
	<div class="row-fluid">
		<div class="span12">
			<h4><wp:i18n key="JPSURVEY_ANSWERS" /></h4>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<ol>
				<s:iterator value="#question.choices" var="choice" status="rowstatus">	
					<li>
                                            
						<c:set var="answerText"><s:property value="%{getLabel(#choice.choices)}" /></c:set>
						<c:out value="${fn:replace(answerText, newLine, '<br />')}" escapeXml="false"  />
                                                <dl>
                                                    <s:set var="occurrence" value="#occurrences[#choice.id]" />
				<s:set var="occurrence" value="%{#occurrence==null ? 0 : #occurrence}" />
				<s:set var="roundedPercentage" value="%{getChoicePercentage(#occurrences, #choice.id)}" />
				<s:set var="roundedPercentage" value="%{#roundedPercentage==null ? 0 : #roundedPercentage}" />
				<s:set var="barRoundedPercentage" value="%{(#roundedPercentage<=0 ) ? 5 : #roundedPercentage}" />
				<dt class="noscreen"><s:property value="%{getLabel(#choice.choices)}" /></dt>
					<dd>
						<div class="progress" title="<wp:i18n key="JPSURVEY_ANSWER_NUMBER" />&#32;<s:property value="#rowstatus.count"/>&#32;<wp:i18n key="JPSURVEY_OBTAINED" />&#32;<s:property value="#occurrence" />&#32;<wp:i18n key="JPSURVEY_VOTES" /> - &#32;<s:property value="%{#roundedPercentage}"/>%">
							<div class="bar" style="width: <s:property value="%{#barRoundedPercentage}"/>%;">							
								<span class="noscreen"><wp:i18n key="JPSURVEY_ANSWER_NUMBER" /></span>
	 							<em><s:property value="#rowstatus.count"/></em>
								<span class="noscreen">
									&#32;
									<wp:i18n key="JPSURVEY_OBTAINED" />&#32;
									<s:property value="#occurrence" />&#32;
									<wp:i18n key="JPSURVEY_VOTES" />
								</span>
								&#32;-&#32;<s:property value="%{#roundedPercentage}"/>%
							</div>
						</div>
					</dd>
                                                </dl>
					</li>
				</s:iterator>
			</ol>
		</div>
     
	</div>
</s:iterator>
<s:if test="!#surveyInfo.questionnaire">
					<wp:pageWithWidget var="archivePageVar" widgetTypeCode="jpsurvey_pollList" />

                                        <button class="btn btn-info btn-md pull-right">
                                                <a 
                                                        href="<wp:url page="${archivePageVar.code}" />" class="link" >
                                                        <wp:i18n key="JPSURVEY_GO_ACTIVE_POLLS" />
                                                </a>
                                        </button>
				</s:if>
                                <s:else>
                                        <wp:pageWithWidget var="archivePageVar" widgetTypeCode="jpsurvey_questionnaireList" />
                                        <button class="btn btn-info btn-md pull-right">
                                                <a 
                                                        href="<wp:url page="${archivePageVar.code}" />" class="link">
                                                        <wp:i18n key="JPSURVEY_ACTIVE_QUESTIONNAIRE" />
                                                </a>
                                        </button>
                                </s:else>
</div>
                        
 