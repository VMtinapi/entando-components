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
<s:set name="surveyInfo" value="surveyInfo" />
<h1 id="title"><s:property value="%{getLabel(#surveyInfo.titles)}" /></h1>
<div>
            

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
					<%-- you did vote --%><span class="label label-success"><wp:i18n key="JPSURVEY_YOU_VOTED" /></span>
				</s:if>
				<s:else><%-- you did NOT vote || login --%>
					<s:if test="#surveyInfo.checkUsername && #session.currentUser.username=='guest'">
						<%-- go login --%><wp:i18n key="JPSURVEY_DO_LOGIN" />
					</s:if>
					<s:else>
                                            <div class="row-fluid"> <span class="label label-primary margin-large-top"><wp:i18n key="JPSURVEY_YOU_NOT_VOTED" /></span> </div>
                                             <div class="row-fluid"> <s:if test="!#surveyInfo.archive" >
                                                                <button class="btn btn-primary">
                                                                    <a class="link" href="<wp:action path="/ExtStr2/do/jpsurvey/Front/Survey/startSurvey.action" ><wp:parameter name="surveyId"><s:property value="#surveyInfo.id" /></wp:parameter></wp:action>">
                                                                        
                                                                        <span class="icon icon-edit icon-white"></span>
                                                                        <wp:i18n key="JPSURVEY_COMPILE" />
                                                                    </a>
                                                                </button>
                                                 </s:if> </div>
					</s:else>
				</s:else>
                        </div>
			<p>
                        <div class="table table-resposive">
                        <table class="table table-bordered">
                            <th class="center"><span class="icon icon-calendar"></span><wp:i18n key="JPSURVEY_START_DATE" /></th>
                            <th class="center"><span class="icon icon-calendar"></span><wp:i18n key="JPSURVEY_END_DATE" /></th>
                            <tr>
                                <td class="center"><time class="label" datetime="<s:date name="#surveyInfo.startDate" format="yyyy-MM-dd" />">
					<s:date name="#surveyInfo.startDate" format="EEEE dd/MM/yyyy" />
                            </time></td>
				<s:if test="null != #surveyInfo.endDate">&#32;
					
                                                <td class="center"><time class="label" datetime="<s:date name="#surveyInfo.endDate" format="yyyy-MM-dd" />">
						<s:date name="#surveyInfo.endDate" format="EEEE dd/MM/yyyy" />
                                                    </time></td>
				</s:if>
                            </tr>
                        </table>
                        </div>
			
				
			
			
				
				<s:if test="!#surveyInfo.questionnaire">
					<s:if test="%{(#surveyInfo.archive && #surveyInfo.publicResult) || (!#surveyInfo.archive && #surveyInfo.publicPartialResult && #surveyInfo.open) }">
							&#32;
						<wp:pageWithWidget var="resultsPageVar" widgetTypeCode="jpsurvey_resultsSurvey" />
							<a 
								class="btn btn-primary"
								href="<wp:url page="${resultsPageVar.code}"><wp:parameter name="surveyId"><s:property value="#surveyInfo.id" /></wp:parameter></wp:url>">
                                                            <s:if test="%{#surveyInfo.archive}"><span class="icon icon-tasks icon-white"></span><wp:i18n key="JPSURVEY_FINAL_RESULTS" /></s:if>
								<s:else><span class="icon icon-tasks icon-white"></span><wp:i18n key="JPSURVEY_PARTIAL_RESULTS" /></s:else>
							</a>
					</s:if>
				</s:if>
                               <%-- <s:else>
						show result for questionnaries?
                                </s:else>  --%>
                                
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
        
                               