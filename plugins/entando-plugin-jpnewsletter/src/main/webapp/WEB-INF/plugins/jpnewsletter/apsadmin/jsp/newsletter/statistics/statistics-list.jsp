<%-- 
    Document   : statistics-list
    Created on : 26-feb-2015, 10.39.42
    Author     : vale
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>
<%@ taglib uri="/apsadmin-form" prefix="wpsf" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="panel panel-default title-page">
                <span class="panel-body display-block">
                        <s:text name="jpnewsletter.title.newsletterManagement" />&#32;/&#32;<s:text name="jpnewsletter.title.statistics" />
                </span>
        </h1>
        
        <s:if test="hasFieldErrors()">
        <div class="alert alert-danger alert-dismissable fade in">
                <button class="close" data-dismiss="alert"><span class="icon fa fa-times"></span></button>
                <h2 class="h4 margin-none"><s:text name="message.title.FieldErrors" /></h2>
                <ul class="margin-base-top">
                        <s:iterator value="fieldErrors">
                                <s:iterator value="value">
                                        <li><s:property escape="false" /></li>
                                </s:iterator>
                        </s:iterator>
                </ul>
        </div>
        </s:if>
        <s:if test="hasActionErrors()">
            <div class="alert alert-danger alert-dismissable fade in margin-base-top">
                    <button class="close" data-dismiss="alert"><span class="icon fa fa-times"></span></button>
                    <h2 class="h4 margin-none"><s:text name="message.title.ActionErrors" /></h2>
                    <ul class="margin-base-top">
                    <s:iterator value="ActionErrors">
                            <li><s:property escape="false" /></li>
                    </s:iterator>
                    </ul>
            </div>
        </s:if>
        <s:if test="hasActionMessages()">
            <div class="alert alert-success alert-dismissable fade in">
                    <button class="close" data-dismiss="alert"><span class="icon fa fa-times"></span></button>
                    <h2 class="h4 margin-none"><s:text name="messages.confirm" /></h2>
                    <ul class="margin-base-top">
                            <s:iterator value="actionMessages">
                                    <li><s:property escape="false" /></li>
                            </s:iterator>
                    </ul>
            </div>
        </s:if>
                        
<s:form action="list" cssClass="form-horizontal">
          
          
<div class="subsection-light">

<s:set var="listNewsletterOkVar" value="%{listNewsletter()}" />
<s:if test="listNewsletter() != null && listNewsletter().size() > 0">
	<wpsa:subset source="#listNewsletterOkVar" count="10" objectName="groupStatistics" advanced="true" offset="5">
            <s:set name="group" value="#groupStatistics" /> 
		<div class="text-center">
			<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pagerInfo.jsp" />
			<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pager_formBlock.jsp" />
		</div>
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<tr>
                                    <th class="text-center padding-large-left padding-large-right col-xs-4 col-sm-3 col-md-2 col-lg-2"><abbr title="<s:text name="label.actions" />">&ndash;</abbr></th>
                                    <th><a href="#"><s:text name="jpnewsletter.label.idNewsletter" /></a> </th>
                                        <th class="text-center"><s:text name="jpnewsletter.label.date" /> </th>
                                        <th class="text-center"><s:text name="jpnewsletter.label.countMail" /> </th>

				</tr>
                                
                                <s:set value="%{countMail()}" var="countMailVar" />
                                <s:set value="%{getDetails()}" var="detailsVar" />
                                <s:set value="%{getDates()}" var="dateVar" />
                                <s:set value="%{getSubject()}" var="subjectVar" />
                                
                                <s:iterator var="newsletterIdVar">
                                    
                                    <%--SET OGGETTO report SULLA BASE DI newsletterIdVar--%>
				<tr>  
                                    <td class="text-center text-nowrap">
                                            <div class="btn-group btn-group-xs">
                                                    <a class="btn btn-default" title="Newsletter&nbsp;: " href="<s:url action="detailsNewsletter"><s:param name="newsletterId" value="%{#newsletterIdVar}" /><s:param name="recipients" value="%{#detailsVar[#newsletterIdVar]}" /></s:url>">
                                                            <span class="icon fa fa-fw fa-info"></span>
                                                            <span class="sr-only">Newsletter&nbsp;</span>
                                                    </a>
                                            </div>
                                    </td>
                                    <td>
                                        <b><s:property value="#newsletterIdVar"/></b>
                                    </td>
                                    
                                    <td class="text-center">
                                       <%-- STAMAPA jhgjhgjhgh --%>
                                        <code><s:date name="#dateVar[#newsletterIdVar]" format="dd/MM/yyyy" /></code>
                                    </td>
                                    <td class="text-center">
                                        
                                    <span class="badge"><s:property value="#countMailVar[#newsletterIdVar]"/></span>
                                    </td>
                                    
				</tr>
                                </s:iterator>
			</table>
		</div>
		<div class="text-center">
			<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pager_formBlock.jsp" />
		</div>
	</wpsa:subset>
</s:if>
<s:else>
	<div class="alert alert-info">
		<s:text name="jpnewsletter.listNewsletterId.empty" />
	</div>
</s:else> 
    
       </s:form>
    
</div>
    </body>
</html>
