<%-- 
    Document   : studentlist
    Created on : Oct 7, 2023, 10:05:32 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            padding: 20px;
            background-color: #f8f9fa;
            color: #333;
        }

        .header-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .header-logo img {
            max-width: 100%;
            height: auto;
        }

        form.breadcrumb-container {
            background-color: #e9ecef;
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 30px;
        }

        .breadcrumb {
            list-style: none;
            padding: 0;
            margin: 0;
            font-size: 16px;
        }

        .breadcrumb span a {
            color: #007BFF;
            text-decoration: none;
        }

        .breadcrumb span a:hover {
            text-decoration: underline;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #dee2e6;
        }

        thead {
            background-color: #6B90DA;
            color: black;
        }

        th, td {
            padding: 10px 15px;
            text-align: center;
        }

        form.save-container {
            text-align: center;
            margin-top: 30px;
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

        input[type="submit"]:hover {
            background-color: #0056b3;
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

                <span id="home"><a href="#">Home</a>&nbsp;|&nbsp;<a href="#">Schedule</a>&nbsp;|&nbsp;<b>Attendance Activities</b></span>
            </ul>
        </form>

        <h1>Student List</h1>
        <h4>        ${requestScope.ses.group.name}-${requestScope.ses.group.subject.name}-${requestScope.ses.room.id}
        </h4>
        ${requestScope.id}
        <form action="att" method="POST">
            <table border="1" style="margin: 0 auto ;width: 80%;">
                <thead>
                    <tr style="background-color: #6B90DA; color: black">
                        <th>No</th>
                        <th>Class</th>
                        <th>Code</th>
                        <th>Name</th>
                        <th style="width: 200px">Image</th>
                        <th>Status</th>
                        <td>Comment</td>
                        <td>Taking Time</td>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.atts}" var="a" >
                        <c:set var="i" value="${i+1}"/>
                        <tr>
                            <td>${i}</td>
                            
                            <td style="color: blue">${requestScope.ses.getGroup().getName()}</td>
                            
                            <td style="color: #007BFF">${a.student.id}</td>
                            
                            <td style="color: blue">
                                ${a.student.name}
                                <input type="hidden" name="stuid" value="${a.student.id}"/>
                            </td>
                            <td></td>
                            <td>
                                <input type="radio"
                                       <c:if test="${!a.status}">
                                           checked="checked"
                                       </c:if>
                                       name="status${a.student.id}" value="absent" />
                                <label for="status${a.student.id}" style="color: red;">absent</label>
                                <br>
                                &nbsp;<input type="radio"
                                       <c:if test="${a.status}">
                                           checked="checked"
                                       </c:if>
                                       name="status${a.student.id}" value="present" />
                                <label for="status${a.student.id}" style="color: green;">present</label>
                            </td>
                            <td><input type="text" value="${a.description}" name="description${a.student.id}"/></td>
                            <td>${a.datetime}</td>
                        </tr>   
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
            <input type="submit" value="Save"/>
        </form>



    </body>
</html>
