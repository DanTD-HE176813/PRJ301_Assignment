<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Điểm Danh Sinh Viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        td {
            text-align: center;
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
    <h1>Điểm Danh Sinh Viên</h1>
    <table>
        <thead>
            <tr>
                <th>Tên Sinh Viên</th>
                <th>Điểm Danh</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Nguyễn Văn A</td>
                <td><button onclick="diemDanh(this)">Điểm Danh</button></td>
            </tr>
            <tr>
                <td>Trần Thị B</td>
                <td><button onclick="diemDanh(this)">Điểm Danh</button></td>
            </tr>
            <button type="submit">save</button>
            <!-- Thêm các hàng khác cho các sinh viên khác -->
        </tbody>
    </table>

    <script>
        function diemDanh(button) {
            button.textContent = "Đã Điểm Danh";
            button.disabled = true;
        }
    </script>
</body>
</html>
