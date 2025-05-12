<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<style>
	body {
		font-family: "Helvetica Neue", "PingFang TC", "微軟正黑體", sans-serif;
		margin: 0;
		padding: 0;
	}
	.header {
		background-color: #f0f7f4;
		padding: 20px;
		border-bottom: 1px solid #cce3dc;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.logo {
		font-size: 26px;
		color: #6c8e7f;
		font-weight: bold;
		letter-spacing: 1px;
	}
	.logo span {
		font-size: 14px;
		color: #a0a0a0;
		font-weight: normal;
		display: block;
	}
	.nav-bar {
		padding: 15px 20px;
		background-color: #ffffff;
		border-bottom: 1px solid #dcdcdc;
	}
	.nav-bar a {
		color: #4a5e57;
		text-decoration: none;
		margin-right: 20px;
		font-size: 16px;
	}
	.nav-bar a:hover {
		color: #a25c5c;
	}
	.item-count {
		background-color: #6c8e7f;
		color: white;
		border-radius: 50%;
		display: inline-block;
		width: 20px;
		height: 20px;
		line-height: 20px;
		text-align: center;
		font-size: 14px;
		font-weight: bold;
	}
</style>

<!-- 🔰 LOGO 與使用者名稱 -->
<div class="header">
	<div class="logo">
		老郭鋪山東蔥油餅 🧅
		<span>方便點餐 輕鬆管理</span>
	</div>
	<div>
		<c:if test="${sessionScope.userDTO != null}">
			👤 ${ sessionScope.userDTO.username }
		</c:if>
	</div>
</div>

<!-- 🌿 導覽列 -->
<div class="nav-bar">
	<!-- ✅ 點餐者登入後 -->
	<!-- ✅ 管理者登入後 -->
	<!-- ✅ 未登入者 -->
	<c:choose>
		<c:when test="${sessionScope.userDTO != null && sessionScope.userDTO.role == 'customer'}">
			🥕 <a href="/GreenOnion/order">商品訂購</a>
			🛒 <a href="/GreenOnion/cart">購物車 
				<span class="item-count">
					<c:choose>
						<c:when test="${ empty sessionScope.cart }">0</c:when>
						<c:otherwise>${ fn:length(sessionScope.cart) }</c:otherwise>
					</c:choose>
				</span>
			</a>
			🍠 <a href="/GreenOnion/order/history">歷史紀錄</a>
			🚪 <a href="/GreenOnion/logout">點餐者登出</a>
		</c:when>

		<c:when test="${sessionScope.userDTO != null && sessionScope.userDTO.role == 'admin'}">
			📦 <a href="/GreenOnion/admin/products">商品管理</a>
			🫘 <a href="/GreenOnion/admin/statistics">統計資料</a>
			👥 <a href="/GreenOnion/admin/finance">營業額與成本控制</a>
			🚪 <a href="/GreenOnion/logout">管理者登出</a>
		</c:when>

		<c:otherwise>
			🌱 <a href="/GreenOnion/login?role=customer">點餐者登入</a>
			🧄 <a href="/GreenOnion/login?role=admin">管理者登入</a>
		</c:otherwise>
	</c:choose>
</div>