<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content=" width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/account.css"/>
    <title><spring:message code="PAGE_TITLE"/> <spring:message code="feedback"/></title>

</head>

<body>
<%@include file="../layouts/preloader.jsp"%>
<%@include file="../layouts/high_menu_bar.jsp"%>
<div class="container content">
    <f:form class="content" method="post" commandName="Email" acceptCharset="utf-8" id="form_feedback">
        <div class="col-md-10 col-md-offset-1">
            <div class="form-group row has-feedback">
                <label class="col-2 col-form-label"><strong>
                        <spring:message code="email_from"/>
                </label>
                <div class="col-10">
                    <input class="form-control" type="text" name="from" id="from" path="from"/>
                    <form:errors path="from"/>
                </div>
            </div>
            <div class="form-group row has-feedback">
                <label class="col-2 col-form-label"><strong>
                        <spring:message code="email_about"/>
                </label>
                <div class="col-10">
                    <input class="form-control" type="text" name="title" id="title" path="title"/>
                    <form:errors path="title"/>
                </div>
            </div>
            <div class="form-group row has-feedback">
                <label class="col-2 col-form-label"><strong>
                        <spring:message code="email_text"/>
                </label>
                <textarea class="form-control" rows="5" name="message" id="message" path="message"></textarea>
                <form:errors path="message"/>
            </div>
            <button type="submit" class="btn"><strong>
                    <spring:message code="send"/>
            </button>
        </div>
    </f:form>
</div>


<script type="text/javascript">
    $(item).ready(function() {
        $('#form_feedback').submit(function() {
            if($('#from').val() != '' &&
                $('#title').val() != '' &&
                $('#message').val() != '') {
                var patternEmail = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
                var patternTitle = /^[0-9а-яА-ЯёЁa-zA-Z\s-]{1,70}$/i;
                var patternMessage = /^[0-9а-яА-ЯёЁa-zA-Z\s-]{1,500}$/i;
                if(patternEmail.test($('#from').val()) &&
                    patternTitle.test($('#title').val()) &&
                    patternMessage.test($('#message').val())){
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        });

        $('#from').on("input",function() {
            if($(this).val() != '') {
                var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
                if(pattern.test($(this).val())){
                    $(this).css({'border' : '1px solid #04f92d'});
                } else {
                    $(this).css({'border' : '1px solid #ff0000'});
                }
            } else {
                $(this).css({'border' : '1px solid #ff0000'});
            }
        });

        $('#title').on("input",function() {
            if($(this).val() != '') {
                var pattern = /^[0-9а-яА-ЯёЁa-zA-Z\s-]{1,70}$/i;
                if(pattern.test($(this).val())){
                    $(this).css({'border' : '1px solid #04f92d'});
                } else {
                    $(this).css({'border' : '1px solid #ff0000'});
                }
            } else {
                $(this).css({'border' : '1px solid #ff0000'});
            }
        });

        $('#message').on("input",function() {
            if($(this).val() != '') {
                var pattern = /^[0-9а-яА-ЯёЁa-zA-Z\s-]{1,500}$/i;
                if(pattern.test($(this).val())){
                    $(this).css({'border' : '1px solid #04f92d'});
                } else {
                    $(this).css({'border' : '1px solid #ff0000'});
                }
            } else {
                $(this).css({'border' : '1px solid #ff0000'});
            }
        });
    });
</script>
<%@include file="../layouts/footer_layout.jsp"%>
</body>