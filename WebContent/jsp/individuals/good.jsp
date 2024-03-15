<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <link href="/MushroomStreet/src/css/header.css" rel="stylesheet"><!--首页导航和右侧导航样式-->
    <link href="/MushroomStreet/src/css/good.css" rel="stylesheet">
      <link href="/MushroomStreet/src/css/footer.css" rel="stylesheet">
    <link rel="stylesheet" href="/MushroomStreet/tool/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/MushroomStreet/src/js/jquery-1.11.0.min.js"></script>
    <script src="/MushroomStreet/tool/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
         <script src="/MushroomStreet/src/js/jquery.fly.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<script>
	var gid = location.search.split("=")[1];
	
	var num = 0;
	$(function () {
	    var search = location.search;
	        // 切割字符串，拿到第二个值
	    gid = search.split("=")[1];
	    
	    
	    load(gid);
	});
	/*
	<div class="item active" >
	<img src="/MushroomStreet/src/img/buygood/1.jpg" style="width:380px; height:500px;" alt="First slide">         这里加图--————————————————
	</div>
		<div class="item">
		<img src="/MushroomStreet/src/img/buygood/2.jpg" style="width:380px; height:500px;" alt="Second slide">	
		</div>
		<div class="item">
		<img src="/MushroomStreet/src/img/buygood/1.jpg " style="width:380px; height:500px;" alt="Third slide">             这里加图--———————————————
		</div>
        <div class="item">
		<img src="/MushroomStreet/src/img/buygood/2.jpg " style="width:380px; height:500px;" alt="Fourth slide">       这里加图--————————————————
		</div>
	*/
	$.get("/MushroomStreet/FindAllServlet",{},function (data) {
		var bis="";
	    for (var i = 0; i < data.length; i++) {
	    	var bi = '<li ><a  href="route.jsp?cid='+data[i].cid+'">'+data[i].cname+'</a></li>';
		   	bis+=bi;
	    }
	    $("#category").html(bis);
	});
	$.get("/MushroomStreet/UserCheckServlet",{},function (data) {
		if(data!=null){
			$("#login").html('<a href=\"/MushroomStreet/ToIndividualsCenterServlet\"><img src="/MushroomStreet/src/img/header-main/login.png"><span>'+data+'</span></a>');
		}else{
			$("#login").html('<a href="/MushroomStreet/ToLoginServlet"><img src="/MushroomStreet/src/img/header-main/login.png"></a><span><a href="/MushroomStreet/ToLoginServlet">登录</a></span>');
		}
	});
	function load(gid){
		var number = document.getElementById("GoodNm").value;
		$.get("/MushroomStreet/FindGoodServlet",{gid:gid},function (data) {
			$("#GoodName").html(data.gname);
			var img = data.gphoto.split("&");
			//<img src="/MushroomStreet/src/img/buygood/1.jpg" width="65"  height="70" />
			$("#img1").html('<img src=\"/MushroomStreet/src/'+img[0]+'\" width=\"65\"  height=\"70\" />');
			$("#img2").html('<img src=\"/MushroomStreet/src/'+img[1]+'\" width=\"65\"  height=\"70\" />');
			$("#img3").html('<img src=\"/MushroomStreet/src/'+img[2]+'\" width=\"65\"  height=\"70\" />');
			$("#img4").html('<img src=\"/MushroomStreet/src/'+img[3]+'\" width=\"65\"  height=\"70\" />');
			var imgs = "";
			imgs+='<div class=\"item active\" ><img src="/MushroomStreet/src/'+img[0]+'\" style=\"width:380px; height:500px;\" alt=\"First slide\"></div>';
			imgs+='<div class=\"item\"><img src=\"/MushroomStreet/src/'+img[1]+'\" style=\"width:380px; height:500px;\" alt=\"Second slide\"></div>';
			imgs+='<div class=\"item\"><img src=\"/MushroomStreet/src/'+img[2]+'\" style=\"width:380px; height:500px;\" alt=\"Second slide\"></div>';
			imgs+='<div class=\"item\"><img src=\"/MushroomStreet/src/'+img[3]+'\" style=\"width:380px; height:500px;\" alt=\"Second slide\"></div>';
			$("#bigImg").html(imgs);
			$("#price1").html(data.price);
			$("#rest").html(data.number);
			$("#bigImg2").html('<img src="/MushroomStreet/src/'+img[0]+'\" style=\"width:380px; height:500px;\" alt=\"First slide\">');
			$("#describes").html(data.gname);
		});
		$.get("/MushroomStreet/QueryNumberByNameServlet",{},function (data) {
			$('#number3').text(data);
			
		});
		
	}
	function buy(){
		   $.get("/MushroomStreet/ShoppingCartServlet",{gid:gid,number:document.getElementById("GoodNm").value},function (data) {
			   alert("请确认跳转。。。")
			   window.location.href="/MushroomStreet/jsp/individuals/shopping.jsp";
			   //加判断
				/*if('/html/login.jsp'==data){
					window.location.href="/MushroomStreet/ToLoginServlet";
				}else if("success"==data){
					alert("12")
					window.location.href="/MushroomStreet/jsp/individuals/shopping.jsp";
				}*/
			});
		alert(1)
	 }
	//<a  href="javascript:void(0);" onclick="addCart()" style=" text-decoration:none;color:#666;" >加入购物车</a>   addCart4
	function addCart() {
			$.get("/MushroomStreet/ShoppingCartServlet",{gid:gid,number:document.getElementById("GoodNm").value},function (data) { 
				$("#addCart4").html('<a  href=\"javascript:void(0);\"  style=\" text-decoration:none;color:red;\" >加入购物车</a>');
				if(data!=""){
					window.location.href="/MushroomStreet/ToLoginServlet";
				}
			});
			$.get("/MushroomStreet/FindGoodServlet",{gid:gid},function (data) {
				var img = data.gphoto.split("&");
	       flyer = $('<img src=\"/MushroomStreet/src/'+img[0]+'\"  style=\"width:200px; height:200px;\">');
	       flyer.fly({
		       start: {
		          left:1000,
		              top: 450 //抛物体起点纵坐标 
		       },
		       end: {
		          left:1800,
		          top: 750,
		          width: 0,
		          height: 0
		       }
		       });
			   var num = document.getElementById("number3").innerHTML;
			   num++;
		       $('#number3').text(num);
			});
		   
	       }
	   
	   var num = 1;
      function cl() {
		if(num==1){
			$.get("/MushroomStreet/FavoriteServlet",{gid:gid},function (data) {
				if(data!=""){
					window.location=window.location.href="/MushroomStreet/ToLoginServlet";
				}
			});
		}
		num++;
       F = $('<img src="/MushroomStreet/src/img/red.png" style="width:100px; height:100px;">');
       F.fly({
       start: {
          left:900,
          top: 650 //抛物体起点纵坐标 
       },
       end: {
          left:1300,
          top: 100,
          width: 0,
          height: 0
        }
       });
     }
	      

	       function cs1(){  
	       $(document).ready(function(){
	     $("#myCarousel").carousel(0);         
	        });}                        /*点图轮播1*/
	    function cs2(){  
	       $(document).ready(function(){
	     $("#myCarousel").carousel(1);         
	        });}                        /*点图轮播2*/
			 function cs3(){  
	       $(document).ready(function(){
	     $("#myCarousel").carousel(2);         
	        });}                        /*点图轮播3*/
			function cs4(){  
	       $(document).ready(function(){
	     $("#myCarousel").carousel(3);         
	        });}                        /*点图轮播4*/
	     //搜索功能
        function search(){
        	  var content = document.getElementById("search2").value;
        	  $.get("/MushroomStreet/SearchGoodsServlet",{content:content},function (data) {
        		  window.location.href="/MushroomStreet/jsp/individuals/route.jsp?cid="+data;
        	  });
          }
</script>


<body>

<div class="goodback-ground">

<div class="good">
<!--————————————————————————————————————————————————————————-->

<div id="myCarousel" class="carousel slide" style="width:380px; height:500px; margin-top:20px;margin-left:0px;">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel" data-slide-to="1"></li>
<li data-target="#myCarousel" data-slide-to="2"></li>
<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner" style="width:380px; height:500px; " id="bigImg">
	<!--  <div class="item active" >
	<img src="/MushroomStreet/src/img/buygood/1.jpg" style="width:380px; height:500px;" alt="First slide">         这里加图--————————————————
	</div>
		<div class="item">
		<img src="/MushroomStreet/src/img/buygood/2.jpg" style="width:380px; height:500px;" alt="Second slide">	 这里加图--————————————————
		</div>
		<div class="item">
		<img src="/MushroomStreet/src/img/buygood/1.jpg " style="width:380px; height:500px;" alt="Third slide">             这里加图--———————————————
		</div>
        <div class="item">
		<img src="/MushroomStreet/src/img/buygood/2.jpg " style="width:380px; height:500px;" alt="Fourth slide">       这里加图--————————————————
		</div>-->
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	</a>
</div> 
<!--  --------------详情页bootstrap轮播图--------------------->
<div class="btnCarousel" style="width:380px; height:100px; "> 
<!--这里加图--————————————————-->
<div class="img1" style="margin-left:30px; margin-top:10px; width:70px; height:75px;"><a href="javascript:void(0);" onclick="cs1()"  id="img1"><img src="/MushroomStreet/src/img/buygood/1.jpg" width="65"  height="70" /></a></div>

<div class="img2" style="margin-left:110px; margin-top:-75px; width:70px; height:75px;"><a  href="javascript:void(0);" onclick="cs2()" id="img2"><img src="/MushroomStreet/src/img/buygood/2.jpg"   width="65"  height="70"></a></div>

<div class="img3" style="margin-left:190px; margin-top:-75px; width:70px; height:75px;"><a href="javascript:void(0);" onclick="cs3()"  id="img3" ><img src="/MushroomStreet/src/img/buygood/1.jpg"  width="65"  height="70"></a></div>

<div class="img4"  style="margin-left:270px; margin-top:-75px; width:70px; height:75px;"><a href="javascript:void(0);" onclick="cs4()" id="img4"><img src="/MushroomStreet/src/img/buygood/2.jpg"  width="65"  height="70"></a></div>

<!--这里加图--————————————————-->
</div>
<!--————————————————————————————————————————————————————————-->
<div class="goodright"><!--商品详情页右侧价格库存等-->
<span id="GoodName" class="ClassGoodName"></span>
<div id="IDPriceShadow" class="PriceShadow">
<p style=" font-size:14px; color:#000;">&nbsp;&nbsp;&nbsp;价格:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<del>999</del></p>
<p style="font-size:25px; color:#F00; font-weight:bold;">&nbsp;惊爆价:&nbsp;&nbsp;￥<span id="price1"></span></p1>
</div>
<p style="margin-left:20px; margin-top:20px; ">客服:</p><a class="KeFutext" data-toggle="modal" data-target="#myModal1"  href="">联系客服</a>

<form id="BuyGood" action=""><p style="margin-left:20px; margin-top:30px; ">尺码:</p>
<select id="chima" class="classchima">   
<option value="35">35</option>
<option value="3">36</option>
<option value="37">37</option>
<option value="38">38</option>
</select>
<p style="margin-left:20px; margin-top:30px; ">数量:</p><input type="number" id="GoodNm" class="classgoodnm" value="1" min="1" max="100"><p style=" margin-left:270px; margin-top:-30px;">库存:<span id="rest"></span></p>
<P><button id="btnBuygood" class="btnbuygoodclass" onclick="buy()">立即抢购</button>&nbsp;&nbsp;&nbsp;&nbsp;<img src="/MushroomStreet/src/img/header-main/shopcart.svg" width="40" height="40"/>&nbsp;<span id="addCart4"><a  href="javascript:void(0);" onclick="addCart()" style=" text-decoration:none;color:#666;" >加入购物车</a></span>  <!-- ——————————————加的--></P>
<p style="margin-left:20px; margin-top:30px; ">服务说明:</p>
<p style="margin-left:90px; margin-top:-32px; "><img src="/MushroomStreet/src/img/buygood/gou.jpg" style=" width:20px; height:21px;" />七天无理由退货</p>
<p style="margin-left:215px; margin-top:-32px; "><img src="/MushroomStreet/src/img/buygood/gou.jpg" style=" width:20px; height:21px;" />延误必赔</p>
<p style="margin-left:300px; margin-top:-32px; "><img src="/MushroomStreet/src/img/buygood/gou.jpg" style=" width:20px; height:21px;" />退货补运费</p>
<p style="margin-left:400px; margin-top:-32px; "><img src="/MushroomStreet/src/img/buygood/gou.jpg" style=" width:20px; height:21px;" />全国包邮</p>
<p style="margin-left:20px; margin-top:30px; ">支付方式:<img src="/MushroomStreet/src/img/buygood/alipay.jpg" /><img src="/MushroomStreet/src/img/buygood/wecahat.jpg" />
<div class='cl'><a  href="javascript:void(0);" onclick="cl()" style="text-decoration:none; color:#FDFDFD; display:block; " href="#">收藏商品</a></div></p></p>

<style>

.cl{
text-align: center;
	width: 60px;
	height: 30px;
	line-height: 30px;
	background-color:#666;
	margin-top:-40px;
	margin-left:130px;

	border-radius:10px;
}
	.cl:hover{
		background-color:#F00;
		
		
		}

	</style>

</form>




</div>



<div class="goodrecommend">
<div class="goodrecommend1"><img src="/MushroomStreet/src/img/buygood/2.jpg" width="140" height="170"><p>￥999</p></div>
<div class="goodrecommend2"><img src="/MushroomStreet/src/img/buygood/1.jpg" width="140" height="170"><p>￥999</p> </div>
<div class="goodrecommend3"><img src="/MushroomStreet/src/img/buygood/2.jpg" width="140" height="170"><p>￥999</p>  </div><!--右侧推荐商品-->
</div>

<div class="bottomdescribe">
<div class="bottomBtnDes">商品图文详情</div>
<div class="DescribeImgandText">
<p style="text-decoration:underline; font-size:20px; font-weight:bold;
padding-top:25px; padding-left:20px;">商品描述</p><P style="font-size:14px; padding-left:20px; width:700px;" id="describes">啦啦啦</P>
<P style="text-decoration:underline; font-size:20px; font-weight:bold;
padding-top:70px; padding-left:20px;">商品图片</P><span id="bigImg2"></span>




</div>

</div><!--底部商品描述-->


</div>
</div>
<!-- 顶部导航补漏-->
<div class="line">
    <hr>
</div>
<div class="container">
    <!-- 顶部导航-->
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



<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					扫描二维码联系我们！
				</h4>
			</div>
			<div class="modal-body">
	<img src="/MushroomStreet/src/img/buygood/606.jpg" style="width:550px; height:700px;" />	 
  </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				
			</div>
	</div><!-- /.modal-content --></div>

</div>
</div>
<a style="text-decoration:none; color:#FDFDFD; display:block;" href="#"><div class='div6'>返回顶部</div></a>
<div class='flyer'><span id="number3">0</span> </div>  
<div class='cartright'><a href="shopping.jsp"><img src="/MushroomStreet/src/img/header-main/shopcart.svg" /></a></div>

<style>
.div6{
	text-align: center;
	position: fixed;
	width: 60px;
	height: 60px;
	line-height: 60px;
	background-color: #639;
	left: 1800px;
	top: 800px;
	border-radius:50px;
		}
.flyer {
   text-align: center;
	position: fixed;
	width: 30px;
	height: 30px;
	line-height: 30px;
	background-color:#F00;
	left: 1815px;
	top: 720px;
	border-radius:40px;
    }
 .cartright{
	 left: 1800px;
	top: 741px;
	 position: fixed;
	 
	 
	 }
</style>





<div class="foot" style="margin-top:2105px;">
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
            <span class="text">2020 Mogu.com 杭州卷瓜网络有限公司</span>
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