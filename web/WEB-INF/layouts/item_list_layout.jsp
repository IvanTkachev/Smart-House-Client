<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="${contextPath}/resources/css/catalog.css" rel="stylesheet">

</head>

<body>

<script type="text/JavaScript"
        src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js">
</script>

<div class="container content">

    <div class="col-xs-12" id="msg" style="font-size: x-large; text-align: center">
        <label class="msg"></label>
    </div>

    <div class="col-lg-12">

        <div class="products">

            <c:forEach items="${items}" var="item">
                <div class="col-sm-4">
                    <div class="product">
                        <div class="product-img">
                            <a class="prod-img" href="#">
                                <img src="../../resources/img/item.png"/>
                            </a>
                        </div>

                        <p class="product-title">
                            <a class="product-title" href="${contextPath}/item/${item.id}">
                                <strong>${item.name}</strong>
                            </a>
                        </p>

                        <p class="product-summary">${item.summary}</p>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>

<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>