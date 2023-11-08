<%-- 
    Document   : AttDone
    Created on : Nov 9, 2023, 1:53:48 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
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
        .form-container {
        text-align: center;
        margin-top: 100px;
        font-family: Arial, sans-serif;
    }

    .form-container h4 {
        margin-bottom: 20px;
    }

    .form-container input[type="submit"] {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
    }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>

            <h1>FPT University Academic Portal </h1>
            <br>
            <nav>
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="timetable?id=${sessionScope.account.id}">Weekly Timetable</a></li>
                    <li><a href="reportatt?iid=${sessionScope.account.id}">Attendance report</a></li>
                </ul>
            </nav>
        </header>
        <form action="attdone" method="post" style="text-align: center;">
            <div>
                <h3>Successful Attendance</h3>
                <input type="submit" value="Back To Home" />
            </div>
        </form>

    </body>
</html>
