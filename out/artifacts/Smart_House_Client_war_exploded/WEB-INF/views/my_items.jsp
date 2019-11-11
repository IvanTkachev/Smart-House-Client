<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content=" width=device-width, initial-scale=1.0">

    <title><spring:message code="PAGE_TITLE"/> <spring:message code="my_product"/></title>

</head>

<body>

    <%@include file="../layouts/preloader.jsp"%>
    <%@include file="../layouts/high_menu_bar.jsp"%>
    <div>
        <a class="btn btn-success" href="${contextPath}/new_item" role="button" style="margin-top: 7%; margin-bottom: -7%; margin-left: 70%">
            <spring:message code="AddProduct"/>
        </a>
    </div>

    <%@include file="../layouts/item_list_layout.jsp"%>
    <%@include file="../layouts/footer_layout.jsp"%>

</body>