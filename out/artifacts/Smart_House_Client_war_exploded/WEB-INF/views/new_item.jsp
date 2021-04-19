<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content=" width=device-width, initial-scale=1.0">

    <title><spring:message code="PAGE_TITLE"/> <spring:message code="new_product"/></title>

</head>

<body>

<%@include file="../layouts/preloader.jsp" %>
<%@include file="../layouts/high_menu_bar.jsp" %>
<script type="text/JavaScript"
        src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js">
</script>

<div class="container content">
    <form id="new-item" method="post"
          action="${pageContext.request.contextPath}/item/add?${_csrf.parameterName}=${_csrf.token}"
          acceptCharset="utf-8" enctype="multipart/form-data">
        <div class="row wrapper-for-product" style="margin-bottom: 40px">
            <div class="col-lg-4">
                <h2 style="margin-left: 18%; color: #122b40; font-family: Impact"><spring:message code="AddProduct"/></h2>
                <label class="btn btn-default col-md-10 col-md-offset-1">
                        <div id="fld">
                            <img src="${contextPath}/resources/img/placeholder-image.png"/>
                        </div>
                        <output id="list"></output>
                    <spring:message code="ADD_FILE"/>
                    <input type="file" accept="image/jpeg,jpg" id="file" name="file"/>
                </label>
                <span id="errorPhoto"></span>
            </div>
            <div class="col-lg-6 description-of-the-product">
                <p class="name-of-product" style="font-family: Impact"><spring:message code="product.characteristics"/></p>

                <div class="col-md-6" style="padding-top: 5%">
                    <div class="form-group row has-feedback">
                        <label class="label-attribute"><spring:message code="TITLE"/></label>
                        <input class="form-control" id="name" name="name" pattern="^[0-9а-яА-ЯёЁa-zA-Z\s-]{1,45}$"
                               placeholder="<spring:message code="TitleDescription"/>"/>
                    </div>
                </div>

                <div class="col-md-7" style="padding-top: 5%">
                    <div class="form-group row has-feedback">
                        <label class="label-attribute"><spring:message code="TYPE"/></label>
                        <select name="type" id="type" class="form-control">
                            <option value="SWITCH">Switch</option>
                            <option value="DIMMER">Dimmer</option>
                        </select>
                    </div>
                </div>

                <div class="col-md-8" style="padding-top: 5%">
                    <div class="form-group row has-feedback">
                        <label class="label-attribute"><spring:message code="TOPIC"/></label>
                        <input class="form-control" id="topic" name="topic"
                               placeholder="<spring:message code="Topic.description"/>"/>
                    </div>
                </div>

                <div class="col-md-9" style="padding-top: 5%">
                    <div class="form-group row has-feedback">
                        <label class="label-attribute"><spring:message code="DESCRIPTION"/></label>
                        <textarea id="summary" class="form-control"
                                  name="summary" placeholder="<spring:message code="Description.description"/>"
                                  maxlength="60" rows="6"></textarea>
                    </div>
                </div>

                <button class="btn btn-success"  type="submit" style="margin-left: 300px; margin-bottom: 10px">
                    <spring:message code="button.send"/></button>
            </div>
        </div>
    </form>


</div>

<%@include file="../layouts/footer_layout.jsp"%>
<script type="text/javascript">
    $(item).on("input",function(ev) {
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
            var pattern = /^[а-яА-ЯёЁa-zA-Z\s]{0,40}$/i;
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