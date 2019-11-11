<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<head>

    <title><spring:message code="PAGE_TITLE"/> <spring:message code="headerMenuAllProfiles"/></title>

</head>

<body>

<link rel="stylesheet" href="${contextPath}/resources/css/account.css"/>

<script type="text/JavaScript"
        src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js">
</script>

<div class="container content">
    <div class="col-lg-10 products">
        <c:forEach items="${profiles}" var="profiles">
            <div class="col-sm-10">
                <div class="well profile">
                    <div class="col-sm-12">
                        <div class="col-xs-12 col-sm-8">
                            <h2>${user.username}</h2>
                            <p><strong><spring:message code="full_name"/>: </strong>${profiles.fio!=null && !profiles.fio.equals("") ? profiles.fio : "--"}</p>
                            <p><strong><spring:message code="from"/>: </strong>${profiles.city!=null && !profiles.city.equals("") ? profiles.city : "--"}</p>
                            <p><strong><spring:message code="email"/>: </strong>${profiles.email!=null && !profiles.email.equals("") ? profiles.email : "--"}</p>
                            <p><strong><spring:message code="telephone_number"/>: </strong>${profiles.telephone!=null && !profiles.telephone.equals("") ? profiles.telephone : "--"}</p>
                            <p><strong><spring:message code="sex"/>: </strong>${profiles.sex!=null && !profiles.sex.equals("") ? profiles.sex : "--"}</p>
                            <p><strong><spring:message code="date_of_birth"/>: </strong>${profiles.dateOfBirth!=null && !profiles.dateOfBirth.equals("") ? profiles.dateOfBirth : "--"}</p>

                        <div class="btn-group">
                                <c:if test="${profiles.status.equals('BLOCKED')}">
                                    <button name="${profiles.id}" id="statusBlocked"  type="button" class="btn btn-primary btn-accept"><spring:message
                                            code="profileButtonUnblocked"/></button>
                                </c:if>
                                <c:if test="${profiles.status.equals('BLOCKED')}">
                                    <button name="${profiles.id}" id="statusBlocked"  disabled="true"  type="button" class="btn btn-primary btn-accept"><spring:message
                                            code="profileButtonBlocked"/></button>
                                </c:if>
                                <c:if test="${profiles.status.equals('UNBLOCKED')}">
                                    <button name="${profiles.id}" id="statusUnblocked"  disabled="true" type="button" class="btn btn-primary btn-accept" onclick="changeStatus()"><spring:message
                                            code="profileButtonUnblocked"/></button>
                                </c:if>
                                <c:if test="${profiles.status.equals('UNBLOCKED')}">
                                    <button name="${profiles.id}" id="statusUnblocked"  type="button" class="btn btn-primary btn-accept" onclick="changeStatus()"><spring:message
                                            code="profileButtonBlocked"/></button>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 text-center">
                            <figure>
                                <div class="wrapper-for-img">
                                    <img src="https://drive.google.com/uc?export=download&confirm=no_antivirus&id=${profiles.photo}"
                                         onerror="this.src='${contextPath}/resources/img/placeholder-image.png'"/>
                                </div>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>




<script>
    $(item).on('click','#statusBlocked',function(event) {

        if (item.getElementsByName(event.currentTarget.name)[0].disabled==true){
            var btn = item.getElementsByName(event.currentTarget.name)[0].disabled=false;
            var btn = item.getElementsByName(event.currentTarget.name)[1].disabled=true;
        }
        else{
            var btn = item.getElementsByName(event.currentTarget.name)[0].disabled=true;
            var btn = item.getElementsByName(event.currentTarget.name)[1].disabled=false;
        }

        event.preventDefault();
        var profileId = event.currentTarget.name;
        $.ajax({
            url : "/blocked",
            type : 'GET',
            dataType : 'json',
            contentType : "application/json",
            data : ({
                profileId : profileId
            }),
        });
    });


    $(item).on('click','#statusUnblocked',function(event) {

        if (item.getElementsByName(event.currentTarget.name)[0].disabled==true){
            var btn = item.getElementsByName(event.currentTarget.name)[0].disabled=false;
            var btn = item.getElementsByName(event.currentTarget.name)[1].disabled=true;
        }
        else{
            var btn = item.getElementsByName(event.currentTarget.name)[0].disabled=true;
            var btn = item.getElementsByName(event.currentTarget.name)[1].disabled=false;
        }

        event.preventDefault();
        var profileId = event.currentTarget.name;
        $.ajax({
            url : "/unblocked",
            type : 'GET',
            dataType : 'json',
            contentType : "application/json",
            data : ({
                profileId : profileId
            }),
        });
    });

</script>

