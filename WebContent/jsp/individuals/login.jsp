<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录界面</title>
<link rel="stylesheet" type="text/css" href="src/css/login.css"/>
<link href="tool/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="src/js/jquery.js"></script>
<script type="src/js/jquery-1.11.0.min.js"></script>
<script src="src/js/Ajax.js" type="text/jscript"></script>
<script src="tool/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!--———————————————————————————————————————————————————————————-->
      <script>
       function fadeio(){  
       $(document).ready(function(){
       $("#back").fadeOut(500);            
       $("#fd").fadeIn(500);
        });}                        /*点击"现在注册"的淡入淡出效果函数*/
      </script>
<!--———————————————————————————————————————————————————————————-->
	  
<!--———————————————————————————————————————————————————————————-->
      <script>
       function fadeio2(){  
       $(document).ready(function(){
       $("#fd").fadeOut(500);            
       $("#back").fadeIn(500);
        });}                        /*点击"现在登录"的淡入淡出效果函数*/
      </script>
   
</head>
<!--———————————————————————————————————————————————————————————-->
<body>
<!--———————————————————————————————————————————————————————————-->
<div style="" id="back">                         <!--登录页面整块-->
<div id="login">                            <!--用户登录白色面板块-->
<!--———————————————————————————————————————————————————————————-->
<div id="image_logo">
	<span style="font-size:36px" >用户登录</span>
	<img src="src/img/login/fly_icon.png">
</div>       <!--用户登录及LOGO块-->
<!--———————————————————————————————————————————————————————————-->
<div id="loginForm">                    <!--登录表单方框 -->
        <div  id="lgForm">
        <div id="div_username">
        <input type="text" name="username" id="username" pattern="^[a-zA-Z0-9_]{4,15}$" required oninvalid="setCustomValidity('请输入正确用户名！');" oninput="setCustomValidity('');"   class="text_field" placeholder="请输入账号"/>
        <span id="lol" style="visibility:hidden;margin-left:200px;margin-top:-25px"></span>
        </div>												
            <div id="div_password"><input type="password" name="password" id="password" class="text_field" placeholder="请输入密码" 
            pattern="^[A-Z][a-zA-Z0-9_]{4,15}$" required oninvalid="setCustomValidity('请输入正确密码');" oninput="setCustomValidity('');" />
            <span id="lolo" style="visibility:hidden;margin-left:200px;margin-top:-25px"></span>
            </div>
            <div id="div_forget"><a  id="forget_pwd"  data-toggle="modal" data-target="#myModal1">忘记密码？</a></div>
             <div id="div_rg"><a id="a_rg" href="javascript:void(0);" onclick="fadeio()">没有账号？现在注册!</a></div>

            <div id="div_btn_login"><input type="submit" id="btn_login"  value="马上登录" /></div>
      </div>
   
    </div>
</div>


<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					我忘记密码怎么办？
				</h4>
			</div>
			<div class="modal-body">
			您好！请联系网站管理员处理！</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				
			</div>
	</div><!-- /.modal-content --></div>
</div>
</div>
<!--背景-->
<!--—————————————————————————————————————————————————————————— -->
<div id="back2">
<div id="header">
<p>依《网络安全法》相关要求，即日起蘑菇街会员登陆需绑定手机。为保障您的账户安全及正常使用，如您尚未绑定，请尽快完成绑定，感谢您的理解和支持!</p>
<img src="src/img/login/GTHT.png" width="50px" height="50px;">
</div>
<div id="fd" style=" display:none;">
<div style="" id="register">

  <div id="Rimage_logo"><span style="font-size: 23px; color:#09F; " ><strong>欢迎您加入蘑菇街</strong>！</span><img src="src/img/login/fly_icon.png"></div>

 
         <div id="rgForm">

          <div id="Rdiv_username"><input type="text" name="Rusername" id="Rusername" class="text_field " placeholder="请输入账号" pattern="^[a-zA-Z0-9_]{4,15}$" required oninvalid="setCustomValidity('请输入长度为4~15、由数字和字母组成的用户名！');" oninput="setCustomValidity('');" /> 
          </div>
         <span id="textname" style="margin-left:200px;margin-top:-25px"></span>
           <div id="Rdiv_email"><input type="text" name="email" id="email" class="text_field" placeholder="请输入邮箱" pattern="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$" required oninvalid="setCustomValidity('请输入正确的邮箱！');" oninput="setCustomValidity('');"/>
           </div>
             <span id="emailname" style="margin-left:200px;margin-top:-25px"></span>
          <div id="Rdiv_password"><input type="password" name="Rpassword" id="Rpassword" class="text_field" placeholder="请输入密码"  pattern="^[A-Z][a-zA-Z0-9_]{4,15}$" required oninvalid="setCustomValidity('请输入长度为4~15位、大写字母开头的密码！');" oninput="setCustomValidity('');" /></div>
        	<span id="pwd" style="margin-left:200px;margin-top:-25px"></span>
          <div id="Rdiv_password2"> <input type="password"  id="Rpassword2" class="text_field" placeholder="请确认密码" required  oninvalid="setCustomValidity('请确认您的密码！');" oninput="setCustomValidity('');" /></div>
            <span id="pwd2" style="margin-left:200px;margin-top:-25px"></span>
              <div id="Rdiv_login"><a id="Rlgin_already" href="javascript:void(0);" onclick="fadeio2()" >已有账号？现在登录！</a></div>

          <div id="Rdiv_btn_rg">
            
        <input type="submit" id="Rbtn_rg" value="立即注册"   /></div>

        </div>
    <script>
   window.onload = function () {
    document.getElementById("rgForm").onsubmit = function () {
	return ckps();
	}
    }
   
	function ckps() { 
	var Rpassword2= document.getElementById("Rpassword2").value;
	var Rpassword= document.getElementById("Rpassword").value;
   if(Rpassword2==Rpassword){
	   }
	   else{
		 alert("您输入的两次密码不一致！")
		 return false;
		   }
	}
        
	  
	  </script>
</div></div>
<div id="footer">
<p>
2020© 606最帅的F3 31栋606有限公司
</p>
<p>营业执照：95878544887 营业性演出许可证 | 网络文化经营许可证 | 网络信息服务信用承诺书 | 增值电信业务经营许可证：浙B2-20110349 | 安全责任书 |</p>
<p><img src="src/img/login/190515_0gei4681dhlh0cf9ch0g33j97d88l_20x20.png">浙公网安备 666666620606号 | 互联网药品信息服务资格证书编号：（浙)-经营性-2018-0002 | 浙网食A33010003 | 出版物网络交易平台服务经营备案证 | (浙)网械平台备字[2018]第00006号 |</p>

 


</div>


</div><!--背景-->


<!------------------------- -->







</body>
</html>