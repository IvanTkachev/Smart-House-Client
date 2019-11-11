<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>
    <head>
        <title>Title</title>
        <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${contextPath}/resources/css/account.css"/>
    </head>
    <body>
      <div class="row">
         <div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
            <div class="well profile">
                 <div class="col-sm-12">
                     <div class="col-xs-12 col-sm-8">
                         <h2>${user.username}</h2>
                         <p>
                             <strong><spring:message code="full_name"/>:</strong>
                             ${user.fio!=null && !user.fio.equals("") ? user.fio : "--"}
                         </p>
                         <p>
                             <strong><spring:message code="from"/>:</strong>
                             ${user.city!=null && !user.city.equals("") ? user.city : "--"}
                         </p>
                         <p>
                             <strong><spring:message code="email"/>:</strong>
                             ${user.email!=null && !user.email.equals("") ? user.email : "--"}
                         </p>
                         <p>
                             <strong>
                                 <spring:message code="telephone_number"/>:</strong>
                             ${user.telephone!=null && !user.telephone.equals("") ? user.telephone : "--"}
                         </p>
                         <p>
                             <strong><spring:message code="sex"/>:</strong>
                             ${user.sex!=null && !user.sex.equals("") ? user.sex : "--"}
                         </p>
                         <p>
                             <strong><spring:message code="date_of_birth"/>:</strong>
                             ${user.dateOfBirth!=null && !user.dateOfBirth.equals("") ? user.dateOfBirth : "--"}
                         </p>
                     </div>
                     <div class="col-xs-12 col-sm-4 text-center">
                        <figure>
                            <img src="https://drive.google.com/uc?export=download&confirm=no_antivirus&id=${user.photo}"
                                 onerror="this.src='${contextPath}/resources/img/placeholder-image.png'"/>
                        </figure>
                     </div>
                 </div>
                 <div class="col-xs-12 divider text-center">
                     <div class="col-xs-8 col-sm-8 emphasis">
                         <p>
                             <small><spring:message code="Documents"/></small>
                         </p>
                         <a href="${contextPath}/items/${user.username}" class="btn btn-success btn-block" role="button">
                                    <spring:message code="look"/>
                         </a>
                     </div>
                     <div class="col-xs-4 col-sm-4">
                         <security:authorize access="(hasAnyRole('ROLE_ADMIN','ROLE_USER')) and principal.username=='${user.username}'">
                             <div class="col-xs-6 product-icons" style="margin-left: 50%">
                                 <a href="${contextPath}/feedback?${_csrf.parameterName}=${_csrf.token}" class="icon">
                                     <img src="${contextPath}/resources/img/feedback_button.png">
                                 </a>
                             </div>
                             <div class="col-xs-6 product-icons" style="margin-right: 50%">
                                 <a href="${contextPath}/profiles?${_csrf.parameterName}=${_csrf.token}" class="icon">
                                     <img src="${contextPath}/resources/img/pencil.png">
                                 </a>
                             </div>
                         </security:authorize>
                     </div>
                 </div>
            </div>
         </div>
      </div>
    </body>
</html>