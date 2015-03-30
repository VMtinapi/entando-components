<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="jpsu" uri="/jpsurvey-aps-core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<wp:headInfo type="CSS" info="../../plugins/jpsurvey/view_portal/css/glyphicons-extended.min.css" />
<wp:headInfo type="CSS" info="../../plugins/jpsurvey/view_portal/css/view_portal.css" />

<% pageContext.setAttribute("newLine", "\n"); %> 
<wp:pageWithWidget var="surveyDetailsPageCode" widgetTypeCode="jpsurvey_detailsSurvey" />

<wp:info key="currentLang" var="currentLang" />
<wp:info key="defaultLang" var="defaultLang" />

<jpsu:surveyList ctxName="pollList" category="poll" expired="false" />

<h1 id="title">
		<wp:i18n key="JPSURVEY_LIST_SURVEY" />
</h1>

<c:choose>
<c:when test="${not empty pollList}">
	
    <div class="table-resposive">
        <table class="table table-bordered" summary="table">
            <th class="center">&minus;</th>
            <th><wp:i18n key="JPSURVEY_TITLE_SURVEY" /></th>
            <th><wp:i18n key="JPSURVEY_DESCRIPTION" /></th>
            <th><wp:i18n key="JPSURVEY_VOTED" /></th>
            <tr><c:forEach var="currentSurveyItem" items="${pollList}">
			<jpsu:loadSurvey ctxName="currentSurvey" surveyId="${currentSurveyItem}" preferredLang="${currentLang}" votedParamName="voted" ctxImageUrl="imageURL" imageDimension="1" />
			
				<%/*Vote*/%>
				<c:choose>
					<c:when test="${voted}"><wp:i18n key="JPSURVEY_YOU_HAVE_VOTED" var="votationVar" /></c:when>
					<c:when test="${currentSurvey.checkUsername && sessionScope.currentUser.username == 'guest' }"><wp:i18n key="JPSURVEY_DO_LOGIN" var="votationVar" /></c:when>
					<c:otherwise><wp:i18n key="JPSURVEY_YOU_HAVE_NOT_VOTED" var="votationVar" /></c:otherwise>
				</c:choose>
				<%/*Title*/%>
				<c:choose>
					<c:when test="${not empty currentSurvey.titles[currentLang]}"><c:set var="surveyTitle" value="${currentSurvey.titles[currentLang]}"/></c:when>
					<c:otherwise><c:set var="surveyTitle" value="${currentSurvey.titles[defaultLang]}"/></c:otherwise>
				</c:choose>
				<%/*Url*/%>
				<wp:url page="${surveyDetailsPageCode.code}" var="surveyUrlVar"><wp:parameter name="surveyId"><c:out value="${currentSurvey.id}"/></wp:parameter></wp:url>
				
					 <td class="center"><a 
						href="<c:out value="${surveyUrlVar}" />" 
						title="<wp:i18n key="JPSURVEY_GO_TO_QUESTIONNAIRE" />:&#32;<c:out value="${currentSurvey.titles[defaultLang]}"/>"
						>
                                               <span class="icon icon-info-sign icon-lightblue"></span>
                                </a></td>
					
                                        
                                            <td><c:out value="${currentSurvey.titles[defaultLang]}"/></td>
                                        
			
				<%/* Descr */%>
				<c:choose>
					<c:when test="${not empty currentSurvey.descriptions[currentLang]}"><c:set var="surveyDescriptionVar"><c:out value="${currentSurvey.descriptions[currentLang]}"/></c:set></c:when>
					<c:otherwise><c:set var="surveyDescriptionVar"><c:out value="${currentSurvey.descriptions[defaultLang]}"/></c:set></c:otherwise>
				</c:choose>
				
                                <td><c:out value="${fn:replace(surveyDescriptionVar, newLine, '<br />')}" escapeXml="false"  /></td>
				
                                
                                <td class="center">
                                    <c:choose>
                                            <c:when test="${voted}">
                                            <span class="icon icon-ok icon-green"></span>
                                            </c:when>
                                            <c:when test="${currentSurvey.checkUsername && sessionScope.currentUser.username == 'guest' }">
                                                <wp:i18n key="JPSURVEY_DO_LOGIN" />
                                            </c:when>
                                            <c:otherwise>       
                                                <wp:pageWithWidget var="surveyEntryPageCode" widgetTypeCode="jpsurvey_entry" />  
                                                    

							<button class="btn btn-primary">
                                                            <a class="link" href="<wp:url page="${surveyEntryPageCode.code}"><wp:parameter name="surveyId"><c:out value="${currentSurvey.id}"/></wp:parameter></wp:url>" >
                                                            <span class="icon icon-edit icon-white"></span>
                                                                    <wp:i18n key="JPSURVEY_COMPILE" />
                                                        </a>
                                                        </button>
                                           
                                            
                                                           
                                            </c:otherwise>
                                    </c:choose>
                                </td>
			</tr>
		</c:forEach>
        
        </table>
    </div>
</c:when>
    <c:otherwise>
        <div class="alert alert-warning">
                <wp:i18n key="JPSURVEY_ALERT_NOT_SURVEY" />
        </div>
    </c:otherwise>
</c:choose>

                                                                  
                                                                  
<wp:pageWithWidget var="pollArchivePage" widgetTypeCode="jpsurvey_pollArchive" />

<button class="btn btn-info btn-md pull-right">
        <a href="<wp:url page="${pollArchivePage.code}"></wp:url>" class="link">
            <wp:i18n key="JPSURVEY_POLL_ARCHIVE" /></a>
</button>