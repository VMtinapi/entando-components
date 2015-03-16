<%-- 
    Document   : subscribers_list
    Created on : 9-feb-2015, 16.32.13
    Author     : vale
--%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>
<%@ taglib uri="/apsadmin-form" prefix="wpsf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="wp" uri="/aps-core" %>


<h1 class="panel panel-default title-page">
	<span class="panel-body display-block">
		<s:text name="jpnewsletter.title.newsletterManagement" />&#32;/&#32;<s:text name="title.jpnewsletter.subscribersManagement" />
	</span>
</h1>

<div id="main" role="main">

<p><s:text name="jpnewsletter.note.subscribers.intro" /></p>
<s:form action="search" cssClass="form-horizontal" role="search">

<div class="form-group">
	<div class="input-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<span class="input-group-addon">
			<span class="icon fa fa-file-text-o fa-lg" title="<s:text name="label.search.by"/>&#32;<s:text name="label.description"/>"></span>
		</span>
		<label for="search_mail_add" class="sr-only"><s:text name="label.search.by"/>&#32;<s:text name="jpnewsletter.label.search.mailaddress" /></label>
		<wpsf:textfield name="insertedMailAddress" id="search_mail_add" cssClass="form-control input-lg" placeholder="%{getText('label.email')}" title="%{getText('label.search.by')} %{getText('jpnewsletter.label.search.mailaddress')}" />
		<span class="input-group-btn">
			<wpsf:submit action="search" type="button" cssClass="btn btn-primary btn-lg" title="%{getText('label.search')}">
				<span class="sr-only"><s:text name="label.search" /></span>
				<span class="icon fa fa-search"></span>
			</wpsf:submit>
			<button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="collapse" data-target="#search-advanced" title="<s:text name="title.searchFilters" />">
					<span class="sr-only"><s:text name="title.searchFilters" /></span>
					<span class="caret"></span>
			</button>
		</span>
	</div>
        
            <div class="input-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div id="search-advanced" class="collapse well collapse-input-group">
                            <div class="form-group">
                                    <label class="control-label col-sm-3  text-right">
                                            <s:text name="title.searchFilters" />
                                    </label>
                                    <div class="col-sm-2 col-sm-offset-1 input-group">
                                            <wpsf:radio useTabindexAutoIncrement="true" checked="insertedActive == 1" name="insertedActive" value="1" id="jpnewsletter_search_active"/><label for="jpnewsletter_search_active"><s:text name="jpnewsletter.label.search.active" /></label>
                                            
                                    </div>
                                    <div class="col-sm-2 input-group">
                                            <wpsf:radio useTabindexAutoIncrement="true" checked="insertedActive == 0" name="insertedActive" value="0" id="jpnewsletter_search_not_active"/><label for="jpnewsletter_search_not_active"><s:text name="jpnewsletter.label.search.notactive" /></label>
                                    </div>  
                                    <div class="col-sm-2 input-group">
                                            <wpsf:radio useTabindexAutoIncrement="true" checked="insertedActive == null" name="insertedActive" value="" id="jpnewsletter_search_all"  /><label for="jpnewsletter_search_all" ><s:text name="jpnewsletter.label.search.all"/></label>
                                    </div>
                                    <div class="col-sm-1 ">
                                            <wpsf:submit action="search" type="button" cssClass="btn btn-primary">
                                                    <span class="icon fa fa-search"></span>&#32;<s:text name="label.search" />
                                            </wpsf:submit>
                                    </div>
                            </div>
                    </div>
            </div>
                              


</s:form>
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
<div class="subsection-light">

<s:set var="subscribersVar" value="subscribers" />

<s:if test="#subscribersVar != null && #subscribersVar.size() > 0">
	<wpsa:subset source="#subscribersVar" count="10" objectName="groupSubscribers" advanced="true" offset="5">
		<s:set name="group" value="#groupSubscribers" />
		<div class="text-center">
			<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pagerInfo.jsp" />
			<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pager_formBlock.jsp" />
		</div>
		<div class="table-responsive">
			<table class="table table-bordered">
				<tr>
					<th class="text-center padding-large-left padding-large-right col-xs-4 col-sm-3 col-md-2 col-lg-2"><abbr title="<s:text name="label.actions" />">&ndash;</abbr></th>
					<th><s:text name="label.email" /> </th>
					<th><s:text name="label.subscribtionDate" /></th>
					<th><abbr title="<s:text name="label.state.active.full" />"><s:text name="label.state.active.short" /></abbr></th>
				</tr>
				<s:iterator var="subscriber">
				<tr>
					<td class="text-center text-nowrap">
						<s:url var="removeActionVar" action="trash"><s:param name="mailAddress" value="#subscriber.mailAddress" /></s:url>
						<div class="btn-group btn-group-xs">
							<a class="btn btn-warning" 
									href="<s:property value="#removeActionVar" escapeHtml="false" />" 
									title="<s:text name="label.remove" />:&#32;<s:property value="#subscriber.mailAddress" />">
								<span class="sr-only"><s:text name="label.alt.clear" /></span>
								<span class="icon fa fa-times-circle-o"></span>&#32;
							</a>
						</div>
					</td>
					<td><code><s:property value="#subscriber.mailAddress" /></code></td>
					<td><s:date name="#subscriber.subscriptionDate" format="dd/MM/yyyy" /></td> 
					<td>
						<s:if test="#subscriber.active == 1">
							<s:set var="statusIconClassVar" value="%{'icon fa fa-check text-success'}" />
							<s:set var="newsletterUserStatus">true</s:set>
							<s:set var="statusTextVar" value="%{getText('note.userStatus.active')}" />
						</s:if>
						<s:else>
							<s:set var="statusIconClassVar" value="%{'icon fa fa-pause text-warning'}" />
							<s:set var="newsletterUserStatus">false</s:set>
							<s:set var="statusTextVar" value="%{getText('note.userStatus.notActive')}" />
						</s:else>
						<span class="sr-only"><s:property value="#statusTextVar" /></span>
						<span class="<s:property value="#statusIconClassVar" />" title="<s:property value='%{getText("label.state.active."+#newsletterUserStatus)}' />"></span>
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
		<s:text name="jpnewsletter.subscribers.empty" />
	</div>
</s:else>




   
<p class="upload"><s:text name="jpnewsletter.subscribers.introUpload"/> </p>               
                  
<s:form action="upload"  method="post" enctype="multipart/form-data" cssClass="margin-base-top form-horizontal" >

    <div class="input-group"> 
                       <div class="form-control">
                           <s:file name="fileUpload" id="file-upload"  accept=".csv,text/csv" />
                        </div>
                          
                        <div class="input-group-btn">
                            <wpsf:submit action="upload" type="button" cssClass="btn btn-file btn-primary">
                                <span class="icon fa fa-upload"></span>&#32;
                                <s:text name="jpnewsletter.label.upload" />
                            </wpsf:submit>
                        </div>
    </div>	
   
</s:form>


<p class="upload"><s:text name="jpnewsletter.subscribers.textAreaUpload"/> </p>               

<s:form action="insertMail"  method="post" enctype="multipart/form-data" cssClass="margin-base-top form-horizontal">
    
    <div class="row">
        <div class="input-group col-md-6 ">
            <s:textarea name="mailInsert" id="mail_insert" cssClass="form-control" rows="10" placeholder="prova@email.com; prova2@mail.com;"/>
        </div>
    </div>  
        
    <wpsf:submit action="insertMail" type="button" cssClass="margin-base-top btn btn-primary">
            <span class="icon fa fa-upload"></span>&#32;
            <s:text name="jpnewsletter.label.upload" />
    </wpsf:submit>			
			
</s:form>
 
