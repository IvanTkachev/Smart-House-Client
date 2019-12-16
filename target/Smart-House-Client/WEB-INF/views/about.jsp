<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content=" width=device-width, initial-scale=1.0">

    <title><spring:message code="PAGE_TITLE"/> <spring:message code="about"/></title>

</head>

<body>

    <%@include file="../layouts/preloader.jsp"%>
    <%@include file="../layouts/high_menu_bar.jsp"%>

    <div id="headewrap2">
        <div class= "container">
            <div class= "row">
                <div class="col-lg-8">

                </div>
            </div>
        </div>
    </div>

    <div class="container" style="margin-top: 5%; margin-bottom: 7%">
        <div class="row centered">
            <div class="col-lg-6 col-lg-offset-2"></div>
            <h4>
                <spring:message code="text_about_us"/>
            </h4>
        </div>
    </div>
    <%@include file="../layouts/footer_layout.jsp"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

</body>