<%-- 
    Document   : afterattend
    Created on : Oct 9, 2023, 9:04:07 PM
    Author     : Admin
--%>

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
    <h4>Attendance for (class) with lecturer (lecturer's name) at slot() on (Date),(semester),in (room)</h4>
    <table border="1" style="margin: 0 auto ;width: 80%;">
      <thead>
        <tr style="background-color: #6B90DA; color: black">
          <th>No</th>
          <th>Class</th>
          <th>Code</th>
          <th>Name</th>
          <th style="width: 200px">Image</th>
          <th>Comment</th>
          <th>Status</th>
          <th>Lecturer</th>
          <th>Record time</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>123456</td>
          <td>Tan min htien</td>
          <td>Tan min htien</td>
          <td></td>
          <td>
              <input type="text" name="comment" value=""/>
          </td>
          <td>
              Attend
          </td>
          <td>1</td>
          <td>1</td>
        </tr>
      </tbody>
    </table>
    <br>
    <form style="text-align: center">
    <input style="width: 100px" type="submit" value="Edit" />
    </form>
    </body>
</html>