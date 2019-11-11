<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

</head>

<body>

<div class="container">
    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading"><spring:message code="registration"/></h2>
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="username" class="form-control" placeholder="Username"
                            autofocus="true"/>
                <form:errors path="username"/>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"
                />
                <form:errors path="password"/>
            </div>
        </spring:bind>

        <spring:bind path="confirmPassword">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="confirmPassword" class="form-control"
                            placeholder="Confirm your password"/>
                <form:errors path="confirmPassword"/>
            </div>
        </spring:bind>

        <spring:bind path="email">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="email" path="email" class="form-control"
                            placeholder="Input your email"/>
                <form:errors path="email"/>
            </div>
        </spring:bind>

        <spring:bind path="secret">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input path="secret" class="form-control"
                            placeholder="Input your secret word"/>
                <form:errors path="secret"/>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="register_button"/></button>
    </form:form>
</div>

</body>