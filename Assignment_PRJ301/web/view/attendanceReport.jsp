<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Attendance Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            header, nav {
                background-color: #FF6600;
                color: #fff;
                text-align: center;
            }

            header {
                padding: 20px;
            }

            nav {
                padding: 10px 0;
            }

            nav a {
                text-decoration: none;
                color: #fff;
                margin: 10px;
                font-size: 18px;
            }

            nav a:hover {
                text-decoration: underline;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                margin: 20px auto;
            }

            table, th, td {
                border: 1px solid black;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #f0f0f0;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #e0e0e0;
            }

            td:contains("Absent") {
                color: red;
            }

            td:contains("Present") {
                color: green;
            }

            td:contains("not yet") {
                color: orange;
            }

            input[type="radio"] {
                vertical-align: middle;
            }

            input[type="text"] {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            #saveButton {
                margin: 10px auto;
                display: block;
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            #saveButton:hover {
                background-color: #45a049;
            }

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            header {
                background-color: #FF6600;
                color: #fff;
                padding: 20px;
                text-align: center;
            }
            nav {
                background-color: #444;
                text-align: center;
                padding: 10px 0;
            }
            nav a {
                text-decoration: none;
                color: #fff;
                margin: 10px;
                font-size: 18px;
            }
            nav a:hover {
                text-decoration: underline;
            }


            img {
                max-width: 66%;
                height: auto;
                padding-left:50px;
            }
            
        </style>
    </head>
    <script>
        function TinChuanRoiA() {
            window.location.href = "home";
        }
    </script>
    <body>
        <header>
            <h1>FPT University Academic Portal</h1>
        </header>
        <nav>
            <a href="home">Home</a>
            <a href="schedule">Schedule</a>
            <a href="report">Attendance Report</a>
            <a href="logout">Logout</a>
        </nav>
        <c:set var="NumOAbsent" value="0" />
        <c:set var="Total" value="0" />

        <form action="attendanceReport" method="POST">
            <table>
                <tr>
                    <th>Student</th>
                        <c:forEach items="${requestScope.index}" var="i">
                        <th>Slot ${i.index}</th>
                        </c:forEach>
                    <th>% (Absent)</th>
                </tr>
                <c:forEach items="${requestScope.students}" var="a">
                    <tr>
                        <td>${a.name}</td>
                        <c:forEach items="${requestScope.attendanceinfo}" var="b">

                            <c:if test="${a.id == b.student.id}">  
                                <td>
                                    <c:if test="${b.status == 'false'}">Absent <c:set var="NumOAbsent" value="${NumOAbsent + 1}" /> </c:if>
                                    <c:if test="${b.status == 'true'}">Present</c:if>
                                    <c:set var="Total" value="${Total + 1}" />
                                </td>
                            </c:if>
                        </c:forEach> 
                        <c:forEach items="${requestScope.notyet}">
                            <td>  not yet </td> 
                            <c:set var="Total" value="${Total + 1}" />
                        </c:forEach>
                        <td>
                            ${Math.floor((NumOAbsent / Total)*100)}
                            <c:set var="NumOAbsent" value="0" />
                            <c:set var="Total" value="0" />
                        </td> 
                    </tr>
                </c:forEach>
            </table>
            <input type="button" id="saveButton" value="Back to home" onclick="TinChuanRoiA()" />
        </form>


    </body>
</html>
