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
    <input type="hidden" id="path" name="path" value="../"/>
    <input type="hidden" id="referer" name="referer" value="../"/>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>密码修改页面</span>
        </div>
        <div class="providerAdd">

            <form id="userForm" name="userForm" method="post" action="/MushroomStreet/AdminPwdServlet?method=update&&name=${admin}">
                <input type="hidden" name="method" value="savepwd">
                div的class 为error是验证错误，ok是验证成功
                <div class="info"></div>
                <div class="">
                    <label for="oldPassword">旧密码：</label>
                    <input type="password" name="oldpassword" id="oldpassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="newPassword">新密码：</label>
                    <input type="password" name="newpassword" id="newpassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="reNewPassword">确认新密码：</label>
                    <input type="password" name="rnewpassword" id="rnewpassword" value="">
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <input type="button" name="save" id="save" value="保存" class="input-button">
                </div>
            </form>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/pwdmodify.js"></script>
    