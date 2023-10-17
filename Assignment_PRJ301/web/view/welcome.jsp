<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feature Selection</title>
</head>
<body>
    <h1>Select a Feature</h1>

    <form action="selectedFeature.jsp" method="post">
        <label>
            <input type="button" name="schedule"> View Schedule
        </label><br>
        <label>
            <input type="radio" name="home"> Home
        </label><br>
        <label>
            <input type="radio" name=""> View Attendance
        </label><br>

        <input type="submit" value="Select">
    </form>
</body>
</html>
