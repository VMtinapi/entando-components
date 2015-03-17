<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/apsadmin-form" prefix="wpsf" %>

<h1 class="panel panel-default title-page">
        <span class="panel-body display-block">
                <a href="<s:url action="viewTree" namespace="/do/Page" />" title="<s:text name="note.goToSomewhere" />: <s:text name="title.pageManagement" />"><s:text name="title.pageManagement" /></a>&#32;/&#32;
                <a href="<s:url action="configure" namespace="/do/Page">
                        <s:param name="pageCode"><s:property value="currentPage.code"/></s:param>
                </s:url>" title="<s:text name="note.goToSomewhere" />: <s:text name="title.configPage" />"><s:text name="title.configPage" /></a>&#32;/&#32;
                <s:text name="name.widget" />
        </span>
</h1>

<div id="main">
        <s:set var="breadcrumbs_pivotPageCode" value="pageCode" />
        <s:include value="/WEB-INF/apsadmin/jsp/portal/include/pageInfo_breadcrumbs.jsp" />
        <div class="subsection-light">
                <s:action namespace="/do/Page" name="printPageDetails" executeResult="true" ignoreContextParams="true"><s:param name="selectedNode" value="pageCode"></s:param></s:action>
                <div class="panel panel-default">
                        <div class="panel-heading">
                                <h2 class="h4 margin-small-top">
                                        <span class="label label-default"></span>
                                        <s:include value="/WEB-INF/apsadmin/jsp/portal/include/frameInfo.jsp" />
                                </h2>
                        </div>
                        <div class="panel-body">
                                <label class="sr-only">Widget</label>
                                <h2 class="h5 margin-small-vertical">
                                        <span class="icon fa fa-puzzle-piece"></span>
                                        <s:set var="showletType" value="%{getShowletType(widgetTypeCode)}"></s:set>
                                        <s:text name="name.widget" />:&#32;<s:property value="%{getTitle(#showletType.code, #showletType.titles)}" />
                                </h2>&nbsp; 
                                <fieldset class="margin-bit-bottom"><legend><s:text name="title.userFilterCategoryConfigure" /></legend></fieldset>
                                <s:form namespace="/do/jpphotogallery/Page/SpecialWidget/Photogallery">
                                        <p class="noscreen">
                                                <wpsf:hidden name="pageCode" />
                                                <wpsf:hidden name="frame" />
                                                <wpsf:hidden name="widgetTypeCode" />
                                        </p>
                                        <s:if test="hasFieldErrors()">
                                                <div class="message message_error">
                                                        <h5><s:text name="message.title.FieldErrors" /></h5>
                                                        <ul>
                                                                <s:iterator value="fieldErrors">
                                                                        <s:iterator value="value">
                                                                        <li><s:property escape="false" /></li>
                                                                        </s:iterator>
                                                                </s:iterator>
                                                        </ul>
                                                </div>
                                        </s:if>
                                        <p class="noscreen">
                                                <wpsf:hidden name="contentType" />
                                                <wpsf:hidden name="categories" value="%{#parameters['categories']}" />
                                                <wpsf:hidden name="orClauseCategoryFilter" value="%{#parameters['orClauseCategoryFilter']}" />
                                                <wpsf:hidden name="userFilters" value="%{#parameters['userFilters']}" />
                                                <wpsf:hidden name="filters" />
                                                <wpsf:hidden name="modelIdMaster" />
                                                <wpsf:hidden name="modelIdPreview" />
                                                <wpsf:hidden name="pageLink" value="%{#parameters['pageLink']}" />
                                                <s:iterator id="lang" value="langs">
                                                <wpsf:hidden name="%{'linkDescr_' + #lang.code}" value="%{#parameters['linkDescr_' + #lang.code]}" />
                                                <wpsf:hidden name="%{'title_' + #lang.code}" value="%{#parameters['title_' + #lang.code]}" />
                                                </s:iterator>
                                                <wpsf:hidden name="userFilterKey" value="category" />
                                        </p>
                                        <p>
                                                <label for="userFilterCategoryCode" class="basic-mint-label"><s:text name="label.userFilterCategory" />:</label>
                                                <wpsf:select useTabindexAutoIncrement="true" name="userFilterCategoryCode" id="userFilterCategoryCode" list="categories" listKey="code" listValue="getShortFullTitle(currentLang.code)" headerKey="" headerValue="%{getText('label.all')}" cssClass="form-control" />
                                        </p>

                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-3 margin-small-vertical">
                                                    <wpsf:submit type="button" cssClass="btn btn-primary btn-block" useTabindexAutoIncrement="true" action="addUserFilter">
                                                        <span class="icon fa fa-floppy-o"  ></span>  
                                                            <s:text name="%{getText('label.save')}" />       
                                                    </wpsf:submit>
                                            </div>
                                        </div>
                                </s:form>

                        </div>
                </div>
        </div>
</div>