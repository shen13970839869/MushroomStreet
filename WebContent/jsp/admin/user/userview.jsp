<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
      <title>蘑菇街商城管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/src/css/admin/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/src/css/admin/public.css" />
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>蘑菇街商城管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${admin}</span> , 欢迎你！</p>
        <a href="jsp/admin/login.jsp">退出</a>
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
    <input type="hidden" id="path" name="path" value="../"/>
    <input type="hidden" id="referer" name="referer" value="../"/>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>

        <div class="providerView">
            <p><strong>用户编码：</strong><span>${uid}</span></p>
            <p><strong>用户名称：</strong><span>${uname}</span></p>
            <p><strong>用户邮箱：</strong><span>${email}</span></p>
            <p><strong>用户角色：</strong><span>用户</span></p>
            <div class="providerAddBtn">
                <input type="button" id="back" name="back" value="返回" >
            </div>
        </div>

    </div>
</section>

<footer class="footer">
  版权归31栋606F3
</footer>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/time.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/calendar/WdatePicker.js"></script>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/userview.js"></script>
