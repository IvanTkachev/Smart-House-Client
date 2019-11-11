<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <title><spring:message code="PAGE_TITLE"/> <spring:message code="error"/></title>
</head>
<body>

<%@include file="../layouts/preloader.jsp"%>
<%@include file="../layouts/high_menu_bar.jsp"%>
<div class="error_text">
    <spring:message code="errorStatus"/><a href="${contextPath}/feedback"><spring:message code="here"/></a>
</div>
<%@include file="../layouts/footer_layout.jsp"%>
</body>
</html>
