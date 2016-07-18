<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<html>
    <head>
        <link href="<c:url value='/static/css/onlineportfolio.css' />"  rel="stylesheet"/>
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>

        <script>
            function validateLength(inputElement, min, max) {
                var inputText = inputElement.value;

                if (inputText.length < min || inputText.length > max) {
                    inputElement.style = "border-color: red;";

                    return false;
                } else {
                    inputElement.style = "border-color: none;";

                    return true;
                }
            }

            function validateEmail(inputElement) {
                var inputText = inputElement.value;

                var regularExpression = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;

                if (regularExpression.test(inputText)) {
                    inputElement.style = "border-color: none; color: black;";

                    return true;
                } else {
                    inputElement.style = "border-color: red; color: red;";

                    return false;
                }
            }

            function validateForm() {
                var nameElement = document.forms["registerForm"]["name"];
                if (!validateLength(nameElement, 5, 20)) {
                    return false;
                }

                var emailElement = document.forms["registerForm"]["email"];
                if (!validateEmail(emailElement)) {
                    return false;
                }

                var usernameElement = document.forms["registerForm"]["username"];
                if (!validateLength(usernameElement, 5, 20)) {
                    return false;
                }

                var passwordElement = document.forms["registerForm"]["password"];
                if (!validateLength(passwordElement, 5, 20)) {
                    return false;
                }

                return true;
            }
        </script>

    </head>

    <body>
        <%@ include file="/WEB-INF/views/headerOp.jsp" %> 
        
        <div>
            <form:form name="registerForm" method="POST" action="register" 
                       commandName="newUser" onsubmit="return validateForm()" 
                       class="form-horizontal">

                <div class="form-group form-group-lg">
                    <label  class="col-lg-2 control-label"><sp:message code="label.register"/></label>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label"><sp:message code="label.firstname"/></label>

                    <div class="col-sm-3">
                        <form:input path="firstName" onchange="validateLength(this, 2, 24)" 
                                    class="form-control" placeholder=""/>
                    </div>

                    <div class="col-sm-3">
                        <form:errors path="firstName" />
                    </div>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label"><sp:message code="label.lastname"/></label>

                    <div class="col-sm-3">
                        <form:input path="lastName" onchange="validateLength(this, 2, 24)" 
                                    class="form-control" placeholder=""/>
                    </div>

                    <div class="col-sm-3">
                        <form:errors path="lastName" />
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">e-mail</label>
                    <div class="col-sm-3">
                        <form:input path="email" onchange="validateEmail(this)" 
                                    class="form-control" placeholder="" />
                    </div> 

                    <div class="col-sm-3">
                        <form:errors path="email" />
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label"><sp:message code='label.username'/></label>
                    <div class="col-sm-3">
                        <form:input path="username" onchange="validateLength(this, 5, 24)" 
                                    class="form-control" placeholder="" />
                        <span> ${usernameError}</span>
                    </div>



                    <div class="col-sm-3">
                        <form:errors path="username" />
                    </div>
                </div>


                <div class="form-group">
                    <label  class="col-sm-2 control-label"><sp:message code='label.city'/></label>
                    <div class="col-sm-3">
                        <form:input path="city" class="form-control" placeholder="" />
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label"><sp:message code='label.country'/></label>
                    <div class="col-sm-3">
                        <form:input path="country" class="form-control" placeholder="" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label"><sp:message code='label.password'/></label>
                    <div class="col-sm-3">
                        <form:password path="password" onchange="validateLength(this, 5, 20)" 
                                       class="form-control" placeholder="" />
                    </div>

                    <div class="col-sm-3">
                        <form:errors path="password" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label"><sp:message code='label.aboutme'/></label>
                    <div class="col-sm-3">
                        <form:textarea path="aboutMe" class="form-control" placeholder="" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="<sp:message code='label.registerButton'/>" class="btn btn-default" >
                    </div>
                </div>

            </form:form>
        </div>
        
         <%@ include file="/WEB-INF/views/footerOp.jsp" %> 
    </body>
</html>
