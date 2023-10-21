<%-- 
    Document   : absentList
    Created on : Oct 21, 2023, 4:45:51 PM
    Author     : Laptop
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Absent List</title>
</head>
<body>
    <h1>A list of absent students:</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>ID</th>
        </tr>
        <c:forEach items="${absentStudents}" var="student">
            <tr>
                <td>${student.name}</td>
                <td>${student.id}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

