<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><spring:message code="PAGE_TITLE"/> <spring:message code="product_moderation"/></title>

</head>

<body>

    <%@include file="../layouts/preloader.jsp"%>
    <%@include file="../layouts/high_menu_bar.jsp"%>
    <div class="col-xs-12" style="margin-top: auto; font-size: x-large; text-align: center">
        <label>${result_message}</label>
    </div>
    <div style="margin-bottom: 10%">
        <%@include file="../layouts/moderation_layout.jsp"%>
    </div>
    <%@include file="../layouts/footer_layout.jsp"%>

</body>