<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, width=device-width,
    initial-scale=1.0, maximum-scale=1.0">
    <title>蘑菇街商城</title>
    <link href="/MushroomStreet/src/css/header.css" rel="stylesheet"><!--首页导航和右侧导航样式-->
    <link href="/MushroomStreet/src/css/index.css" rel="stylesheet">
    <link href="/MushroomStreet/src/css/footer.css" rel="stylesheet">
    <link rel="stylesheet" href="/MushroomStreet/tool/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/MushroomStreet/src/js/jquery-1.11.0.min.js"></script>
    <script src="/MushroomStreet/tool/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<style>
.moduser{
	font-size:15px;
	color:#333;
	}
.moduser:hover{
	    color: #969696;
    text-decoration: none;

	cursor:default;}

	
	.user1{
		
		
		}


</style>
<body>
<script>
	$.get("/MushroomStreet/UserCheckServlet",{},function (data) {
		if(data!=null){
			$("#login").html('<a href=\"/MushroomStreet/ToIndividualsCenterServlet\"><img src="/MushroomStreet/src/img/header-main/login.png"><span>'+data+'</span></a>');
		}else{
			$("#login").html('<a href="/MushroomStreet/ToLoginServlet"><img src="/MushroomStreet/src/img/header-main/login.png"></a><span><a href="/MushroomStreet/ToLoginServlet">登录</a></span>');
		}
	});
	$.get("/MushroomStreet/FindAllServlet",{},function (data) {
		var bis="";
	    for (var i = 0; i < data.length; i++) {
	    	var bi = '<li ><a  href="/MushroomStreet/jsp/individuals/route.jsp?cid='+data[i].cid+'">'+data[i].cname+'</a></li>';
		   	bis+=bi;
	    }
	    $("#category").html(bis);
	});
	function search(){
	  	  var content = document.getElementById("search2").value;
	  	  $.get("/MushroomStreet/SearchGoodsServlet",{content:content},function (data) {
	  		  window.location.href="/MushroomStreet/jsp/individuals/route.jsp?cid="+data;
	  	  });
	    }
</script>
<!-- 顶部导航补漏-->
<div class="line">
    <hr>
</div>

<div class="container">
    <div class="header-nav">
        <ul>
            <li><img src="/MushroomStreet/src/img/header-nav/home_active.svg"><a href="/MushroomStreet/index.jsp">首页</a><span>|</span></li>
            <li><img src="/MushroomStreet/src/img/header-nav/category_active.svg"><a href="route.jsp?cid=0">商城</a><span>|</span></li>
            <li><a href="/MushroomStreet/jsp/individuals/order.jsp">我的订单</a><span>|</span></li>
            <li><a href="/MushroomStreet/CancelUserServlet">注销用户</a></li>
        </ul>
    </div>
    <div class="header-main">

        <section>
            <a href="/MushroomStreet/index.jsp"><img src="/MushroomStreet/src/img/header-main/logo.png"></a>
        </section>

        <section>
            <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
            <b>目录</b>
            <div class="category">
                <p>主题市场</p>
                <ul id="category">
                    <!--  <li><a href="#">上衣</a></li>
                    <li><a href="#">裙子</a></li>
                    <li><a href="#">裤子</a></li>
                    <li><a href="#">女鞋</a></li>
                    <li><a href="#">包包</a></li>
                    <li><a href="#">男友</a></li>
                    <li><a href="#">家居</a></li>
                    <li><a href="#">内衣</a></li>
                    <li><a href="#">母婴</a></li>-->
                </ul>
            </div>
        </section>

        <section>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" id="search2" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default" onclick="search()">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </form>
        </section>

        <section>
            <div id="content">
                <div>
                    <a href="/MushroomStreet/jsp/individuals/shopping.jsp"><img src="/MushroomStreet/src/img/header-main/shopcart.svg"> </a>
                    <p>购物车</p>
                </div>
                <div>
                    <a href="#"><img src="/MushroomStreet/src/img/header-main/message.svg"> </a>
                    <p>消 息</p>
                </div>
                <div>
                    <a href="/MushroomStreet/jsp/individuals/collectGood.jsp"><img src="/MushroomStreet/src/img/header-main/search.svg"> </a>
                    <p>收 藏</p>
                </div>
                <div>
                    <a href="#"><img src="/MushroomStreet/src/img/header-main/app.svg"> </a>
                    <p>APP</p>
                    <img src="/MushroomStreet/src/img/header-main/APP.png">
                </div>
            </div>
        </section>

        <section id="login">
            <!--  <a href="ToLoginServlet"><img src="img/header-main/login.png"></a>
            <span><a href="ToLoginServlet">登录</a></span>-->
        </section>



    </div>
 <style>
 .TR{
	text-align:center; font-size:23px
	 }
 
 </style>
<!--购物车界面——————————————-->
 <div style="height:450px; width:1287.5px;">
 <p style="font-weight:bold; font-size:30px; text-align:center; color:#FFF; background-color:#F00;">以下是您的个人信息</p>
 
 <div style=" width:500px; height:400px; border:2px solid #999; box-shadow:#666; margin-left:350px; border-radius:50px; background-color: rgba(255,0,0,0.05)">
 
<div style="width:500px; height:50px; margin-top:20px; font-size:30px;  color:#F00; text-align:center;">个人信息</div>

<div style="width:500px; height:70px; margin-top:10px; font-size:20px;  color:#000;"><img src="/MushroomStreet/src/img/login/u2.png">您的用户名:<span style="color:#F36;">${user.uname }</span></div>

 <div style="width:500px; height:70px; margin-top:0px; margin-left:0px;font-size:20px;  color:#000; border-bottom:1px solid #666; "> <img src="/MushroomStreet/src/img/login/em.png">您&nbsp;的&nbsp;邮&nbsp;箱:<span style="color:#F36;">${user.email }</span><a class="moduser"data-toggle="modal" data-target="#myModal2">&nbsp;&nbsp;点击修改</a></div>
 
 <div style=" margin-top:5px; margin-left:5px;font-size:15px;  color:#000;">您可以在此页面修改您的密码！<span style="color:red;">${msg }</span></div>
 <div>
 <form method="post" action="/MushroomStreet/ModifyUserPwdServlet">
 	<span style="margin-left:100px;"><img src="/MushroomStreet/src/img/login/password.png">初始密码<input type="text" style="margin-left:10px;" placeholder="请输入原始密码" name="oldPwd"></span><br>
 <span style="margin-left:100px;"><img src="/MushroomStreet/src/img/login/password.png">新的密码<input style="margin-left:10px; margin-top:10px;" type="password" placeholder="请输入新密码" name="newPwd"></span><br>
 
 <button  type="submit" style="margin-left:200px; margin-top:20PX;"  >确认修改</button>
 
 
 </form>
 
 
 
 </div>
 
 </div>
 
 <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改用户名
				</h4>
			</div>
			<div class="modal-body">
	
      <div class="col-md-12 column"> <form method="post" action="">	<div class="form-group">
					 <input type="text" placeholder="请输入新的用户名"   pattern="^[a-zA-Z0-9_]{4,15}$" required class="form-control" id="Usermod" oninvalid="setCustomValidity('请输入长度为4~10的用户名！');" oninput="setCustomValidity('');" />
				</div></div>
        
        
        
        
        
        
        </div>
			<div class="modal-footer">
				<button type="button"  class="btn btn-default btn-danger" data-dismiss="modal">关闭
				</button>
                 <button type="submit" class="btn btn-default btn-success">提交</button> 
                 
				                 </form>

		</div>
	</div><!-- /.modal-content --></div>
</div>
</div>

 
 
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改邮箱
				</h4>
			</div>
			<div class="modal-body">
	
      <div class="col-md-12 column"> <form method="post" action="/MushroomStreet/ModifyUserEmailServlet">	<div class="form-group">
					 <input type="email" placeholder="请输入新的邮箱"    required class="form-control" name="email"  />
				</div></div>
        
        
        
        
        
        
        </div>
			<div class="modal-footer">
				<button type="button"  class="btn btn-default btn-danger" data-dismiss="modal">关闭
				</button>
                 <button type="submit" class="btn btn-default btn-success">提交</button> 
                 
				                 </form>

	  </div>
	</div><!-- /.modal-content --></div>

 </div>
 <!--购物车界面——————————————-->
 
 
 
 
  <!--底部广告-->
 
    <!--底部样式-->
   
   
   
   
   
   
   
    <div class="foot">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <img src="/MushroomStreet/src/img/footer/蘑菇街.png">
                </div>
                <div class="col-md-4">
                </div>
            </div>
            <div class="row help">
                <div class="col-md-3">
                    <ul>新手帮助
                        <p class="hr"></p>
                        <li><a href="#">常见问题</a></li>
                        <li><a href="#">自助服务</a></li>
                        <li><a href="#">联系客服</a></li>
                        <li><a href="#">意见反馈</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <ul>权益保障
                        <p class="hr"></p>
                        <li>全国包邮</li>
                        <li>7天无理由退货</li>
                        <li>退货运费补贴</li>
                        <li>限时发货</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <ul>支付方式
                        <p class="hr"></p>
                        <li>微信支付</li>
                        <li>支付宝</li>
                        <li>白富美支付</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <ul>移动客户端下载
                        <p class="hr"></p>
                        <li><a href="#">蘑菇街</a></li>
                        <li><a href="#">美丽说</a></li>
                        <li><a href="#">uni引力</a></li>
                    </ul>
                </div>
            </div>
            <div class="row body">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <ul>
                        <li><a href="#">关于我们</a></li>
                        <li>|</li>
                        <li><a href="#">招聘信息</a></li>
                        <li>|</li>
                        <li><a href="#">联系我们</a></li>
                        <li>|</li>
                        <li><a href="#">商家入驻</a></li>
                        <li>|</li>
                        <li><a href="#">商家后台</a></li>
                        <li>|</li>
                        <li><a href="#">规则中心</a></li>
                        <li>|</li>
                        <li><a href="#">规则众议院</a></li>
                        <li>|</li>
                        <li><a href="#">有害信息举报</a></li>
                        <li>|</li>
                        <li><a href="#">用户隐私保护</a></li>
                    </ul>
                </div>
                <div class="col-md-1"></div>
            </div>

        </div>
        <div class="body2">
            <span class="line"></span>
            <span class="text">©2020 Mogu.com 杭州卷瓜网络有限公司</span>
            <span class="line"></span>

            <div class="row body3">
                <div class="col-md-12">
                    <ul>
                        <li>营业执照：913301065526808764</li>
                        <span>|</span>
                        <li>营业性演出许可证</li>
                        <span>|</span>
                        <li>网络文化经营许可证</li>
                        <span>|</span>
                        <li>网络信息服务信用承诺书</li>
                        <span>|</span>
                        <li>安全责任书</li>
                        <span>|</span>
                        <li>增值电信业务经营许可证：浙B2-20110349</li>
                        <span>|</span>

                    </ul>
                </div>
            </div>

            <div class="row body4">
                <div class="col-md-12">
                    <ul>
                        <li>浙公网安备 33010602010221号</li>
                        <span>|</span>
                        <li>互联网药品信息服务资格证书编号：（浙)-经营性-2018-0002</li>
                        <span>|</span>
                        <li>浙网食A33010003</li>
                        <span>|</span>
                        <li>出版物网络交易平台服务经营备案证</li>
                        <span>|</span>
                        <li>(浙)网械平台备字[2018]第00006号</li>
                        <span>|</span>
                    </ul>
                </div>
            </div>
        </div>
</div>

</div>
<!--底部补漏-->
<div class="foot-bg">
</div>
</body>
</html>

