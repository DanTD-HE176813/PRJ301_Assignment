
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
            form {
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin: 20px;
            }

            form input[type="date"] {
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            form input[type="submit"] {
                background-color: #FF6600;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

            form input[type="submit"]:hover {
                background-color: #FF4500;
            }

            /* Additional styles for the table (if needed) */
            table {
                border-collapse: collapse;
                width: 100%;
            }

            table, th, td {
                border: 1px solid #ccc;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }
        </style>
    </head>
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
        <form action="schedule" method="GET">
            <input type="hidden" name="id" value="${param.id}"/>
            From <input type="date" value="${requestScope.from}" name="from"/> 
            To <input type="date" value="${requestScope.to}" name="to"/> 
            <input type="submit" value="View"/>
        </form>
        <table border="1px">
            <tr>
                <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        ${d}
                    </td>
                </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="s" varStatus="loop">
                <tr>
                    <td>Slot ${s.id}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="k">
                                <c:if test="${k.date eq d and k.slot.id eq s.id}">
                                    <a href="attendance?id=${k.id}">
                                        ${k.group.name}-${k.group.subject.name}-${k.room.id}
                                        <c:if test="${k.isAtt}">
                                            (attended)
                                        </c:if>
                                        <c:if test="${!k.isAtt}">
                                            (not yet)
                                        </c:if>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
