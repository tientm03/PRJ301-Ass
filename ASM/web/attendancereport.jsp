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
        <form action="reportatt" method="get">
            Group:<select name="gid">

                <c:forEach items="${requestScope.group}" var="group">
                    <option <c:if test="${group.id eq param.gid}">
                            selected="selected"
                        </c:if> value="${group.id}">${group.name}</option>
                </c:forEach>
                <input type="hidden" name="iid" value="${param.iid}"/>
            </select>
            <input type="submit" value="View" /><br>
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
                            <c:if test="${att.student.id eq stu.id}">
                                <c:choose>

                                    <c:when test="${att.status}">
                                        <td style="color: green">${att.status?"attend":"absent"}</td>
                                    </c:when>

                                    <c:when test="${!att.status}">
                                        <td style="color: red">${att.status?"attend":"absent"}</td>
                                    </c:when>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                                    <c:forEach items="${requestScope.sesnotatt}" var="sesnotatt">
                                        <td style="color: grey">-</td>
                                    </c:forEach>                
                        <td>${requestScope.absent[i-1]}%</td>
                    </tr>

                </c:forEach>    
            </tbody>
        </table>

    </body>
</html>
