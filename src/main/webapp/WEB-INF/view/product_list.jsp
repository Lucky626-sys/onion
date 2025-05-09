<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>老郭鋪商品展示</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans TC', sans-serif;
            background-color: #f9f7f1;
            color: #333;
            padding: 30px;
        }
        legend {
            font-weight: bold;
            font-size: 1.2em;
            color: #4a4a4a;
        }
        fieldset {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 20px;
            margin: 10px;
            box-shadow: 0 3px 6px rgba(0,0,0,0.05);
        }
        .pure-form input[type="text"],
        .pure-form input[type="number"],
        .pure-form input[type="file"] {
            margin-bottom: 10px;
            width: 90%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .pure-form button {
            background-color: #7ca982;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 6px;
            cursor: pointer;
        }
        .pure-form button:hover {
            background-color: #5e8b6f;
        }
        #preview {
            margin-top: 10px;
            max-width: 200px;
            max-height: 200px;
            border: 1px solid #ccc;
            padding: 5px;
            border-radius: 8px;
        }
        table.pure-table {
            width: 100%;
            margin-top: 10px;
        }
        table.pure-table th {
            background-color: #f0ebe3;
            color: #555;
            text-align: center;
        }
        table.pure-table td {
            background-color: #fff;
            text-align: center;
            vertical-align: middle;
        }
        table.pure-table tr:hover {
            background-color: #e3f2f1;
        }
        a {
            color: #a94442;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/view/onion/menu.jsp" %>
    
    <div class="pure-form">
        <table width="100%">
            <tr>
                <td style="width: 40%; vertical-align: top;">
                    <fieldset>
                        <legend>📦 商品表單</legend>
                        <form enctype="multipart/form-data" method="post" action="/JavaWebCart/product/add">
                            商品名稱：<input type="text" id="productName" name="productName" required><br/>
                            商品價格：<input type="number" id="price" name="price" required min="1" max="200"><br/>
                            商品庫存：<input type="number" id="qty" name="qty" required min="1" max="999999"><br/>
                            商品照片：<input type="file" id="productImage" name="productImage" required><br/>
                            <img id="preview" alt="照片預覽" style="display: none;" /><br/>
                            <button type="submit">新增商品</button>
                        </form>
                    </fieldset>
                </td>
                <td style="width: 60%; vertical-align: top;">
                    <fieldset>
                        <legend>🛒 商品列表</legend>
                        <table class="pure-table pure-table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th><th>名稱</th><th>價格</th>
                                    <th>庫存</th><th>成本</th><th>圖片</th><th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="productDTO" items="${productDTOs}">
                                    <tr>
                                        <td>${productDTO.productId}</td>
                                        <td>${productDTO.productName}</td>
                                        <td>${productDTO.price}</td>
                                        <td>${productDTO.qty}</td>
                                        <td>${productDTO.total}</td>
                                        <td><img width="80" src='data:image/png;base64,${productDTO.imageBase64}'></td>
                                        <td><a href="/JavaWebCart/product/delete?productId=${productDTO.productId}">刪除</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>

    <script>
        document.getElementById('productImage').addEventListener('change', function(event) {
            const fileInput = event.target;
            const file = fileInput.files[0];
            const fileName = file?.name || '';
            const regex = /^.(\d+)([^\d].*[^\d])(\d+)\.png$/;
            const match = fileName.match(regex);

            if (match) {
                const [_, qty, name, price] = match;
                document.getElementById('qty').value = qty;
                document.getElementById('productName').value = name;
                document.getElementById('price').value = price;
            } else {
                document.getElementById('qty').value = '';
                document.getElementById('productName').value = '';
                document.getElementById('price').value = '';
            }

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.getElementById('preview');
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                };
                reader.readAsDataURL(file);
            } else {
                document.getElementById('preview').style.display = 'none';
            }
        });
    </script>
</body>
</html>