
<%@ page import="swordman.Comment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

	<ckeditor:resources />
 <link rel="stylesheet" type="text/css" href="${createLinkTo(dir:pluginContextPath,file:'css/basicsimple.css')}" media='screen' />

<!--[if lt IE 7]>
 <link rel="stylesheet" type="text/css" href="${createLinkTo(dir:pluginContextPath,file:'css/basicie.css')}" media='screen' />
<![endif]-->
<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:pluginContextPath,file:'css/basic.css')}" media='screen' />
<script type="text/javascript">

<!--
function showBox(e){
		        $.modal(e);  
			//$('<div></div>').load('index.html').modal(); 
return false;
}
function handlePassage(key){
	getDetail(key);
}
function getDetail(key){
$.ajax({ url:"${request.contextPath}/comment/searchJSON", 
dataType: 'json',
//data: { cmnt: $('#topic').val(), }, 
data: { key: key }, 
success: function(e) { 
		     //$.each(e,function(i,cmt) { if(undefined!=cmt) doSomething(cmt); } )
			doSomething(e)
		}, 
error: function(request, status, error) { },
complete: function() {doSomething("complete"); 
			} 
	});

}
function doSomething(data){
	//showBox(data.referencetext);
	showBox(data.data);
	
	}
//-->
</script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comment.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: commentInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comment.cmnt.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: commentInstance, field: "cmnt")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comment.referencekey.label" default="Referencekey" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: commentInstance, field: "referencekey")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="comment.referencetext.label" default="Body of Comment" /></td>
                            <td valign="top" class="value">
${comment.Util.processScript(commentInstance?.referencetext)}
</td>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${commentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
<!--
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
-->
                </g:form>
            </div>
        </div>
<script type='text/javascript' src='/swordman/js/jquery.simplemodal.js'></script>
<script type='text/javascript' src='/swrodman/js/basic.js'></script>
    </body>
</html>
