<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>

<% response.setStatus(404); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>401 error</title>
    </head>

    <body>
        <%@include file="../../layouts/preloader.jsp"%>
        <%@include file="../../layouts/high_menu_bar.jsp"%>

        <div class="error_text">
            <spring:message code="error401"/>
        </div>
        <div class="error_icon">
            <img src="../../resources/img/error.png" alt="" class="img-responsive">
        </div>
    </body>
</html>
