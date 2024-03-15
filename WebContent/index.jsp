<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, width=device-width,
    initial-scale=1.0, maximum-scale=1.0">
    <title>蘑菇街商城</title>
    <link href="src/css/header.css" rel="stylesheet"><!--首页导航和右侧导航样式-->
    <link href="src/css/index.css" rel="stylesheet">
    <link href="src/css/footer.css" rel="stylesheet">
    <link rel="stylesheet" href="tool/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="src/js/jquery-1.11.0.min.js"></script>
    <script src="tool/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<script>
	$.get("FindAllServlet",{},function (data) {
	    var lis = "";//'<li class="nav-active"><a href="index.html">首页</a></li>';
	    var bis="";
	    for (var i = 0; i < data.length; i++) {
	   	 var li = '<li id=\"X'+(i+1)+'\"><a  href="jsp/individuals/route.jsp?cid='+data[i].cid+'">'+data[i].cname+'</a></li>';
	   	var bi = '<li ><a  href="jsp/individuals/route.jsp?cid='+data[i].cid+'">'+data[i].cname+'</a></li>';
	   	bis+=bi;
	        lis += li;
	        
	    }
	    //拼接收藏排行榜的li,<li><a href="favoriterank.html">收藏排行榜</a></li>
	    
	    //lis+= '<li><a href="favoriterank.html">收藏排行榜</a></li>';
	
	    //将lis字符串，设置到ul的html内容中
	    
	    $("#category").html(lis);
	    $("#category2").html(bis);
	});
	$.get("UserCheckServlet",{},function (data) {
		if(data!=null){
			$("#login").html('<a href=\"/MushroomStreet/ToIndividualsCenterServlet\"><img src="/MushroomStreet/src/img/header-main/login.png"><span>'+data+'</span></a>');
		}else{
			$("#login").html('<a href="/MushroomStreet/ToLoginServlet"><img src="/MushroomStreet/src/img/header-main/login.png"></a><span><a href="/MushroomStreet/ToLoginServlet">登录</a></span>');
		}
	});
	$.get("FindAllTypeServlet",{},function (data) {
		
    	for (var i = 0; i < data.length; i++) {
    	 var lis = document.getElementById("X"+data[i].cid).innerHTML;
   	   	 var li = '<a href="jsp/individuals/route.jsp?tid='+data[i].tid+'&cid='+data[i].cid+'">'+data[i].tname+'</a>';
   	
   	     lis += li;
    	 console.log(lis);
   	 	 $("#X"+data[i].cid).html(lis);  
   	    }
    });
	/*
	<div class="item active">
                    <section>
                        <img src="src/img/carousel/carousel-1.png" alt="..." >
                        <span>居家休闲纯棉睡衣</span>
                        <h4>￥109.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-2.png" alt="..." >
                        <span>港风帅气卫衣全套</span>
                        <h4>￥89.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-3.png" alt="..." >
                        <span>加厚纯棉高领毛衣</span>
                        <h4>￥59.0</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-4.png" alt="..." >
                        <span>秋冬季款新款网红马丁靴</span>
                        <h4>￥59.9</h4>
                    </section>content6
                </div>*/
              var num=4;
              $.get("FindPartGoodServlet",{},function (data) {
              	var lis='<div class=\"item active\">';
          	    for (var i = 0; i < data.length; i++) {
          	    	var img = data[i].gphoto.split("&")[0];
          	    	var li  = '<section>';
          	    	//li+='<img src="'+img+'" alt="..." >';
          	    	li+='<a href=\"jsp/individuals/good.jsp?gid='+data[i].gid+'\"><img src="src/'+img+'" alt="..." ></a>';
          	    	//li+='<span>'+data[i].gname+'</span>';
          	    	li+='<a href=\"jsp/individuals/good.jsp?gid='+data[i].gid+'\"><span>'+data[i].gname+'</span></a>';
          	    	li+='<a href=\"jsp/individuals/good.jsp?gid='+data[i].gid+'\"><h4>￥'+data[i].price+'</h4></a>';
          	    	li+='</section>';
          	    	if((i+1)%num==0&i!=data.length-1){
          	    		li+='</div><div class=\"item\">';
          	    	}
          	    	lis+=li;
          	    }
          	    $("#content6").html(lis);
          	});
          function search(){
        	  var content = document.getElementById("search2").value;
        	  $.get("SearchGoodsServlet",{content:content},function (data) {
        		  window.location.href="/MushroomStreet/jsp/individuals/route.jsp?cid="+data;
        	  });
          }
</script>
<body>

<!--主体大图片部分补漏-->
<div class="back-ground">

</div>
<!-- 顶部导航补漏-->
<div class="line">
    <hr>
</div>

<div class="container">
    <!-- 顶部导航-->
    <div class="header-nav">
            <ul>
               <li><img src="src/img/header-nav/home_active.svg"><a href="index.jsp">首页</a><span>|</span></li>
               <li><img src="src/img/header-nav/category_active.svg"><a href="jsp/individuals/route.jsp?cid=0">商城</a><span>|</span></li>
               <li><a href="/MushroomStreet/jsp/individuals/order.jsp">我的订单</a><span>|</span></li>
               <li><a href="/MushroomStreet/CancelUserServlet">注销用户</a></li>
            </ul>
    </div>
    <!-- 顶部首页-->
    <div class="header-main">

        <section>
            <a href="index.jsp"><img src="src/img/header-main/logo.png"></a>
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
                <a href="jsp/individuals/shopping.jsp"><img src="src/img/header-main/shopcart.svg"> </a>
                <p>购物车</p>
            </div>
            <div>
                <a href="#"><img src="src/img/header-main/message.svg"> </a>
                <p>消 息</p>
            </div>
            <div>
                <a href="jsp/individuals/collectGood.jsp"><img src="src/img/header-main/search.svg"> </a>
                <p>收 藏</p>
            </div>
             <div>
                 <a href="#"><img src="src/img/header-main/app.svg"> </a>
                 <p>APP</p>
                 <img src="src/img/header-main/APP.png">
             </div>
            </div>
        </section>

        <section id="login">
            <!--  <a href="ToLoginServlet"><img src="src/img/header-main/login.png"></a>
            <span><a href="ToLoginServlet">登录</a></span>-->
        </section>

    </div>
    <!-- 右侧导航栏-->
    <div class="rightBar">
        <ul>
            <li><a href="index.jsp">首页</a></li>
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
                <img src="src/img/rightBar/arrow.svg">
                <p>TOP</p>
            </a>
        </div>
     </div>

    <!-- 主题市场-->
    <div class="top-main">
        <section>
            <ul>
            <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
            <b>主题市场</b>
            </ul>
        </section>
    </div>
    <!--主体大图片部分-->
    <div class="content">
       <div class="content-nav-left">
           <ul id="category">
           <!--<li><a href="#">上衣</a>
               <a href="#">T恤</a>
               <a href="#">时尚套装</a>
               <a href="#">卫衣</a>
           </li>
           <li><a href="#">裙子</a>
               <a href="#">连衣裙</a>
               <a href="#" style="color:#666">半身裙</a>
               <a href="#">美裙套装</a>
           </li>
           <li><a href="#">裤子</a>
               <a href="#">牛仔裤</a>
               <a href="#" style="color:#666">休闲裤</a>
               <a href="#" style="color:#f46">运动裤</a>
           </li>
           <li><a href="jsp/individuals/shoe.html">女鞋</a>
               <a href="#">单鞋</a>
               <a href="#">靴子</a>
               <a href="#">休闲运动</a>
           </li>
           <li><a href="#">包包</a>
               <a href="#">双肩包</a>
               <a href="#" style="color:#666">拉杆箱</a>
               <a href="#" style="color:#f46">斜挎包</a>
           </li>
           <li><a href="#">男友</a>
               <a href="#">T恤</a>
               <a href="#">休闲裤</a>
               <a href="#">休闲鞋</a>
           </li>
           <li><a href="#">家居</a><a href="#">床上用品</a><a href="#" style="color:#666">收纳整理</a><a href="#" style="color:#f46">纸品清洁</a></li>
           <li><a href="#">内衣</a>
               <a href="#" style="color:#666">睡衣</a>
               <a href="#" style="color:#666">内裤</a>
           </li>
           <li><a href="#">母婴</a>
               <a href="#">萌宝童装</a>
               <a href="#">孕妇装</a>
               <a href="#">萌宝童鞋</a>
           </li>  -->
           </ul>
       </div>
       <div class="content-nav-right">
           <div class="top">

            <p>姑凉好！<b>欢迎来到蘑菇街~</b></p>
           </div>
           <div class="bottom">
               <a href="#"><img src="src/img/right.png"></a>
           </div>

       </div>
    </div>
    <!--轮播图板块和左边大图-->
    <div class="content-main">
        <!--左边大图-->
    <div class="picture">
        <p>时间:部分</p>
    </div>
        <!--轮播图板块-->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox" id="content6">
                <!-- <div class="item active">
                    <section>
                        <img src="src/img/carousel/carousel-1.png" alt="..." >
                        <span>居家休闲纯棉睡衣</span>
                        <h4>￥109.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-2.png" alt="..." >
                        <span>港风帅气卫衣全套</span>
                        <h4>￥89.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-3.png" alt="..." >
                        <span>加厚纯棉高领毛衣</span>
                        <h4>￥59.0</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-4.png" alt="..." >
                        <span>秋冬季款新款网红马丁靴</span>
                        <h4>￥59.9</h4>
                    </section>
                </div>
                <div class="item">
                    <section>
                        <img src="src/img/carousel/carousel-5.png" alt="..." >
                        <span>珊瑚绒加绒加厚居家</span>
                        <h4>￥69.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-6.png" alt="..." >
                        <span>网红厚底加绒高帮小...</span>
                        <h4>￥55.0</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-7.png" alt="..." >
                        <span>马丁靴女内增高百搭...</span>
                        <h4>￥59.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-8.png" alt="..." >
                        <span>自发热袜子暖脚</span>
                        <h4>￥15.9</h4>
                    </section>
                </div>
                <div class="item">
                    <section>
                        <img src="src/img/carousel/carousel-9.png" alt="..." >
                        <span>冬季加绒款港风连帽卫衣</span>
                        <h4>￥49.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-10.png" alt="..." >
                        <span>冬季珊瑚绒加绒加厚</span>
                        <h4>￥49.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-11.png" alt="..." >
                        <span>可爱小鹿圣诞防寒手套</span>
                        <h4>￥19.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-12.png" alt="..." >
                        <span>汉版洋气时尚斜挎包</span>
                        <h4>￥39.9</h4>
                    </section>
                </div>
                <div class="item">
                    <section>
                        <img src="src/img/carousel/carousel-13.png" alt="..." >
                        <span>青少年减龄加绒卫衣</span>
                        <h4>￥38.0</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-14.png" alt="..." >
                        <span>加绒加厚运动裤男羊毛</span>
                        <h4>￥39.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-15.png" alt="..." >
                        <span>儿童棉马甲加绒加厚</span>
                        <h4>￥19.9</h4>
                    </section>
                    <section>
                        <img src="src/img/carousel/carousel-16.png" alt="..." >
                        <span>雪地靴女短靴保暖棉靴</span>
                        <h4>￥49.0</h4>
                    </section>
                </div> -->
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <!--底部广告-->
    <div class="advisement">
        <a href="#">
        <img src="src/img/advertisement/advertisement-1.png">
        <img src="src/img/advertisement/advertisement-2.png">
        <img src="src/img/advertisement/advertisement-3.png">
        <img src="src/img/advertisement/advertisement-4.png">
        </a>
    </div>
    <!--底部样式-->
    <div class="foot">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <img src="src/img/footer/蘑菇街.png">
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