<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resources/css/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/catalog.css">
</head>
<body>
<div class="container">
    <!--<section style="height:80px;"></section>-->
    <!----------- Footer ------------>
    <footer class="footer-bs">
        <div class="row">
            <div class="col-md-3 footer-brand animated fadeInLeft">
                <h2><spring:message code="headerShop"/></h2>
                <p> <spring:message code="text_netcufar_footer"/><br>
                <p>© 2019, <spring:message code="text_all_rights"/></p>
            </div>
            <div class="col-md-4 footer-nav animated fadeInUp">
                <h4><spring:message code="Menu"/> </h4>
                <div class="col-md-6">
                    <ul class="pages">
                        <li><a href="${contextPath}/account"><spring:message code="account"/></a></li>
                        <li><a href="${contextPath}/my_items"><spring:message code="my_product"/></a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul class="list">
                        <li><a href="#"><spring:message code="headerAbout"/></a></li>
                        <li><a href="#"><spring:message code="Contacts"/></a></li>
                        <li><a href="#">Terms & Condition</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 footer-social animated fadeInDown">
                <h4><spring:message code="Follow"/></h4>
                <ul>
                    <li><a href="https://www.facebook.com/NetCufar-135593383784441/">Facebook</a></li>
                    <li><a href="https://twitter.com/NetCufar_Group">Twitter</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-ns animated fadeInRight">
                <h4><spring:message code="Items"/></h4>
                <p></p>
                <p>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="<spring:message code="headerSearch"/>">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-envelope"></span></button>
                      </span>
                </div><!-- /input-group -->
                </p>
            </div>
        </div>
    </footer>

</div>
</body>
</html>
