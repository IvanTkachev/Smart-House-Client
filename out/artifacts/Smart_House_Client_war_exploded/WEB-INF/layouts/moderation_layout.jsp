<%@ page contentType="text/html; charset=UTF-8" %>
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

    <div class="col-lg-12">

        <div class="products">

            <c:forEach items="${nmod_products}" var="product">

                <div class="col-sm-4">
                    <div class="product">
                        <div class="product-img">
                            <a href="#">
                                <img src="https://drive.google.com/uc?export=download&confirm=no_antivirus&id=${product.photo}"
                                     onerror="this.src='${contextPath}/resources/img/placeholder-image.png'"/>
                            </a>
                        </div>
                        <p class="product-title-mod">
                            <a href="${contextPath}/product/${product.id}"><strong>${product.title}</strong></a>
                        </p>

                        <p class="product-desc">${product.description}</p>
                        <p class="product-category"><spring:message code="${product.category}"/></p>
                        <p class="product-price-mod">${product.cost}</p>

                        <div class="btn-group">
                            <button type="button" name="${product.id}"  id="btn_accept" class="btn btn-primary"><spring:message
                                    code="moderationButtonAccept"/></button>
                            <button type="button" name="${product.id}"  id="btn_deny" class="btn btn-primary"><spring:message
                                    code="moderationButtonDeny"/></button>
                        </div>
                    </div>
                </div>

            </c:forEach>

        </div>

    </div>
</div>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
<script>
    $(item).on('click','#btn_accept',function(event) {

        var btn = item.getElementsByName(event.currentTarget.name)[0].disabled=true;
        var btn = item.getElementsByName(event.currentTarget.name)[1].disabled=false;

        event.preventDefault();
        var productId = event.currentTarget.name;
        $.ajax({
            url : "/not_moderated_accept",
            type : 'GET',
            dataType : 'json',
            contentType : "application/json",
            data : ({
                productId : productId
            })
        });
    });


    $(item).on('click','#btn_deny',function(event) {
        var btn = item.getElementsByName(event.currentTarget.name)[0].disabled=false;
        var btn = item.getElementsByName(event.currentTarget.name)[1].disabled=true;

        event.preventDefault();
        var productId = event.currentTarget.name;
        $.ajax({
            url : "/not_moderated_deny",
            type : 'GET',
            dataType : 'json',
            contentType : "application/json",
            data : ({
                productId : productId
            })
        });
    });

</script>
