<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="/MushroomStreet/src/css/admin/style.css" />
    <link type="text/css" rel="stylesheet" href="/MushroomStreet/src/css/admin/public.css" />
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>超市订单管理系统</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b">${admin }</span> , 欢迎你！</p>
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
         <span>订单管理页面 >> 订单添加页面</span>
     </div>
       <div class="providerAdd">
         <form style="margin-left:500px;" id="billForm" name="billForm" method="post" action="/MushroomStreet/AddShoppingServlet" enctype="multipart/form-data">
             <!--div的class 为error是验证错误，ok是验证成功-->
             ${msg }
             <input type="hidden" name="method" value="add">
             <div class="">
                 <label for="billCode">商品名称：</label>
                 <input type="text" name="goodName" class="text" id="billCode" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productName">商品库存：</label>
                 <input type="text" name="goodNumber" id="productName" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productUnit">商品价格：</label>
                 <input type="text" name="goodPrice" id="productUnit" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                  <label for="totalPrice">商品类别：</label>
                  <select name="goodCategory">
                    	<c:forEach	items="${list1 }" var="l">
		                	<c:choose>
		                		<c:when test="${l.cid eq 1}">
		                			<option selected="selected" value="${l.cid }">${l.cname }</option><!--默认选中项-->
		                		</c:when>
		                		<c:otherwise>
		                			<option value="${l.cid }">${l.cname }</option>
		                		</c:otherwise>
		                	</c:choose>
		                </c:forEach>
                    </select>
				 <font color="red"></font>
             </div>
             <div>
                  <label for="totalPrice">商品小类：</label>
                  <select name="goodType">
                    	<c:forEach	items="${list2 }" var="t">
		                	<c:choose>
		                		<c:when test="${t.tid eq 1}">
		                			<option selected="selected" value="${t.tid }">${t.tname }</option><!--默认选中项-->
		                		</c:when>
		                		<c:otherwise>
		                			<option value="${t.tid }">${t.tname }</option>
		                		</c:otherwise>
		                	</c:choose>
		                </c:forEach>
                    </select>
				
             </div>
              <label for="totalPrice">商品照片1：</label><input   type="file" name="file1" multiple> <font color="red">*商品大类和小类请参照对照表！*</font><br/>
              <label for="totalPrice">商品照片2：</label><input   type="file" name="file2" multiple> <font color="red">*商品大类和小类请参照对照表！*</font><br/>
              <label for="totalPrice">商品照片3：</label><input   type="file" name="file3" multiple> <font color="red">*商品大类和小类请参照对照表！*</font><br/>
              <label for="totalPrice">商品照片4：</label><input   type="file" name="file4" multiple> <font color="red">*商品大类和小类请参照对照表！*</font>
              <div class="providerAddBtn">
                  <input type="submit" name="add" id="add" value="添加">
				  <input type="button" id="back" name="back" value="返回" >
             </div>
         </form>
     </div>
 </div>

</section>
<footer class="footer">
			606无限公司
		</footer>
		<script type="text/javascript" src="/MushroomStreet/src/js/time.js"></script>
		<script type="text/javascript" src="/MushroomStreet/src/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="/MushroomStreet/src/js/common.js"></script>
		<script type="text/javascript" src="/MushroomStreet/src/calendar/WdatePicker.js"></script>
	</body>
</html>
<script type="text/javascript" src="/MushroomStreet/src/js/billadd.js"></script>