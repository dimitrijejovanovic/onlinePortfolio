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

        <title>online portfolio</title>

    </head>
    <body>
        <%@ include file="/WEB-INF/views/headerOp.jsp" %> 

            <ul class="fields">
                <h3><sp:message code="label.listOfFields"/></h3>
                <c:forEach items="${fields}" var="field">
                    <a href='field/${field["name"]}'><li><sp:message code='label.${field["name"]}'/></li></a>
                        </c:forEach>
            </ul>

            <div class="project_container">
                <h3><sp:message code="label.listOfProjects"/></h3>

                <c:forEach items="${projects}" var="project">
                    <div  class="one_projects" style="background-image: url(static/${project['coverImage']});">

                        <h4 ><a href='${project["id"]}'>${project["title"]}</a></h4>

                        <div> 
                            <c:forEach items="${project['fieldCollection']}" var="field">

                                <p><sp:message code='label.${field["name"]}'/></p>  

                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
               
                <%@ include file="/WEB-INF/views/footerOp.jsp" %> 
    </body>
</html>