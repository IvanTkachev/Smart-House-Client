<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content=" width=device-width, initial-scale=1.0">

    <title><spring:message code="PAGE_TITLE"/> <spring:message code="login"/></title>

    <link rel="stylesheet"  href="../../resources/css/main.css">
    <link rel="stylesheet"  href="../../resources/css/bootstrap.min.css">

</head>

<body>

<%@include file="../layouts/preloader.jsp"%>
<%@include file="../layouts/high_menu_bar.jsp"%>
<div style="margin-top: 10%">
    <%@include file="../layouts/registration_layout.jsp"%>
</div>

<div style="margin-top: 13%">
    <%@include file="../layouts/footer_layout.jsp"%>
</div>

</body>