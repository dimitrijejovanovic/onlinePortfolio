<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
    <head>
        <base href="/OnlinePortfolio/"/>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">


        <link href="<c:url value='/static/css/onlineportfolio.css' />"  rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>${project.title}</title>

    </head>
    <body>
        <%@ include file="/WEB-INF/views/headerOp.jsp" %> 
        <div class="clear_all"></div>

        <div class="naslov">
            <h1>${project.title}</h1>
            <p>author: ${user.firstName} ${user.lastName} </p><br>


            <c:forEach items="${project['fieldCollection']}" var="field">
                <p>${field["name"]}</p>
            </c:forEach>

            <br>
            <p>${project.description}</p>
        </div>
        
        <c:forEach items="${project['imageCollection']}" var="image">
            <hr>
            <div class="slika">
                <img src='static/${image["src"]}'>
            </div>
        </c:forEach>

        <%@ include file="/WEB-INF/views/footerOp.jsp" %> 
    </body>
</html>