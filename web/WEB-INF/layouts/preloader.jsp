<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<head>

    <link rel="stylesheet"  href="${contextPath}/resources/css/preloader.css">

</head>

<body>

<div id="hellopreloader">
    <div id="preloader_preload"></div>
    <script type="text/javascript">
        var hellopreloader = document.getElementById("preloader_preload");

        function fadeOutnojquery(el) {
            el.style.opacity = 1;
            var interhellopreloader = setInterval(function () {
                el.style.opacity = el.style.opacity - 0.05;
                if (el.style.opacity <= 0.05) {
                    clearInterval(interhellopreloader);
                    hellopreloader.style.display = "none";
                }
            }, 16);
        }

        window.onload = function () {
            setTimeout(function () {
                fadeOutnojquery(hellopreloader);
            },);
        };
    </script>

</div>

</body>