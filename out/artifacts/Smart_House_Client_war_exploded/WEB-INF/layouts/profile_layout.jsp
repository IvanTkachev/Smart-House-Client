<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="${contextPath}/resources/css/profile.css"/>
</head>

<body>

<script type="text/javascript">$(item).on("input",setTimeout(function(ev) {
    $('#email').on("input", function () {
        var email = item.getElementById('email').value;
        $.ajax({
            url: '/checkEmail',
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            data: {'email': email},
            success: function (data) {
                if (data.toString() == "-1") {
                    $('#errEmail').empty();
                    $('#errEmail').append("<spring:message code="EmailError"/>");
                    $('#email').css({'border': '1px solid #ff0000'});
                }
                else {
                    $('#errEmail').empty();
                    $('#errEmail').append(" ");
                    var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
                    if (pattern.test(email)) {
                        $('#email').css({'border': '1px solid #04f92d'});
                    }
                    else {
                        $('#email').css({'border': '1px solid #ff0000'});
                    }
                }
            }
        });
    });
    $('#telephone').on("input",function () {
        var telephone = item.getElementById('telephone').value;
        $.ajax({
            url: '/checkTelephone',
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            data: {'telephone': telephone},
            success: function (data) {
                if (data.toString() == "-1") {
                    $('#errTelephone').empty();
                    $('#errTelephone').append("<spring:message code="TelephoneError"/>");
                    $('#telephone').css({'border': '1px solid #ff0000'});
                }
                else {
                    $('#errTelephone').empty();
                    $('#errTelephone').append(" ");
                    var pattern = /^((80|\+375|375))(\(?\d{2}\)?)(\d{3}\-?)(\-?\d{2}\-?)(\-?\d{2})$/i;
                    if (pattern.test(telephone)) {
                        $('#telephone').css({'border': '1px solid #04f92d'});
                    }
                    else {
                        $('#telephone').css({'border': '1px solid #ff0000'});
                    }
                }
            }
        });
    });
},1000))
</script>

<script type="text/javascript">
    $(item).ready(function() {
        if(${profiles.sex=='Ж'}) {
            $('#women').attr('checked',true);
        }
        if(${profiles.sex=='М'}) {
            $('#men').attr('checked',true);
        }
    })
</script>

<div class="container content">
    <form:form method="post" action="${pageContext.request.contextPath}/profiles?${_csrf.parameterName}=${_csrf.token}" acceptCharset="utf-8" enctype="multipart/form-data">
        <div class="col-md-5 profile-img">
            <label class="btn btn-default col-md-10 col-md-offset-1">
                <div class="wrapper-for-img">
                    <div id="fld">
                        <img src="https://drive.google.com/uc?export=download&confirm=no_antivirus&id=${profiles.photo}"
                             onerror="this.src='${contextPath}/resources/img/placeholder-image.png'"/>
                    </div>
                    <output id="list"></output>
                </div>
                <spring:message code="profile.addPhoto"/>
                <input type="file" id="file" name="file" />
            </label>
            <span id="errorPhoto"></span>
        </div>
        <div class="col-md-5 ">
            <div class="form-group row">

                <label class="col-2 col-form-label"><spring:message code="profile.fio"/></label>
                <input id="fio" class="form-control" type="text" name="fio" value="${profiles.fio}"/><br>

                <label class="col-2 col-form-label"><spring:message code="profile.email"/></label>
                <input id="email" class="form-control" type="email" name="email" value="${profiles.email}"  />
                <span id="errEmail" name="errEmail"></span><br>

                <label class="col-2 col-form-label"><spring:message code="profile.telephone"/></label>
                <input id="telephone" class="form-control" type="text" name="telephone" value="${profiles.telephone}"/>
                <span id="errTelephone" name="errTelephone"></span><br>

                <label class="col-2 col-form-label"><spring:message code="profile.city"/></label>
                <input id="city" class="form-control" type="text" name="city" value="${profiles.city}"/><br>

                <label class="col-2 col-form-label"><spring:message code="profile.birth"/></label>
                <input class="form-control" type="date" name="dateOfBirth" value="${profiles.dateOfBirth}"  max="2000-12-31" min="1900-01-01"/><br>

                <label class="col-2 col-form-label"><spring:message code="profile.sex"/></label>
                <input type="radio" name="sex"  id="men" value="M"/><spring:message code="profile.man"/>
                <input type="radio" name="sex"  id="women" value="W"/><spring:message code="profile.female"/>

            </div>
            <button id="submit" type="submit" class="btn"><spring:message code="Save"/></button>
        </div>
    </form:form>
</div>


<script type="text/javascript">$(item).on("input",function(ev) {
    $('#city').on("input",function() {
        if($(this).val() != '') {
            var pattern = /^[а-яА-ЯёЁa-zA-Z]{0,20}$/i;
            if(pattern.test($(this).val())){
                $(this).css({'border' : '1px solid #04f92d'});
            } else {
                $(this).css({'border' : '1px solid #ff0000'});
            }
        }
    });
    $('#fio').on("input",function() {
        if($(this).val() != '') {
            var pattern = /^[а-яА-ЯёЁa-zA-Z\s-]{0,40}$/i;
            if(pattern.test($(this).val())){
                $(this).css({'border' : '1px solid #04f92d'});
            } else {
                $(this).css({'border' : '1px solid #ff0000'});
            }
        }
    });
})
</script>
<script>
    function handleFileSelect(evt) {
        var f = evt.target.files;
        if(f[0].size > 1000000){
            $('#errorPhoto').empty();
            $('#errorPhoto').append("<spring:message code="SizeError"/>");
            $('#list').empty();
            $('#list').append("");
            var reader = new FileReader();
            reader.onload = (function() {
                return function() {
                    var span = item.createElement('span');
                    item.getElementById('list').insertBefore(span,null);
                };
            })(f[0]);
            reader.readAsDataURL(f[0]);
        }
        else{
            if (f[0].type.match('image.*')) {
                $('#errorPhoto').empty();
                $('#errorPhoto').append(" ");
                $('#list').empty();
                $('#list').append("");
                var reader = new FileReader();
                reader.onload = (function(theFile) {
                    return function(e) {

                        if (item.getElementById('fld') != null) {
                            var el = item.getElementById('fld');
                            el.parentNode.removeChild(el);
                        }

                        var span = item.createElement('span');
                        item.getElementById('list').insertBefore(span,null);
                        span.innerHTML = ['<img class="thumb" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
                        item.getElementById('list').insertBefore(span, null);
                    };
                })(f[0]);
                reader.readAsDataURL(f[0]);
            }
        }
    }
    item.getElementById('file').addEventListener('change', handleFileSelect, false);
</script>

</body>