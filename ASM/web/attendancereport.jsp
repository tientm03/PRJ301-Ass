<%-- 
    Document   : attendancereport
    Created on : Oct 7, 2023, 10:06:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        body, ul, h1 {
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
}

/* Header logo styling */
.header-logo {
    display: flex;
    justify-content: center;
    gap: 10px; /* Space between images */
    padding: 10px 0;
}

.header-logo img {
    max-width: 100%; /* Makes sure images are responsive */
    height: auto;
}

/* Breadcrumb styling */
.breadcrumb {
    background-color: #f4f4f4;
    padding: 8px 15px;
    border-radius: 5px;
    text-align: center;
}

.breadcrumb span {
    font-size: 16px;
}

.breadcrumb a {
    text-decoration: none;
    color: #007BFF;
    transition: color 0.3s ease;
}

.breadcrumb a:hover {
    color: #0056b3;
}

/* Table styling */
table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
}

table, th, td {
    border: 1px solid #aaa;
}

th, td {
    padding: 10px 15px;
    text-align: center;
}

thead {
    background-color: #6B90DA;
    color: black;
}

tbody tr:nth-child(odd) {
    background-color:#f4f4f4
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
        
        <table border="1" style="margin: 0 auto ;width: 80%;">
            <thead>
                <tr style="background-color: #6B90DA; color: black">
                    <th>No</th>
                    <th>Class</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Attendance Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>
                        ABSENT: 0%
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
