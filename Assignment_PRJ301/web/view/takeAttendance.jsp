<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }

            h1 {
                text-align: center;
                margin-top: 20px;
            }

            table {
                width: 80%;
                margin: 0 auto;
                background-color: #fff;
                border-collapse: collapse;
                border-radius: 5px;
            }

            th {
                background-color: #4287f5;
                color: #fff;
                padding: 10px;
            }

            td {
                padding: 10px;
            }

            input[type="radio"] {
                margin-right: 5px;
            }

            label {
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:nth-child(odd) {
                background-color: #fff;
            }
            
        </style>
    </head>
    <body>
        <h1>Điểm Danh Sinh Viên</h1>
        <form action="processAttendance.jsp" method="post">
            <table>
                <tr>
                    <th>Name</th>
                    <th>ID</th>
                    <th>Điểm danh</th>
                </tr>
                <c:forEach items="${requestScope.students}" var="s">
                    <tr>
                        <td>${s.name}</td>
                        <td>${s.id}</td>
                        <td>
                            <input type="radio" id="attendance_${s.id}" name="attendance_${s.id}" value="Present" checked>
                            <label for="attendance_${s.id}">Present</label>
                            <input type="radio" id="absent_${s.id}" name="attendance_${s.id}" value="Absent">
                            <label for="absent_${s.id}">Absent</label>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <input type="submit" value="Gửi Điểm Danh">
        </form>
    </body>
</html>
