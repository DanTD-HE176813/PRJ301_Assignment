<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Trang Chính</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #ffffdb;
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
        <div class="anh">
            <img id="img" src="img/backgournd.jpg"/>  
        </div>

    </body>
</html>
