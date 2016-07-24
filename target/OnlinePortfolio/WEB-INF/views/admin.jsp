<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="sp" %>
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

        <title>admin</title>

    </head>
    <body>
        <%@ include file="/WEB-INF/views/headerOp.jsp" %> 
        <div class="naslov">
            <h2>${user.firstName} ${user.lastName}, ${user.username} </h2><br>
            <p>${user.aboutMe}</p>
        </div>


        <div class="lefter">
            <h3>List of projects:</h3>

            <c:forEach items="${projects}" var="project">
                <div>
                    <p>${project["title"]}</p>
                    <a href="admin/hide/${project["id"]}">hide</a>
                </div>
            </c:forEach>
        </div>
            
        <div class="lefter">
            <h3>List of hidden projects:</h3>

            <c:forEach items="${nprojects}" var="nproject">
                <div>
                    <p>${nproject["title"]}</p>
                    <a href="admin/show/${nproject["id"]}">show</a>
                </div>
            </c:forEach>
        </div>

        <div class="lefter">
            <h3>List of active users:</h3>

            <c:forEach items="${users}" var="user">
                <div>
                    <p >${user["username"]}: ${user["state"]}</p>
                    <a href="admin/deactivate/${user["id"]}">make inactive</a>
                    <br>
                </div>
            </c:forEach>
        </div>
        
        <div class="lefter">
            <h3>List of inactive users:</h3>

            <c:forEach items="${nusers}" var="nuser">
                <div>
                    <p >${nuser["username"]}: ${nuser["state"]}</p>
                    <a href="admin/activate/${nuser["id"]}">make active</a>
                    <br>
                </div>
            </c:forEach>
        </div>
    
    <%@ include file="/WEB-INF/views/footerOp.jsp" %> 
</body>
</html>