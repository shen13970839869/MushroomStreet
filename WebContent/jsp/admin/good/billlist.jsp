<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>蘑菇街商家管理系统</title>
    <link type="text/css" rel="stylesheet" href="/MushroomStreet/src/css/admin/style.css" />
    <link type="text/css" rel="stylesheet" href="/MushroomStreet/src/css/admin/public.css" />
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>蘑菇街商家管理系统</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b">${admin} </span> , 欢迎你！</p>
                 <a href="/MushroomStreet/jsp/admin/login.jsp">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
 <!--主体内容-->
 <section class="publicMian ">
     <div class="left">
         <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
         <nav>
         <ul class="list">
              <li ><a href="/MushroomStreet/ToBilllistServlet?method=select&&name=${admin}">订单管理</a></li>
              <li><a href="/MushroomStreet/FindAllGoodsToShangpinguanServlet?method=select&&name=${admin}">商品管理</a></li>
              <li><a href="/MushroomStreet/AdminUserServlet?method=select&&name=${admin}">用户管理</a></li>
              <li><a href="/MushroomStreet/AdminPwdServlet?method=select&&name=${admin}">密码修改</a></li>
              <li><a href="/MushroomStreet/index.jsp">退出系统</a></li>
             </ul>
         </nav>
     </div>
     <input type="hidden" id="path" name="path" value=""/>
     <input type="hidden" id="referer" name="referer" value=""/>
		<div class="right">
			<div class="location">
				<strong>你现在所在的位置是:</strong>
				<span>订单管理页面</span>
			</div>
			<div class="search">
				<form method="get" action="/jsp/bill.do">
					<input name="method" value="query" class="input-text" type="hidden">
					<span>商品名称：</span>
					<input name="queryProductName" type="text" value="">

					<!--  <span>供应商：</span>
					<select name="queryProviderId">
						<option value="0">--请选择--</option>
						<option value="">阿里巴巴</option>
				        <option value="">京东</option>
					</select>-->

					<span>是否付款：</span>
					<select name="queryIsPayment">
						<option value="0">--请选择--</option>
						<option value="1">未付款</option>
						<option value="2">已付款</option>
					</select>

					<input value="查 询" type="submit" id="searchbutton">
					<a href="/jsp/billadd.jsp">添加订单</a>
				</form>
			</div>
			<!--账单表格 样式和供应商公用-->
			<table class="providerTable" cellpadding="0" cellspacing="0">
				<tr class="firstTr">
					<th width="10%">订单编码</th>
					<th width="20%">商品名称</th>
					<th width="10%">用户名</th>
					<th width="10%">订单金额</th>
					<th width="10%">是否付款</th>
					<th width="10%">创建时间</th>
					<th width="10%">订单地址</th>
					<th width="30%">操作</th>
				</tr>
				<c:forEach items="${list}" var="l">
			        <tr><td><span>${l.oid }</span></td>
			        <td><span>${l.gname }</span></td>
			        <td><span>${l.uname }</span></td>
			        <td><span>${l.price }</span></td>
			        <c:set var="a" value="1"/>
			        <c:choose>
			        <c:when test="${l.status eq a }">
			        	<td ><span>已付款</span></td>
			        </c:when>
			        <c:otherwise>
			        	<td><span>已取消</span></td>
			        </c:otherwise>
			        </c:choose>
			        <td><span>${l.date }</span></td>
			        <td><span>${l.address }</span></td>
			        <td>
			        <span><a class="deleteBill" href="javascript:;" billid=${l.oid }><img src="/MushroomStreet/src/img/images/schu.png" alt="撤销订单" title="撤销订单"/></a></span>
			        <span><a class="modifyBill" href="javascript:;" billid=${l.oid }><img src="/MushroomStreet/src/img/images/y.png" alt="删除" title="删除"  width="20px" height="20px"/></a></span>
			        </td>
			        </tr>
			   </c:forEach>
			</table>
				<input type="hidden" id="totalPageCount" value="${requestScope.recordCount}"/>
               <div class="page-bar">
			<ul class="page-num-ul clearfix">
				<li>共${requestScope.recordCount}条记录&nbsp;&nbsp;${requestScope.pages} 页</li>
				
			 <a href="ToBilllistServlet?method=select&page=${1}">首页</a>
                <a href="ToBilllistServlet?method=select&page=${requestScope.currentPage<=1?1:requestScope.currentPage-1}">上一页</a>
                <a href="ToBilllistServlet?method=select&page=${requestScope.currentPage>=requestScope.pages?requestScope.pages:requestScope.currentPage+1}">下一页</a>
                <a href="ToBilllistServlet?method=select&page=${requestScope.pages}">最后一页</a>
				&nbsp;&nbsp;
			</ul> 	
		 <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key" />页
	     <button type="button" class="page-btn" onClick='jump_to(document.getElementById("inputPage").value)'>GO</button>
		</span>
		</div> 
		</div>
     
		</section>

		<!--点击删除按钮后弹出的页面-->
		<div class="zhezhao"></div>
		<div class="remove" id="removeBi">
			<div class="removerChid">
				<h2>提示</h2>
				<div class="removeMain">
					<p>你确定要删除该订单吗？</p>
					<a href="#" id="yes">确定</a>
					<a href="#" id="no">取消</a>
				</div>
			</div>
		</div>
	<footer class="footer">
    版权归31栋606F3
</footer>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/time.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/calendar/WdatePicker.js"></script>
</body>
</html>
<script type="text/javascript" src="/MushroomStreet/src/js/billistrollpage.js"></script>
<script type="text/javascript" src="/MushroomStreet/src/js/billlist.js"></script>