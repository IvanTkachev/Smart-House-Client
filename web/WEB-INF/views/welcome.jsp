<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content=" width=device-width, initial-scale=1.0">

    <title><spring:message code="PAGE_TITLE"/> <spring:message code="welcome"/></title>

</head>

<body>

    <%@include file="../layouts/preloader.jsp"%>
    <%@include file="../layouts/high_menu_bar.jsp"%>
    <!--%@include file="../layouts/left_menu_layout.jsp"%-->
    <div style="margin-bottom: 300px; margin-left: 10%">
        <%@include file="../layouts/item_list_layout.jsp"%>
    </div>
    <%@include file="../layouts/footer_layout.jsp"%>

</body>