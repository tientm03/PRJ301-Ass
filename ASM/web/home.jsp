<%-- 
    Document   : welcome
    Created on : Oct 22, 2023, 4:15:10 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
            header {
                background-color: rgb(226, 162, 42);
                color: white;
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
                color: white;
                text-decoration: none;
                font-weight: bold;
            }

            nav ul li a:hover {
                text-decoration: underline;
            }
            footer {
                background-color: #333;
                color: white;
                text-align: center;
                padding: 10px 0;
                bottom: 0;
                width: 100%;
            }
            h1{
                text-align: center;
            }
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            .container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            form {
                margin-bottom: 20px;
            }

            input[type="date"] {
                padding: 10px;
                margin: 5px 0;
                width: calc(50% - 22px);
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4caf50;
                color: white;
                border: none;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 12px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            a {
                text-decoration: none;
                color: #007bff;
            }

            a:hover {
                text-decoration: underline;
            }
    </style>
    <script>
        function login(){
            
                window.location="login";
            
        }
        function logout(){
            
                window.location="logout";
            
        }
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        
        <form class="header-logo">
            <img src="image/270052549_1118285278708777_8870144974468907802_n.jpg" alt="alt" width="167px" height="50px"/>
            <img src="image/top601.jpg" alt="alt" width="243.6px" height="30.75px"/>
            
            
            <c:if test="${sessionScope.account eq null}">
                <input type="button" value="Login" onclick="login()"/>
            </c:if>
                <c:if test="${sessionScope.account != null}">
                <input type="button" value="Logout" onclick="logout()"/>
            </c:if>
        </form>
        ${requestScope.logout}
        <br>
                <header>
                    <h1>FPT University Academic Portal </h1>
            <nav>
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="timetable?id=${sessionScope.account.id}">Weekly Timetable</a></li>
                    <li><a href="#">Attendance report</a></li>
                </ul>
            </nav>
        </header>

        <img src="image/z4728851555763_60679aa3faab2ae60daf69d226c0f25d.jpg" alt="alt" style="max-width: 100%;" >
                <footer>
            <div>
                FPT University - since 2006
            </div>
        </footer>
    </body>
</html>
