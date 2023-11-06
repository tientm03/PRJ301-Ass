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
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f7f7f7; /* Light gray background */
}

header {
    background-color: rgb(226, 162, 42);;
    color: #fff;
    padding: 10px;
    text-align: center;
}

header h1 {
    margin: 0;
    font-size: 36px;
}

nav ul {
    list-style-type: none;
    padding: 0;
}

nav ul li {
    display: inline;
    margin-right: 10px;
}

nav ul li a {
    text-decoration: none;
    color: #fff;
    font-size: 18px;
}

nav ul li a:hover {
    text-decoration: underline;
}

img {
    display: block;
    margin: 0 auto;
    max-width: 100%;
}

footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
    position: fixed;
    bottom: 0;
    width: 100%;
}
    </style>
    <script>
        function login() {

            window.location = "login";

        }
        function logout() {

            window.location = "logout";

        }
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>

        <br>
        <header>
            <h1>FPT University Academic Portal </h1>
            <nav>
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="timetable?id=${sessionScope.account.id}">Weekly Timetable</a></li>
                    <li><a href="reportatt?iid=${sessionScope.account.id}">Attendance report</a></li>
                        <c:if test="${sessionScope.account eq null}">
                        <li><a href="#"onclick="login()" >Login</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                        <li><a href="#"onclick="logout()" >Logout</a></li>
                        </c:if>
                    <br><br>
                    ${requestScope.logout}
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
