<%-- 
    Document   : attendancereport
    Created on : Oct 7, 2023, 10:06:17 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Report</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            nav ul {
                list-style-type: none;
                padding: 0;
            }

            nav ul li {
                display: inline;
                margin-right: 20px;
            }

            table {
                margin: 20px auto;
                width: 90%;
                border-collapse: collapse;
            }

            table, th, td {
                border: 1px solid #ccc;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #6B90DA;
                color: black;
            }

            td.green {
                color: green;
            }

            td.red {
                color: red;
            }

            td.grey {
                color: grey;
            }


            form {
                margin: 20px auto;
                text-align: center;
            }

            form select {
                padding: 8px;
                font-size: 16px;
            }



            /* Optional: Add some spacing between form elements */
            form select, form input[type="submit"] {
                margin-bottom: 10px;
            }
            header {
                background-color: #6B90DA;
                color: #333;
                padding: 10px 0;
                text-align: center;
            }
            nav ul {
                list-style-type: none;
                padding: 0;
            }

            nav ul li {
                display: inline;
                margin-right: 20px;
            }

            nav ul li a {
                color: #333;
                text-decoration: none;

            }

            nav ul li a:hover {
                text-decoration: underline;
            }
            input[type="submit"] {
                background-color: #007BFF;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
        </style>
    </head>
    <body>
        <br>
        <header>
            <h1>FPT University Academic Portal </h1>
            <nav>
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="reportatt?iid=${sessionScope.account.id}">Attendance report</a></li>
                </ul>
            </nav>
        </header>
        <h3 style="color:red ;text-align: center">${requestScope.err}</h3>
        <h3>${requestScope.error}</h3>
        <form action="reportatt" method="post">
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
        <br>
        <h4>Attendance Report for class ${requestScope.session.group.name}</h4>

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
                        <c:if test="${requestScope.absent[i-1]>20}">
                            <td style="color: red">    ${requestScope.absent[i-1]}%</td>
                        </c:if> 
                        <c:if test="${requestScope.absent[i-1] eq 20}">
                            <td style="color: yellow">    ${requestScope.absent[i-1]}%</td>
                        </c:if> 
                        <c:if test="${requestScope.absent[i-1]<20}">
                            <td style="color: green">    ${requestScope.absent[i-1]}%</td>
                        </c:if> 
                    </tr>

                </c:forEach>    
            </tbody>
        </table>

    </body>
</html>
