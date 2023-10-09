<%-- 
    Document   : schedule
    Created on : Oct 7, 2023, 10:04:02 PM
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
    background-color: #e9ecef;
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
                
                    <span id="home"><a href="#">Home</a>&nbsp;|&nbsp;<b>Schedule</b></span>
            </ul>
        </form>

        <h1>Schedule</h1>


        <form style="text-align: center">
            Lecturer: <input type="text" name="lecturer" value="" style="text-align: center;"/>
            <br>
            <br>
            Year:
            <select name="Year" >
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option selected="selected" value="2023">2023</option>
                <option value="2024">2024</option>
            </select>
            &nbsp;&nbsp;
            Week
            <select name="SelectWeek">
                <option value="1">02/01 To 08/01</option>
                <option value="2">09/01 To 15/01</option>
                <option value="3">16/01 To 22/01</option>
                <option value="4">23/01 To 29/01</option>
                <option value="5">30/01 To 05/02</option>
                <option value="6">06/02 To 12/02</option>
                <option value="7">13/02 To 19/02</option>
                <option value="8">20/02 To 26/02</option>
                <option value="9">27/02 To 05/03</option>
                <option value="10">06/03 To 12/03</option>
                <option value="11">13/03 To 19/03</option>
                <option value="12">20/03 To 26/03</option>
                <option value="13">27/03 To 02/04</option>
                <option value="14">03/04 To 09/04</option>
                <option value="15">10/04 To 16/04</option>
                <option value="16">17/04 To 23/04</option>
                <option value="17">24/04 To 30/04</option>
                <option value="18">01/05 To 07/05</option>
                <option value="19">08/05 To 14/05</option>
                <option value="20">15/05 To 21/05</option>
                <option value="21">22/05 To 28/05</option>
                <option value="22">29/05 To 04/06</option>
                <option value="23">05/06 To 11/06</option>
                <option value="24">12/06 To 18/06</option>
                <option value="25">19/06 To 25/06</option>
                <option value="26">26/06 To 02/07</option>
                <option value="27">03/07 To 09/07</option>
                <option value="28">10/07 To 16/07</option>
                <option value="29">17/07 To 23/07</option>
                <option value="30">24/07 To 30/07</option>
                <option value="31">31/07 To 06/08</option>
                <option value="32">07/08 To 13/08</option>
                <option value="33">14/08 To 20/08</option>
                <option value="34">21/08 To 27/08</option>
                <option value="35">28/08 To 03/09</option>
                <option value="36">04/09 To 10/09</option>
                <option value="37">11/09 To 17/09</option>
                <option value="38">18/09 To 24/09</option>
                <option value="39">25/09 To 01/10</option>
                <option value="40">02/10 To 08/10</option>
                <option value="41">09/10 To 15/10</option>
                <option value="42">16/10 To 22/10</option>
                <option value="43">23/10 To 29/10</option>
                <option value="44">30/10 To 05/11</option>
                <option value="45">06/11 To 12/11</option>
                <option value="46">13/11 To 19/11</option>
                <option value="47">20/11 To 26/11</option>
                <option value="48">27/11 To 03/12</option>
                <option value="49">04/12 To 10/12</option>
                <option value="50">11/12 To 17/12</option>
                <option value="51">18/12 To 24/12</option>
                <option value="52">25/12 To 31/12</option>
            </select>
            <br><br>
            <input type="submit" value="View" style="text-align: center;" />
        </form>
        <br>

        <table border="1" style="margin: 0 auto ;width: 80%;">
            <thead>
                <tr style="background-color: #6B90DA; color: black">
                    <th align="center"></th>
                    <th align="center">Mon</th>
                    <th align="center">Tue</th>
                    <th align="center">Wed</th>
                    <th align="center">Thu</th>
                    <th align="center">Fri</th>
                    <th align="center">Sat</th>
                </tr>

            </thead>
            <tbody>
                <tr>
                    <th>
                        Slot 1
                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    
                </tr>
                <tr>
                    <th>
                        Slot 2
                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                   
                </tr>
                <tr>
                    <th>
                        Slot 3
                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    
                </tr>
                <tr>
                    <th>
                        Slot 4
                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                    <th>

                    </th>
                   
                </tr>
            </tbody>
            <br><!-- comment -->
            <br>
        </table>

        <br><!-- comment -->
        <br>
        <!--    <li>(<font color="green">attended</font>): you had attended this activity / Bạn đã tham gia hoạt động này</li>
            <li>(<font color="red">absent</font>): you had not attended this activity / Bạn đã không tham gia hoạt động này</li>
            <li>(<font>-</font>): no data / Không có dữ liệu </li>-->
    </body>
</html>
