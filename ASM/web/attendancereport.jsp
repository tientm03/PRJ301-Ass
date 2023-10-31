<%-- 
    Document   : attendancereport
    Created on : Oct 7, 2023, 10:06:17 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        table {
            margin: 0 auto;
            width: 80%;
            text-align: center;
        }

    </style>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <form class="header-logo">
            <img src="image/270052549_1118285278708777_8870144974468907802_n.jpg" alt="alt" width="167px" height="50px"/>
            <img src="image/top601.jpg" alt="alt" width="243.6px" height="30.75px"/>
        </form>
        <br>
        <br>

        <form style="background-color:aliceblue; padding: 5px 8px; margin-bottom: 5px; ">
            <ul class="breadcrumb">

                <span id="home"><a href="#">Home</a>&nbsp;|&nbsp;<b>Attendance Report</b></span>
            </ul>
        </form>
        Attendance Report for class ${requestScope.session.group.name}
        <table border="1" style="margin: 0 auto ;width: 90%;">
            <thead>
                <tr style="background-color: #6B90DA; color: black">

                    <th >ID</th>
                    <th>Name</th>
                        <c:forEach items="${requestScope.sessions}" var="ses">

                        <th>Slot${ses.index}-(${ses.date})</th>

                    </c:forEach>
                    <th>Absent(%)so far</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.student}" var="stu"> 
                    <c:set var="i" value="${i+1}"/>
                    <tr>
                        <td>${stu.id}</td>
                        <td>${stu.name}</td>
                        <c:forEach items="${requestScope.att}" var="att">
                            <c:if test="${att.student.name eq stu.name}">
                                <c:forEach items="${requestScope.sessions}" var="s">
                                    <c:if test="${att.status and s.isAtt}">
                                        <td style="color: green">${att.status?"attend":"absent"}</td>
                                    </c:if>
                                    <c:if test="${!att.status and s.isAtt }">
                                        <td style="color: red">${att.status?"attend":"absent"}</td>
                                    </c:if>
                                    <c:if test="${ !s.isAtt }">
                                        <td style="color: grey">-</td>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        <td>${requestScope.absent[i-1]}</td>
                    </tr>
                </c:forEach>    
            </tbody>
        </table>
    </body>
</html>
