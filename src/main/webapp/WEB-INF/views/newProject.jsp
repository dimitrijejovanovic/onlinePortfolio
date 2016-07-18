<%-- 
    Document   : newProject
    Created on : Jul 3, 2016, 7:13:04 PM
    Author     : Dimitrije
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <base href="/OnlinePortfolio/myProfile/newProject/">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>New Project</title>
    </head>

    <script>
        var i = 0;

        function duplicate(idValue) {

            if (idValue == 'duplicater' + i) {
                var original = document.getElementById('duplicater' + i);
                var clone = original.cloneNode(true); // "deep" clone
                clone.id = "duplicater" + ++i; // there can only be one element with an ID
                //clone.onclick = duplicate;// event handlers are not cloned
                original.parentNode.appendChild(clone);
            }
        }
    </script>

    <body>

        <div>
            <form:form name="newProjectForm" method="POST" enctype="multipart/form-data" 
                       commandName="newProject" class="form-horizontal">

                <div class="form-group form-group-lg">
                    <label  class="col-lg-2 control-label">NEW PROJECT</label>

                </div>
                <div class="form-group form-group-lg">

                    <label  class="col-sm-2 control-label">Author: ${user1.firstName} ${user1.lastName}</label>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">Fields</label>

                    <div class="col-sm-3">

                        <c:forEach items="${fieldList}" var="field">
                            <div class="active">
                                <input type="checkbox" name="fieldNames" value='${field["name"]}' /> ${field["name"]}
                                <br>
                            </div>
                        </c:forEach>

                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">Title</label>

                    <div class="col-sm-3">

                        <form:input path="title" class="form-control" placeholder="Title"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-3">
                        <form:textarea path="description" class="form-control" placeholder="Project Description" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Upload Cover Image</label>
                    <div class="col-sm-3">
                        <input type="file" name="projectImages" /> 
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Upload Image</label>
                    <div class="col-sm-3">
                        <input id = 'duplicater0' type="file" name="projectImages" onclick="duplicate(this.id)"/> 
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="addProject" class="btn btn-default" >
                    </div>
                </div>

            </form:form>
        </div>
    </body>
</html>
