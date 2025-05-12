<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>點餐者首頁</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
    <style>
        body {
            font-family: "Helvetica Neue", "PingFang TC", "微軟正黑體", sans-serif;
            background-color: #fafaf5;
            text-align: center;
        }
        h1 {
            color: #5d735d;
            margin-top: 40px;
        }
        .menu-box {
            margin: 40px auto;
            max-width: 500px;
        }
        .menu-box a {
            display: block;
            margin: 15px auto;
            padding: 15px;
            background-color: #e0efe3;
            color: #2f4f4f;
            text-decoration: none;
            border-radius: 10px;
            font-size: 18px;
            transition: 0.3s;
        }
        .menu-box a:hover {
            background-color: #cfe3d4;
        }
    </style>
</head>
<body>

    <%@ include file="/WEB-INF/view/onion/menu.jsp" %>

    <h1>歡迎回來，${sessionScope.userDTO.username}！</h1>
    <div class="menu-box">
        🥕 <a href="/JavaWebCart/product/order">訂購商品</a>
        🛒 <a href="/JavaWebCart/product/cart">查看購物車</a>
        🍠 <a href="/JavaWebCart/product/order/history">歷史訂單</a>
        🚪 <a href="/JavaWebCart/user/logout">登出</a>
    </div>

</body>
</html>