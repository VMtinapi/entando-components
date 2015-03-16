<%-- 
    Document   : statistics-detail
    Created on : 4-mar-2015, 11.46.01
    Author     : vale
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>
<%@ taglib uri="/apsadmin-form" prefix="wpsf" %>
<%@ taglib prefix="wp" uri="/aps-core" %>

<h1 class="panel panel-default title-page">
	<span class="panel-body display-block">
		<a href="<s:url action="list" />" title="<s:text name="note.goToSomewhere" />: <s:text name="jpnewsletter.title.newsletterManagement" />"><s:text name="jpnewsletter.title.newsletterManagement" /></a>
		&#32;/&#32;
		<s:text name="jpnewsletter.title.newsletterEntry" />
	</span>
</h1>


<s:set value="%{getNewsletterId()}" var="newsletterIdVar"></s:set>
<s:set value="%{getRecipients()}" var="recipientsVar"></s:set>
<s:set value="%{getNewsletterReport(#newsletterIdVar)}" var="newsletterReportVar" />

<p><s:text name="jpnewsletter.title.newsletterEntry.detailsNewsletter" />: <em><s:property value="#newsletterIdVar"/></em>.</p>
<div class="table-responsive">
	<table class="table table-bordered" id="newsletterDetailTable">
            <caption class="sr-only"><s:text name="title.newsletterDetails" /></caption>
                        <tr>
                            <th>
                                <b><s:text name="jpnewsletter.label.subject" /> </b>
                            </th>
                            <td>
                                    <em><s:property value="#newsletterReportVar.subject"/></em>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <b><s:text name="jpnewsletter.label.sendDate" /> </b>
                            </th>
                            <td>
                                <code><s:date name="#newsletterReportVar.sendDate" format="dd/MM/yyyy" /></code>

                            </td>
                        </tr>
                        <tr>
                            <th>
                                <b><s:text name="jpnewsletter.label.recipients" /> </b>
                            </th>
                            <td>
                                <em><s:property value="#recipientsVar"/></em>
                            </td>
                        </tr>
        </table>
</div>