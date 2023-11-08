<%-- 
    Document   : schedule
    Created on : Oct 7, 2023, 10:04:02 PM
    Author     : Admin
--%>


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

        .breadcrumb-container {
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

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"], select {
            padding: 8px 15px;
            margin-right: 15px;
            border-radius: 5px;
            border: 1px solid #ced4da;
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

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-bottom: 40px;
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

        th {
            background-color: #6B90DA;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TimeTable</title>
    </head>
    
    <header>
        <br>
        <h1>FPT University Academic Portal </h1>
        <nav>
            <ul>
                <li><a href="home">Home</a></li>
                <li><a href="reportatt?iid=${sessionScope.account.id}">Attendance report</a></li>
            </ul>
        </nav>
    </header>

                <h1>TimeTable ${requestScope.us}</h1>


    <form style="text-align: center">
        Lecturer: <input type="text" name="lecturer" value="${sessionScope.account.displayname}" style="text-align: center;"/>
    </form>

    <!--code bang timetable-->
    <form action="timetable" method="GET">
        <input type="hidden" name="id" value="${param.id}"/>
        From <input type="date" value="${requestScope.from}" name="from"/> 
        To <input type="date" value="${requestScope.to}" name="to"/> 
        <input type="submit" value="View"/>
    </form>
    <table border="1px">
        <thead>
            <tr>
                <c:forEach items="${requestScope.day}" var="day">
                    <td>
                        ${day}
                    </td>
                </c:forEach>
                <!--                                        <th rowspan="2"></th>
                                                        <th align="center">Mon</th>
                                                        <th align="center">Tue</th>
                                                        <th align="center">Wed</th>
                                                        <th align="center">Thu</th>
                                                        <th align="center">Fri</th>
                                                        <th align="center">Sat</th>
                                                        <th align="center">Sun</th>-->
            </tr>
            <tr>
                <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        ${d}
                    </td>
                </c:forEach>
            </tr>
        </thead>
        <c:forEach items="${requestScope.slots}" var="s" varStatus="loop">
            <tr>
                <td>Slot ${s.id} (${s.description})</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        <c:forEach items="${requestScope.sessions}" var="k">
                            <c:if test="${k.date eq d and k.slot.id eq s.id}">
                                <a href="att?id=${k.id}">
                                    ${k.group.name}-${k.group.subject.name}-${k.room.id}
                                    <c:if test="${k.isAtt}">
                                        (attended)
                                    </c:if>
                                    <c:if test="${!k.isAtt}">
                                        (not yet)
                                    </c:if>
                                </a>
                            </c:if>
                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>

    </table>
</body>
</html>
