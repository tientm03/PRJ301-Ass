<%-- 
    Document   : studentlist
    Created on : Oct 7, 2023, 10:05:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <style>
        .header-logo{
            position: relative;
    flex: 0 0 50%;
    display: flex;
    flex-wrap: wrap;
    gap: 24px;
    align-items: center;
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
        <table border="1" style="margin: 0 auto ;width: 80%;">
            <thead>
                <tr style="background-color: #6B90DA; color: black">
                    <th>No</th>
                    <th>Class</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>
            <input type="radio" id="attend" name="status" value="attend" required>
            <label for="attend">Attend</label><br>
            <input type="radio" id="absent" name="status" value="absent">
            <label for="absent">Absent
                    </td>
                </tr>
            </tbody>
        </table>
        <br>
        <form style="text-align: center">
        <input style="width: 100px" type="submit" value="Save" />
        </form>
    </body>
</html>
