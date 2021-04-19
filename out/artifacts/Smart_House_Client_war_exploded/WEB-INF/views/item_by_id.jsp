<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content=" width=device-width, initial-scale=1.0">
    <title><spring:message code="PAGE_TITLE"/> <spring:message code="productbyid"/></title>
</head>

<body>

<%@include file="../layouts/preloader.jsp" %>
<%@include file="../layouts/high_menu_bar.jsp" %>
<div class="container content">
    <div class="row wrapper-for-product-in-productbyid">
        <div class="col-lg-4">
            <h2><strong>${itemId.name}</strong></h2>

            <div class="product-img-1">
                <img src="../../resources/img/item.png"/>
            </div>

        </div>
            <div class="col-lg-6 description-of-the-product">
                <p class="name-of-product">
                    <strong><spring:message code="product.characteristics"/></strong>
                </p>
                <div class="wrapper-for-ul">
                    <ul>
                        <li><strong><spring:message code="product.description"/>:</strong></li>
                        <li><strong><spring:message code="OWNER"/>:</strong></li>
                        <li><strong><spring:message code="STATUS"/>:</strong></li>

                    </ul>
                    <ul>
                        <c:if test="${itemId.summary != null}">
                            <li>${itemId.summary}</li>
                        </c:if>
                        <c:if test="${itemId.summary == null}">
                            <li>—</li>
                        </c:if>
                        <c:forEach items="${itemId.owners}" var="owner">
                            <li><a href="${contextPath}/account/${owner.username}">${owner.username}</a></li>
                        </c:forEach>
                        <c:if test="${itemId.type.equals('SWITCH')}">
                            <c:if test="${itemId.status == 0}">
                                <li><spring:message code="STATUS_OFF"/></li>
                            </c:if>
                            <c:if test="${itemId.status == 1}">
                                <li><spring:message code="STATUS_ON"/></li>
                            </c:if>
                        </c:if>
                        <c:if test="${itemId.type.equals('DIMMER')}">
                            <c:if test="${itemId.status == 0}">
                                <li><spring:message code="STATUS_OFF"/></li>
                            </c:if>
                            <c:if test="${itemId.status != 0}">
                                <li><spring:message code="STATUS_ON"/></li>
                            </c:if>
                        </c:if>
                    </ul>

                </div>
                <div style="padding-top: 13%; padding-left: 50%">
                    <c:if test="${itemId.type.equals('SWITCH')}">
                    <c:if test="${itemId.status == 0}">
                    <button id="btn1" value="1" name="itemValue"  class="btn btn-success"
                            style="margin-bottom: 1%; margin-left: 90%">
                        <spring:message code="On"/>
                    </button>
                    </c:if>
                    <c:if test="${itemId.status == 1}">
                    <button id="btn2" value="0" name="itemValue" class="btn btn-warning"
                            style="margin-bottom: 1%; margin-left: 90%">
                        <spring:message code="Off"/>
                    </button>
                    </c:if>
                    </c:if>
                    <c:if test="${itemId.type.equals('DIMMER')}">
                    <input id="slider" class="slider_item" type="range" min="0" max="100"
                           value="${itemId.status}">
                    </c:if>
                </div>
            </div>
    </div>
</div>
<%@include file="../layouts/footer_layout.jsp"%>
</body>

<script>

    jQuery(function($) {
        btn1.onclick = function (event) {
            changeItemValue(event.currentTarget.attributes[1].value)
        }
    });

    jQuery(function($) {
        btn2.onclick = function (event) {
            changeItemValue(event.currentTarget.attributes[1].value)
        };
    });

    jQuery(function($) {
        slider.onmousemove = function (event) {
            changeItemValue(this.value)
        };
        slider.ontouchmove = function (event) {
            changeItemValue(this.value)
        };
    });

    function changeItemValue(value) {
        var itemValue = value;
        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : "/item/update/${itemId.id}?${_csrf.parameterName}=${_csrf.token}",
            data : itemValue,
            dataType : 'json',
            complete:function () {
                // location.reload();
            }
        });
    };

    // $(item).on('click','.icon',function(event) {
    //     event.preventDefault();
    //     var productId = event.currentTarget.id;
    //
    //     $.ajax({
    //         url : "/add-product-to-favorites",
    //         type : "GET",
    //         dataType : 'json',
    //         contentType : "application/json",
    //         data : ({
    //             productId : productId
    //         }),
    //         complete: function () {
    //             $('#' + productId).addClass('icon-green').removeClass('icon');
    //         }
    //     });
    // });

    // $(item).on('click','.icon-green',function(event) {
    //     event.preventDefault();
    //     var productId = event.currentTarget.id;
    //
    //     $.ajax({
    //         url : "/remove-product-from-favorites",
    //         type : "GET",
    //         dataType : 'json',
    //         contentType : "application/json",
    //         data : ({
    //             productId : productId
    //         }),
    //         complete: function () {
    //             $('#' + productId).addClass('icon').removeClass('icon-green');
    //         }
    //     });
    // });

    // $(item).on('click','#btn_accept',function(event) {
    //
    //     var btn = item.getElementsByName(event.currentTarget.name)[0].disabled=true;
    //     var btn = item.getElementsByName(event.currentTarget.name)[1].disabled=false;
    //
    //     event.preventDefault();
    //     var productId = event.currentTarget.name;
    //     $.ajax({
    //         url : "/not_moderated_accept",
    //         type : 'GET',
    //         dataType : 'json',
    //         contentType : "application/json",
    //         data : ({
    //             productId : productId
    //         })
    //     });
    // });


    // $(item).on('click','#btn_deny',function(event) {
    //     var btn = item.getElementsByName(event.currentTarget.name)[0].disabled=false;
    //     var btn = item.getElementsByName(event.currentTarget.name)[1].disabled=true;
    //
    //     event.preventDefault();
    //     var productId = event.currentTarget.name;
    //     $.ajax({
    //         url : "/not_moderated_deny",
    //         type : 'GET',
    //         dataType : 'json',
    //         contentType : "application/json",
    //         data : ({
    //             productId : productId
    //         })
    //     });
    // });

</script>