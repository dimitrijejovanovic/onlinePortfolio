<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
    <head>
       

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">


        <link href="<c:url value='/static/css/onlineportfolio.css' />"  rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>${user.username} profile</title>

    </head>
    <body>
        <%@ include file="/WEB-INF/views/headerOp.jsp" %> 
        <div class="naslov">
            <h2>${user.firstName}, ${user.lastName}, ${user.username} </h2><br>
            <p>${user.aboutMe}</p>
            <a href="myProfile/newProject"> make new project </a>
            <br>
            <a href="myProfile/edit"> edit profile </a>
        </div>
        <br><br>
        <div class="project_container">
            <h3><sp:message code="label.listOfProjects"/></h3>

            <c:forEach items="${projects}" var="project">
                <div  class="one_projects" style="background-image: url(static/${project['coverImage']});">

                    <h4 ><a href='${project["id"]}'>${project["title"]}</a></h4>
                        <c:if test="${project['visible']==false}">
                        <p style="color: red;"> <sp:message code="label.disabled"/> </p>
                    </c:if>
                    <div> 
                        <c:forEach items="${project['fieldCollection']}" var="field">

                            <p><sp:message code='label.${field["name"]}'/></p>  

                        </c:forEach>
                    </div>
                    <a href='myProfile/hide/${project["id"]}'><p> <sp:message code="label.disable"/></p></a>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
