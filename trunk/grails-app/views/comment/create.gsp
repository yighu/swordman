

<%@ page import="swordman.Comment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
	<ckeditor:resources />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commentInstance}">
            <div class="errors">
                <g:renderErrors bean="${commentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cmnt"><g:message code="comment.cmnt.label" default="Cmnt" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'cmnt', 'errors')}">
                                    <g:textField name="cmnt" value="${commentInstance?.cmnt}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="referencekey"><g:message code="comment.referencekey.label" default="Referencekey" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'referencekey', 'errors')}">
                                    <g:textField name="referencekey" value="${commentInstance?.referencekey}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="referencetext"><g:message code="comment.referencetext.label" default="Referencetext" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'referencetext', 'errors')}">
                                    <g:textField name="referencetextx" value="${commentInstance?.referencetext}" />
<ckeditor:editor name="referencetext">
<p>
	To refer to a Bible paragraph, encode the reference with &lt;z/&gt;. For example</p>
<p>
	&lt;z&gt;rom 5:4&lt;/z&gt; or &lt;z&gt;isa 60&lt;/z&gt;</p>
<p>

<p>
	When you display the page later, you will be able to read the paragraph directly.</p>
<p><span style="font-size:16px;">Questions to think about your particular paragraph</span>:</p>
<ul>
	<li>
		<span style="font-size: 14px;">What can you discover about the original context in which this passage was written and applied?</span></li>
	<li>
		<span style="font-size: 14px;">Given that original context, what does this text mean?</span></li>

	<li>
		<span style="font-size: 14px;">What fundamental, universal truths are presented in this passage?</span></li>
	<li>
		<span style="font-size: 14px;">Can you state that truth in a simple sentence or two, a statement that any one could understand?</span></li>
	<li>
		<span style="font-size: 14px;">What issues in your own culture and your own situation does this truth address?</span></li>
	<li>

		<span style="font-size: 14px;">What are the implications of this principle when applied to your life and the world around you? What changes does it require? What values does it reinforce? What difference does it make?</span></li>
</ul>
<p style="text-align: center;">
	--<span style="font-size:12px;">Howard Hendricks &lt;&lt;</span><span style="font-size:12px;">Living By the Book: The Art and Science of Reading the Bible&gt;&gt;</span></p>

	</ckeditor:editor>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>

    </body>
</html>
