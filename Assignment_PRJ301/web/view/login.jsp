<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FPT University</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            width: 300px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #007bff;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .checkbox-label {
            display: flex;
            align-items: center;
        }
        input[type="checkbox"] {
            margin-right: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <header>
            <h2>Đăng Nhập</h2>
        </header>
        <main>
            <form action="login" method="POST">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" name="username" required>

                <label for="password">Mật khẩu:</label>
                <input type="password" name="password" required>

                <label class="checkbox-label" for="remember">
                    <input type="checkbox" id="remember" name="remember">
                    Ghi nhớ đăng nhập
                </label>

                <button type="submit">Đăng Nhập</button>
            </form>
        </main>
    </div>
</body>
</html>
