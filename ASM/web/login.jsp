<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style></style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>${requestScope.error}</h3>
        <form action="login" method="POST">
            Username: <input type="text" name="username"/> <br/>
            Password: <input type="password" name="password" /> <br/>
            <input type="checkbox" name="remember" value="remember"/> Remember in this computer.
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>