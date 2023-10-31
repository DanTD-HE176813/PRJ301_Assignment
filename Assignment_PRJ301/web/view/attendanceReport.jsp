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
        <c:set var="NumOAbsent" value="3" />
        <c:set var="absentPercent" value="0" />
 
        <form action="attendanceReport" method="POST">
            <table>
                <tr>
                    <th>Student</th>
                    <!--                    <th>Attendance</th>
                                        <th>% (Absent)</th>-->
                </tr>
                <c:forEach items="${requestScope.students}" var="a">
                    <tr>
                    <input type="hidden" value="${a.id}" name="astuid"/>
                    <td>${a.name}</td>
                    <td> 
                        <c:forEach items="${requestScope.attendanceinfo}" var="b">
                            <input type="hidden" value="${b.student.id}" name="bstuid"/>
                            <c:if test="${a.id == b.student.id}">  
                            <td>${b.status}</td>  
                        </c:if>
                    </c:forEach>
                    </td>
                    <td> 
                        <c:forEach items="${requestScope.attendanceinfo}" var="b">
                            <input type="hidden" value="${b.student.id}" name="bstuid"/>
                            <c:if test="${a.id == b.student.id}">  
                                <c:if test="${b.status}">
                                    <c:set var="NumOAbsent" value="${NumOAbsent - 1}" />  
                                </c:if>


                            </c:if>
                        </c:forEach>
                        
                        <c:set var="absentPercent" value="${Math.floor((NumOAbsent / 3)*100)}" /> 
                    <td>${absentPercent}
                        <c:set var="NumOAbsent" value="3" />
                        <c:set var="absentPercent" value="0" /></td> 
                    </td>
                    </tr>
                </c:forEach>
            </table>
            <input type="hidden" value="${requestScope.ses.id}" name="sesid" />
            <input type="button" id="saveButton" value="Back to home" onclick="TinChuanRoiA()" />
        </form>


    </body>
</html>
