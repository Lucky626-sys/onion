<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理者首頁</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
    <style>
        body {
            font-family: "Helvetica Neue", "PingFang TC", "微軟正黑體", sans-serif;
            background-color: #f4f9f4;
            text-align: center;
        }
        h1 {
            color: #47694f;
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
            background-color: #d0e2cc;
            color: #2e463e;
            text-decoration: none;
            border-radius: 10px;
            font-size: 18px;
            transition: 0.3s;
        }
        .menu-box a:hover {
            background-color: #c0d5bb;
        }
    </style>
</head>
<body>

    <%@ include file="/WEB-INF/view/onion/menu.jsp" %>

    <h1>管理者 ${sessionScope.userDTO.username}，您好！</h1>
    <div class="menu-box">
        📦 <a href="/JavaWebCart/product/list">商品管理</a>
        🧮 <a href="/JavaWebCart/product/statistics">統計分析</a>
        👥 <a href="/JavaWebCart/finance/report">營業額與成本控制</a>
        🚪 <a href="/JavaWebCart/user/logout">登出</a>
    </div>

</body>
</html>