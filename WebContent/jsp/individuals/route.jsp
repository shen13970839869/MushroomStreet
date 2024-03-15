<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>鞋子</title>
    <link href="../../src/css/header.css" rel="stylesheet"><!--首页导航和右侧导航样式-->
    <link href="../../src/css/footer.css" rel="stylesheet">
    <link rel="stylesheet" href="../../tool/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link href="../../src/css/detalCommon.css" rel="stylesheet">
    <script src="../../src/js/jquery-1.11.0.min.js"></script>
    <script src="../../tool/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	$.get("/MushroomStreet/UserCheckServlet",{},function (data) {
		if(data!=null){
			$("#login").html('<a href=\"/MushroomStreet/ToIndividualsCenterServlet\"><img src="/MushroomStreet/src/img/header-main/login.png"><span>'+data+'</span></a>');
		}else{
			$("#login").html('<a href="/MushroomStreet/ToLoginServlet"><img src="/MushroomStreet/src/img/header-main/login.png"></a><span><a href="/MushroomStreet/ToLoginServlet">登录</a></span>');
		}
	});
	$.get("../../FindAllServlet",{},function (data) {
		//<li role="presentation" class="active">
        //<a href="#shouye" role="tab" data-toggle="tab">首页</a>
    	//</li>
    	var search = location.search;
        // 切割字符串，拿到第二个值
	    var cid = search.split("=")[1];
        if(cid.length>1){
        	var cid = search.split("=")[2];
        }
	    var lis = "";//'<li class="nav-active"><a href="index.html">首页</a></li>';
	    var ris = "";
	    var l1 = 1;
	    var lib ="";
	    var bis="";
	    for (var i = 0; i < data.length; i++) {
	    	var li="";
	    	var bi = '<li id=\"X'+(i+1)+'\"><a  href="../../jsp/individuals/route.jsp?cid='+data[i].cid+'">'+data[i].cname+'</a></li>';
	    	if(cid==l1){ 
				lib = '<li role=\"presentation\" class=\"active\"><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
				l1=-100;
				li+=lib;
			 }else if(cid==l1){
				 lib = '<li role=\"presentation\" class=\"active\"><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				 var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
				 l1=-100;
				 li+=lib;
			 }else if(cid==l1){
				 lib = '<li role=\"presentation\" class=\"active\"><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				 var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
				 l1=-100;
				 li+=lib;
			 }else if(cid==l1){
				 lib = '<li role=\"presentation\" class=\"active\"><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				 var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
				 l1=-100;
				 li+=lib;
			 }else if(cid==l1){
				 lib = '<li role=\"presentation\" class=\"active\"><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				 var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
				 l1=-100;
				 li+=lib;
			 }else if(cid==l1){
				 lib = '<li role=\"presentation\" class=\"active\"><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				 var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
				 l1=-100;
				 li+=lib;
			 }else if(cid==l1){
				 lib = '<li role=\"presentation\" class=\"active\"><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				 var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
				 l1=-100;
				 li+=lib;
			 }else if(cid==l1){
				 lib = '<li role=\"presentation\" class=\"active\"><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				 var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
				 l1=-100;
				 li+=lib;
			 }else if(cid==l1){
				 lib = '<li role=\"presentation\" class=\"active\"><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				 var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
				 l1=-100;
				 li+=lib;
			 }else {
				 li += '<li role=\"presentation\" class><a  href=\"#Y'+data[i].cid+'\"role=\"tab\" data-toggle=\"tab\">'+data[i].cname+'</a></li>';
				 var ri = '<div role=\"tabpanel\" class=\"tab-pane\" id=\"Y'+data[i].cid+'\"></div>';
				 l1++;
			 }
	   	 if(cid==0){
	   		var ri = '<div role=\"tabpanel\" class=\"tab-pane active\" id=\"Y'+data[i].cid+'\"></div>';
	   	 }
		 lis += li;
		 
		 
		 ris += ri;
	     bis+=bi;  
	    }
	    
	    //拼接收藏排行榜的li,<li><a href="favoriterank.html">收藏排行榜</a></li>
	    
	    //lis+= '<li><a href="favoriterank.html">收藏排行榜</a></li>';
	
	    //将lis字符串，设置到ul的html内容中
	    
	    $("#category").html(lis);
	    $("#category2").html(bis);
	    $("#content2").html(ris);
	});
	/*
	<div role="tabpanel" class="tab-pane active" id="route.jsp?cid=1">
		<div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/carousel/carousel-4.png"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <p>冬季珊瑚绒加绒加厚</p>
                                    <a href="#"><h4>￥99.8</h4></a>
                                    <a href="#"><img src="../../src/img/header-main/search.svg"></a>
                                    <b>收 藏</b>
                                </div>
                            </div>
                        </div>
                        </div>
                        
                        
	*/
	$.get("../../FindAllGoodsServlet",{},function (data) {
	    var lis1 = "";var lis2 = "";var lis3 = "";var lis4 = "";
	    var lis5 = "";var lis6 = "";var lis7 = "";var lis8 = "";var lis9 = "";
	    for (var i = 0; i < data.length; i++) {
	    	var li  = '<div class=\"col-sm-6 col-md-3\">';
	    	li+='<div class=\"thumbnail\">';
	    	var img = data[i].gphoto.split("&")[0];
	    	//li+='<img src=\"../'+img+'\" alt=\"通用的占位符缩略图\">';
	    	li+='<a  href=\"good.jsp?gid='+data[i].gid+'\"><img src=\"../../src/'+img+'\" alt=\"通用的占位符缩略图\"></a>';
            li+='<div class=\"caption\">';
            // li+='<p>'+data[i].gname+"</p>";
            li+='<a  href=\"good.jsp?gid='+data[i].gid+'\"><p>'+data[i].gname+'</p></a>';
            li+='<a  href=\"good.jsp?gid='+data[i].gid+'\"><h4>￥'+data[i].price+'</h4></a>';
            li+='<a  href=\"good.jsp?gid='+data[i].gid+'\"><img src=\"../../src/img/header-main/search.svg\"></a>';
            li+='<b>收 藏</b>';
	   	  	li += '</div></div></div>';
	    	if(data[i].cid==1){
	    		lis1+=li;
	    	}else if(data[i].cid==2){
	    		lis2+=li;
	    	}else if(data[i].cid==3){
	    		lis3+=li;
	    	}else if(data[i].cid==4){
	    		lis4+=li;
	    	}else if(data[i].cid==5){
	    		lis5+=li;
	    	}else if(data[i].cid==6){
	    		lis6+=li;
	    	}else if(data[i].cid==7){
	    		lis7+=li;
	    	}else if(data[i].cid==8){
	    		lis8+=li;
	    	}else if(data[i].cid==9){
	    		lis9+=li;
	    	}
	    }
	    //拼接收藏排行榜的li,<li><a href="favoriterank.html">收藏排行榜</a></li>
	    
	    //lis+= '<li><a href="favoriterank.html">收藏排行榜</a></li>';
	
	    //将lis字符串，设置到ul的html内容中
	    
	    $("#Y1").html(lis1);
	    $("#Y2").html(lis2);
	    $("#Y3").html(lis3);
	    $("#Y4").html(lis4);
	    $("#Y5").html(lis5);
	    $("#Y6").html(lis6);
	    $("#Y7").html(lis7);
	    $("#Y8").html(lis8);
	    $("#Y9").html(lis9);
	});
	function search(){
  	  var content = document.getElementById("search2").value;
  	  $.get("../../SearchGoodsServlet",{content:content},function (data) {
  		  window.location.href="/MushroomStreet/jsp/individuals/route.jsp?cid="+data;
  	  });
    }
</script>
<body>
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
                    <!-- <li><a href="#">上衣</a></li>
                    <li><a href="#">裙子</a></li>
                    <li><a href="#">裤子</a></li>
                    <li><a href="#">女鞋</a></li>
                    <li><a href="#">包包</a></li>
                    <li><a href="#">男友</a></li>
                    <li><a href="#">家居</a></li>
                    <li><a href="#">内衣</a></li>
                    <li><a href="#">母婴</a></li> -->
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

    </div>
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

    <!--商品展示-->
        <div class="choose">
            <div class="row">
                <div class="col-md-12">
                    <ul class="nav nav-pills navbar-center" role="tablist" id="category">
                    	<!--  
                        <li role="presentation" class="active">
                            <a href="#shouye" role="tab" data-toggle="tab">首页</a>
                        </li>
                        <li role="presentation">
                            <a href="#shangyi" role="tab" data-toggle="tab">上衣</a>
                        </li>
                        <li role="presentation">
                            <a href="#qunzi" role="tab" data-toggle="tab">裙子</a>
                        </li>
                        <li role="presentation">
                            <a href="#kuzi" role="tab" data-toggle="tab">裤子</a>
                        </li>
                        <li role="presentation">
                            <a href="#xiezi" role="tab" data-toggle="tab">鞋子</a>
                        </li>
                        <li role="presentation">
                            <a href="#baobao" role="tab" data-toggle="tab">包包</a>
                        </li>
                        <li role="presentation">
                            <a href="#nanyou" role="tab" data-toggle="tab">男友</a>
                        </li>
                        <li role="presentation">
                            <a href="#muyin" role="tab" data-toggle="tab">母婴</a>
                        </li>
                        <li role="presentation">
                            <a href="#jiaju" role="tab" data-toggle="tab">家居</a>
                        </li>
                        -->
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tab-content" id="content2">
                    <!--首页-->
                    <!-- <div role="tabpanel" class="tab-pane active" id="route.jsp?cid=1">
                         <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/carousel/carousel-4.png"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <p>冬季珊瑚绒加绒加厚</p>
                                    <a href="#"><h4>￥99.8</h4></a>
                                    <a href="#"><img src="../../src/img/header-main/search.svg"></a>
                                    <b>收 藏</b>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/carousel/carousel-5.png"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <p>冬季珊瑚绒加绒加厚</p>
                                    <a href="#"><h4>￥99.8</h4></a>
                                    <a href="#"><img src="../../src/img/header-main/search.svg"></a>
                                    <b>收 藏</b>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/carousel/carousel-6.png"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <p>冬季珊瑚绒加绒加厚</p>
                                    <a href="#"><h4>￥99.8</h4></a>
                                    <a href="#"><img src="../../src/img/header-main/search.svg"></a>
                                    <b>收 藏</b>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/carousel/carousel-7.png"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <p>冬季珊瑚绒加绒加厚</p>
                                    <a href="#"><h4>￥99.8</h4></a>
                                    <a href="#"><img src="../../src/img/header-main/search.svg"></a>
                                    <b>收 藏</b>
                                </div>
                            </div>
                        </div>

						


                    </div>-->
                    <!--上衣
                    <div role="tabpanel" class="tab-pane active" id="shangyi">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/斗破苍穹.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>斗破苍穹</h3>
                                    <p>一个发生在斗气大陆的故事</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/秦时明月.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>秦时明月</h3>
                                    <p>诸子百家，争相斗艳。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/超兽武装.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>超兽武装</h3>
                                    <p>平行世界，英雄少年。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/熊出没.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>熊出没</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
					  -->
                    <!--裙子--><!--
                    <div role="tabpanel" class="tab-pane active" id="qunzi">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/蜘蛛侠.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>蜘蛛侠</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/变形金刚.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>变形金刚</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/忍者神龟.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>忍者神龟</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <!--裤子--><!-- 
                    <div role="tabpanel" class="tab-pane active" id="kuzi">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/加菲猫.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>加菲猫</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/变形金刚.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>缩略图标签</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/小猪佩奇.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>小猪佩奇</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <!--鞋子--><!--  
                    <div role="tabpanel" class="tab-pane active" id="xiezi">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/加菲猫.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>加菲猫</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/变形金刚.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>缩略图标签</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/小猪佩奇.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>小猪佩奇</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>-->

                    <!--包包--><!--  
                    <div role="tabpanel" class="tab-pane active" id="baobao">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/蜘蛛侠.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>蜘蛛侠</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/虹猫蓝兔七侠传.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>虹猫蓝兔七侠传</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="../../src/img/忍者神龟.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>缩略图标签</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>  -->
                    <!--男友--><!--
                    <div role="tabpanel" class="tab-pane active" id="nanyou">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/加菲猫.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>加菲猫</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/变形金刚.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>缩略图标签</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/小猪佩奇.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>小猪佩奇</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <!--母婴--><!--
                    <div role="tabpanel" class="tab-pane active" id="muyin">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/加菲猫.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>加菲猫</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/变形金刚.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>缩略图标签</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/小猪佩奇.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>小猪佩奇</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <!--家居--><!--
                    <div role="tabpanel" class="tab-pane active" id="jiaju">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/加菲猫.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>加菲猫</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/变形金刚.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>缩略图标签</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="
                            ../../src/img/小猪佩奇.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>小猪佩奇</h3>
                                    <p>一些示例文本。一些示例文本。</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            播放
                                        </a>
                                        <a href="#" class="btn btn-default" role="button">
                                            缓存
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>
       

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