<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Buổi Học</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 10px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Quản lý Buổi Học</h1>
    <ul>
        <li>
            Buổi học Thứ Hai
            <button onclick="diemDanh(this)">Điểm Danh</button>
        </li>
        <li>
            Buổi học Thứ Ba
            <button onclick="diemDanh(this)">Điểm Danh</button>
        </li>
        <li>
            Buổi học Thứ Tư
            <button onclick="diemDanh(this)">Điểm Danh</button>
        </li>
        <li>
            Buổi học Thứ Năm
            <button onclick="diemDanh(this)">Điểm Danh</button>
        </li>
        <li>
            Buổi học Thứ Sáu
            <button onclick="diemDanh(this)">Điểm Danh</button>
        </li>
    </ul>

    <script>
        function diemDanh(button) {
            button.textContent = "Đã Điểm Danh";
            button.disabled = true;
        }
    </script>
</body>
</html>
