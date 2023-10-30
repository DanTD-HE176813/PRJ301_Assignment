<%-- 
    Document   : timetable
    Created on : Oct 18, 2023, 2:16:05 PM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        /* Define CSS styles here */
        form {
            margin: 10px 0;
        }

        input[type="date"] {
            width: 150px;
            padding: 5px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 8px;
            text-align: center;
        }

        .custom-form {
            margin: 10px 0;
        }

        .custom-input {
            width: 150px;
            padding: 5px;
        }

        .custom-table {
            border-collapse: collapse;
            width: 100%;
        }

        .custom-table, .custom-table th, .custom-table td {
            border: 1px solid black;
        }

        .custom-table th, .custom-table td {
            padding: 8px;
            text-align: center;
        }
    </style>
    <body>
        <form action="schedule" method="GET">
            <input type="hidden" name="id" value="${id}"/>
            From <input type="date" value="${requestScope.from}" name="from" class="custom-input"/> 
            To <input type="date" value="${requestScope.to}" name="to" class="custom-input"/> 
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
                    <td>${s.id}-${s.description}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="k">
                                <c:if test="${k.date eq d and k.slot.id eq s.id}">
                                    <a href="attendance">
                                        ${k.group.name}-${k.group.subject.name}-${k.room.id}
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
