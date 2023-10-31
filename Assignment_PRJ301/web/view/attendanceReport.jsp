<%-- 
    Document   : attendanceReport
    Created on : Oct 31, 2023, 8:30:35 AM
    Author     : Laptop
--%>

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
        
        table {
            border-collapse: collapse;
            width: 100%;
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
        }

        input[type="radio"] {
            vertical-align: middle;
        }

        input[type="text"] {
            width: 100%;
        }

        #saveButton {
            margin-top: 10px;
        }
    </style>
</head>

<script>
function TinChuanChuaA() {
    window.location.href = "confirm";
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
    
    <h1>Attendance Form</h1>
    <p>
        Session: ${requestScope.ses.group.name} - ${requestScope.ses.group.subject.name} - Room ${requestScope.ses.room.id}
    </p>
    <form action="attendance" method="GET">
        <table>
            <tr>
                <th>Student</th>
                <th>Status</th>
                <th>Description</th>
                <th>Taking Time</th>
            </tr>
            <c:forEach items="${requestScope.students}" var="a">
                <tr>
                    <input type="hidden" value="${a.student.id}" name="stuid" />
                    <td>${a.student.name}</td>
                    <td>
                        <input type="radio" id="absent_${a.student.id}" name="status${a.student.id}" value="absent"
                            <c:if test="${!a.status}">checked="checked"</c:if> />
                        <label for="absent_${a.student.id}">Absent</label>
                        <input type="radio" id="present_${a.student.id}" name="status${a.student.id}" value="present"
                            <c:if test="${a.status}">checked="checked"</c:if> />
                        <label for="present_${a.student.id}">Present</label>
                    </td>
                    <td><input type="text" value="${a.description}" name="description${a.student.id}" /></td>
                    <td>${a.datetime}</td>
                </tr>
            </c:forEach>
        </table>
        <input type="hidden" value="${requestScope.ses.id}" name="sesid" />
        <input type="submit" id="saveButton" value="Save" onclick="TinChuanChuaA()" />
    </form>
</body>
</html>
