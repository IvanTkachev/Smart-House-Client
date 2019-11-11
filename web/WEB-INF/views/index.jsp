<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content=" width=device-width, initial-scale=1.0">

    <title>Shop</title>
    <link rel="stylesheet"  href="resources/css/main.css">
    <link rel="stylesheet"  href="resources/css/bootstrap.css">
    <link rel="stylesheet"  href="resources/css/bootstrap.min.css">
    <script src="http://bootstraptema.ru/_sf/3/394.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>


</head>
<body>


<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">Shop</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="#">Start page</a></li>

                <li><a href="catalog.html">Catalog</a></li>
                <li><a href="about.html">About us</a></li>
                <li><a class="btn btn-default" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">Log in</a></li>

            </ul>


        </div>
    </div>
</div>
<div id="headewrap">
    <div class= "container">
        <div class= "row">
            <div class="col-lg-6">
                <h1>Shop</h1>
                <h2>You can find everything here!</h2>

            </div>
        </div>
    </div>
</div>


<div class= "container">
    <div class="row centered">
        <br></br>
        <div class="col-lg-4">
            <i class="fa fa-heart"></i>
            <h4>Дизайн</h4>
            <p>﻿Старая сказка, время стихов и снов, тихо под маской в дверь постучит любовь</p>

        </div>
        <div class="col-lg-4">
            <i class="fa fa-heart"></i>
            <h4>Дизайн</h4>
            <p>﻿Старая сказка, время стихов и снов, тихо под маской в дверь постучит любовь</p>

        </div>
        <div class="col-lg-4">
            <i class="fa fa-heart"></i>
            <h4>Дизайн</h4>
            <p>﻿Старая сказка, время стихов и снов, тихо под маской в дверь постучит любовь</p>

        </div>

    </div>
</div>

<div class="boxtext">
    <div class="row centered">
        <div class="col-lg-8 col-lg-offset-2"></div>
        <h1>
            It's easy to buy!
            <p>And it's even easier to buy from us!
        </h1>

    </div>
</div>


<div class="futter">
    <div class="row centered">
        <div class="col-lg-8 col-lg-offset-2"></div>
        <h5>
            It's easy to buy!
        </h5>
    </div>
</div>



<div class="modal login" id="loginModal">
    <div class="modal-dialog animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Login in</h4>
                <div class="box">
                    <spring:form method="post"  modelAttribute="userJSP" action="check-user">
                        <spring:input path="name" id="email" class="form-control" type="text" placeholder="Email" name="email"/>
                        <span id="valid">

 					</span>
                        <spring:input path="password" id="password" class="form-control" type="password" placeholder="Password" name="password"/>
                        <spring:button class="btn btn-default btn-login">
                            Login
                        </spring:button>
                    </spring:form>
                </div>
            </div>

        </div>
    </div>
</div>







<script type="text/javascript">$(item).ready(function() {

    $('#email').blur(function() {
        if($(this).val() != '') {
            var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
            if(pattern.test($(this).val())){
                $(this).css({'border' : '1px solid #04f92d'});
                $('#valid').text('');
            } else {
                $(this).css({'border' : '1px solid #ff0000'});
                $('#valid').text('Invalid emaiil');
            }
        } else {
            $(this).css({'border' : '1px solid #ff0000'});
            $('#valid').text('Поле email не должно быть пустым');
        }
    });
})
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>