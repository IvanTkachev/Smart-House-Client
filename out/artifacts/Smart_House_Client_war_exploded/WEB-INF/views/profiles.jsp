<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content=" width=device-width, initial-scale=1.0">
    <title><spring:message code="PAGE_TITLE"/> <spring:message code="profile"/></title>
</head>

<body>
<%@include file="../layouts/preloader.jsp"%>
<%@include file="../layouts/high_menu_bar.jsp"%>
<%@include file="../layouts/profile_layout.jsp"%>
<%@include file="../layouts/footer_layout.jsp"%>
</body>