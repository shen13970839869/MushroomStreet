<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, width=device-width,
    initial-scale=1.0, maximum-scale=1.0">
    <title>蘑菇街商城</title>
    <link href="../../src/css/header.css" rel="stylesheet"><!--首页导航和右侧导航样式-->
    <link href="../../src/css/index.css" rel="stylesheet">
    <link href="../../src/css/footer.css" rel="stylesheet">
    <link rel="stylesheet" href="../../tool/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../src/js/jquery-1.11.0.min.js"></script>
    <script src="../../tool/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<style>
    .pay:hover{
		background-color:#FF0;
		border-radius:30px;
		text-decoration:none;
		cursor:default;
		opacity:80%;
		
		}
    </style>
<script>
var j=1;
	$.get("../../QueryByUserServlet",{},function (data) {
		$("#addCart4").html('<a  href=\"javascript:void(0);\"  style=\" text-decoration:none;color:red;\" >加入购物车</a>');
		if(data!=""){
			if(data=="/html/login.jsp"){
			window.location=window.location.href="/MushroomStreet/ToLoginServlet";
			}else{
				for (var i = 0; i < data.length; i++) {
					 var bis=document.getElementById("content2").innerHTML;
					 /*
					 <thead>
					  <tr>
					    <th width="600" class="TR" scope="col">商品</th>
					    <th width="137.5" class="TR" scope="col" >数量</th>
					    <th width="137.5" class="TR" scope="col">单价</th>
					    <th width="137.5" class="TR" scope="col">运费</th>
					    <th width="137.5" class="TR" scope="col">总价</th>
					  </tr>
					  <thead>*/
					var str = data[i].split("+");
					  $.ajaxSettings.async = false;//开启同步线程
					$.get("../../FindGoodServlet",{gid:str[0]},function (data2) {
						/*$("#GoodName").html(data.gname);
						var img = data.gphoto.split("&");
						//<img src="../../src/img/buygood/1.jpg" width="65"  height="70" />
						$("#img1").html('<img src=\"../../src/'+img[0]+'\" width=\"65\"  height=\"70\" />');
						$("#img2").html('<img src=\"../../src/'+img[1]+'\" width=\"65\"  height=\"70\" />');
						$("#img3").html('<img src=\"../../src/'+img[2]+'\" width=\"65\"  height=\"70\" />');
						$("#img4").html('<img src=\"../../src/'+img[3]+'\" width=\"65\"  height=\"70\" />');
						var imgs = "";
						imgs+='<div class=\"item active\" ><img src="../../src/'+img[0]+'\" style=\"width:380px; height:500px;\" alt=\"First slide\"></div>';
						imgs+='<div class=\"item\"><img src=\"../../src/'+img[1]+'\" style=\"width:380px; height:500px;\" alt=\"Second slide\"></div>';
						imgs+='<div class=\"item\"><img src=\"../../src/'+img[2]+'\" style=\"width:380px; height:500px;\" alt=\"Second slide\"></div>';
						imgs+='<div class=\"item\"><img src=\"../../src/'+img[3]+'\" style=\"width:380px; height:500px;\" alt=\"Second slide\"></div>';
						$("#bigImg").html(imgs);
						$("#price1").html(data.price);
						$("#rest").html(data.number);
						$("#bigImg2").html('<img src="../../src/'+img[0]+'\" style=\"width:380px; height:500px;\" alt=\"First slide\">');
						$("#describes").html(data.gname);
						
						<tr>
					    <th  class="TR" scope="col"><div><img src="1.jpg" style="width:150px; height:180px; float:left;font-size:23px;"><span style=" font-size:20px; color:#99C; margin-top:-50px;"><br>商品名:</span>
					    <span>这就是商品的名字啦啦啦<img src="../../src/img/2.png"></span></div></th>
					    <th class="TR" scope="col" >1</th>
					    <th  class="TR" scope="col">888</th>
					    <th  class="TR" scope="col">8</th>
					    <th  class="TR" scope="col">888</th>
					  </tr>*/
					  var img = null;
						if(data2.gphoto!=null){
							img = data2.gphoto.split("&");
							  var bi = '<tr>';
							  bi+='<th  class=\"TR\" scope=\"col\"><div><img src=\"../../src/'+img[0]+'\" style=\"width:150px; height:180px; float:left;font-size:23px;\"><span style=\" font-size:20px; color:#99C; margin-top:-50px;\"><br>商品名:</span>';
							  bi+='<span style=\"overflow:hidden;\">'+data2.gname+'<img src=\"../../src/img/2.png\"></span></div></th>';
							  bi+='<th class=\"TR\" scope=\"col\" >'+str[1]+'</th>';
							  bi+='<th  class=\"TR\" scope=\"col\">'+data2.price+'</th>';
							  bi+='<th  class=\"TR\" scope=\"col\">8</th>';
							  bi+='<th  class=\"TR\" scope=\"col\">'+(data2.price*str[1]+8)+'</th>';
							  bi+='</tr>';
							  bis+=bi;
							  if(j==data.length){
									bis+='<tr><th colspan=\"5\"  scope=\"col\"><div  style=\" width:180px; height:50px; background-color:#F00; float:right; text-align:center; line-height:50px; font-size:20px; border-radius:30px; opacity:70%;\">'
									bis+='<a href=\"/MushroomStreet/jsp/individuals/address.jsp\" style=\"display:block;\"  class=\"pay\">&nbsp;&nbsp;&nbsp;下一步！</a></div></th></tr>'
									$("#content2").html(bis);
									
								}
						}
					  
					  $("#content2").html(bis);
					j++;
					});
						//alert(bis)
					
				   }
				//var bis=document.getElementById("content2").innerHTML;
				//alert(bis)
				//$("#content2").html(bis+'<tr><th colspan=\"5\"  scope=\"col\"><div  style=\" width:180px; height:50px; background-color:#F00; float:right; text-align:center; line-height:50px; font-size:20px; border-radius:30px; opacity:70%;\"><a href=\"success.html\" style=\"display:block;\"  class=\"pay\">&nbsp;&nbsp;&nbsp;立即支付！</a></div></th></tr>');
				//alert(document.getElementById("content2").innerHTML)
				$.ajaxSettings.async = true;
			}
		}
	});
	$.get("/MushroomStreet/UserCheckServlet",{},function (data) {
		if(data!=null){
			$("#login").html('<a href=\"/MushroomStreet/ToIndividualsCenterServlet\"><img src="/MushroomStreet/src/img/header-main/login.png"><span>'+data+'</span></a>');
		}else{
			$("#login").html('<a href="/MushroomStreet/ToLoginServlet"><img src="/MushroomStreet/src/img/header-main/login.png"></a><span><a href="/MushroomStreet/ToLoginServlet">登录</a></span>');
		}
	});
	$.get("../../FindAllServlet",{},function (data) {
	    var bis="";
	    for (var i = 0; i < data.length; i++) {
	   	var bi = '<li ><a  href="route.jsp?cid='+data[i].cid+'">'+data[i].cname+'</a></li>';
	   	bis+=bi;
	        
	    }
	    //拼接收藏排行榜的li,<li><a href="favoriterank.html">收藏排行榜</a></li>
	    
	    //lis+= '<li><a href="favoriterank.html">收藏排行榜</a></li>';
	
	    //将lis字符串，设置到ul的html内容中
	    
	    $("#category2").html(bis);
	});
	function search(){
	  	  var content = document.getElementById("search2").value;
	  	  $.get("../../SearchGoodsServlet",{content:content},function (data) {
	  		 window.location.href="/MushroomStreet/jsp/individuals/route.jsp?cid="+data;
	  	  });
	    }
</script>
<body>

<!-- 顶部导航补漏-->
<div class="line">
    <hr>
</div>

<div class="container">
    <!-- 顶部导航-->
    <div class="header-nav">
            <ul>
               <li><img src="../../src/img/header-nav/home_active.svg"><a href="../../index.jsp">首页</a><span>|</span></li>
               <li><img src="../../src/img/header-nav/category_active.svg"><a href="route.jsp?cid=0">商城</a><span>|</span></li>
               <li><a href="/MushroomStreet/jsp/individuals/order.jsp">我的订单</a><span>|</span></li>
               <li><a href="/MushroomStreet/CancelUserServlet">注销用户</a></li>
            </ul>
    </div>
    <!-- 顶部首页-->
    <div class="header-main">

        <section>
            <a href="../../index.jsp"><img src="../../src/img/header-main/logo.png"></a>
        </section>

        <section>
            <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
            <b>目录</b>
            <div class="category">
                <p>主题市场</p>
                <ul id="category2">
                    <li><a href="#">上衣</a></li>
                    <li><a href="#">裙子</a></li>
                    <li><a href="#">裤子</a></li>
                    <li><a href="#">女鞋</a></li>
                    <li><a href="#">包包</a></li>
                    <li><a href="#">男友</a></li>
                    <li><a href="#">家居</a></li>
                    <li><a href="#">内衣</a></li>
                    <li><a href="#">母婴</a></li>
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
                <a href="shopping.jsp"><img src="../../src/img/header-main/shopcart.svg"> </a>
                <p>购物车</p>
            </div>
            <div>
                <a href="#"><img src="../../src/img/header-main/message.svg"> </a>
                <p>消 息</p>
            </div>
            <div>
                <a href="collectGood.jsp"><img src="../../src/img/header-main/search.svg"> </a>
                <p>收 藏</p>
            </div>
             <div>
                 <a href="#"><img src="../../src/img/header-main/app.svg"> </a>
                 <p>APP</p>
                 <img src="../../src/img/header-main/APP.png">
             </div>
            </div>
        </section>

        <section id="login">
            <!--  <a href="ToLoginServlet"><img src="img/header-main/login.png"></a>
            <span><a href="ToLoginServlet">登录</a></span>-->
        </section>
		<!-- 右侧导航栏-->
	    <div class="rightBar">
	        <ul>
	            <li><a href="../../index.jsp">首页</a></li>
	            <li><a href="">优惠券</a></li>
	            <li><a href="">钱包</a></li>
	
	            <li><a href="">客户服务</a>
	                <div class="div1">
	                    <ul>
	                        <li><a href="#">消费者服务</a></li>
	                        <li><a href="#">商家服务</a></li>
	                        <li><a href="#">规则中心</a></li>
	                    </ul>
	                </div>
	            </li>
	
	            <li><a href="">商家后台</a>
	                <div class="div2">
	                    <ul>
	                        <li><a href="/MushroomStreet/jsp/admin/login.jsp">管理后台</a></li>
	                        <li><a href="#">市场入驻</a></li>
	                    </ul>
	                </div>
	            </li>
	        </ul>
	        <div>
	            <a href="#">
	                <img src="../../src/img/rightBar/arrow.svg">
	                <p>TOP</p>
	            </a>
	        </div>
	    </div>
    </div>
 <style>
 .TR{
	text-align:center; font-size:23px
	 }
 
 </style>
<!--购物车界面——————————————-->
 <div >
 <table width="1150"  border="0" style="border-collapse:separate; border-spacing:0px 20px;" id="content2">
 <thead>
  <tr>
    <th width="600" class="TR" scope="col">商品</th>
    <th width="137.5" class="TR" scope="col" >数量</th>
    <th width="137.5" class="TR" scope="col">单价</th>
    <th width="137.5" class="TR" scope="col">运费</th>
    <th width="137.5" class="TR" scope="col">总价</th>
  </tr>
  <thead>
     
  
</table>

 
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
                    <img src="../../src/img/footer/蘑菇街.png">
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
