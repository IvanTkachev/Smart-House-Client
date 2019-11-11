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


    <div class="container content" style="margin-bottom: 20%">
        <a class="btn btn-success" href="${contextPath}/new_item" role="button" style="margin-bottom: 1%; margin-left: 90%">
                <spring:message code="AddProduct"/></a>


        <div class="col-lg-12">
            <div class="products">

                <c:forEach items="${items}" var="doc">
                    <div class="col-sm-4">
                        <div class="product">

                            <div class="col-xs-12 text-left">
                                <a href="${contextPath}/item/edit/${doc.id}">
                                    <img src="${contextPath}/resources/img/gear.png">
                                </a>
                            </div>

                            <div class="product-img" style="margin-top: 4%">
                                <a href="#">
                                    <img src="../../resources/img/item.png"/>
                                </a>

                            </div>

                            <p class="product-title">
                                <a class="product-title" href="${contextPath}/item/${doc.id}">
                                    <strong>${doc.name}</strong>
                                </a>
                            </p>

                            <p class="product-desc">${doc.name}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
    <%@include file="../layouts/footer_layout.jsp"%>

</body>