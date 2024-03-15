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
     <input type="hidden" id="path" name="path" value="../"/>
     <input type="hidden" id="referer" name="referer" value="../"/>

  <div class="right">
      <div class="location">
          <strong>你现在所在的位置是:</strong>
          <span>供应商管理页面 >> 供应商修改页</span>
      </div>
      <div class="providerAdd">
              <!--div的class 为error是验证错误，ok是验证成功-->
              <div class=""></div>
              <div></div>
              
              <div></div>
              
              <div>
                  <label for="proPhone">商品名称：</label>
                  <input type="text" name="proPhone" id="proPhone" value="${good.gname }" width="500px"> 
			<font color="red"></font>
              </div>
              
              <div>
                  <label for="proAddress">商品库存：</label>
                  <input type="text" name="proAddress" id="proAddress" value="${good.goodNumber }"> 
              </div>
              
              <div>
                  <label for="proFax">商品价格：</label>
                  <input type="text" name="proFax" id="proFax" value="${good.goodPrice }">
              </div>
              
              <div>
                  <label for="proFax">商品图片：</label>
                  <img src="/MushroomStreet/src/${good.gphoto.split('&')[0] }" width="100px" height="100px">
                  <img src="/MushroomStreet/src/${good.gphoto.split('&')[1] }" width="100px" height="100px">
                  <img src="/MushroomStreet/src/${good.gphoto.split('&')[2] }" width="100px" height="100px">
                  <img src="/MushroomStreet/src/${good.gphoto.split('&')[3] }" width="100px" height="100px">
              </div>
              
              <div>
                  <label for="proFax">商品类别：</label>
                  <input type="text" name="proFax" id="proFax" value="${good.cname }">
              </div>
              
              <div>
                  <label for="proFax">商品类型：</label>
                  <input type="text" name="proFax" id="proFax" value="${good.tname }">
              </div>
              
              <div></div>
              <div class="providerAddBtn">
                  <!-- <input type="button" name="save" id="save" value="保存"> -->
				  <a href="/MushroomStreet/FindAllGoodsToShangpinguanServlet?method=select&&name=${admin}"><input type="button" id="back" name="back" value="返回" ></a>
              </div>
         
      </div>
  </div>
</section>

<footer class="footer">
    版权归朝腾教育
</footer>
<script type="text/javascript" src="/MushroomStreet/src/js/time.js"></script>
<script type="text/javascript" src="/MushroomStreet/src/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/MushroomStreet/src/js/common.js"></script>
<script type="text/javascript" src="/MushroomStreet/src/calendar/WdatePicker.js"></script>
</body>
</html>
</script>