/*登入验证*/
var username=null;
var password=null;
var Rpassword=null;
$(document).ready(function () {
	username = $("#username");
    password = $("#password");
    email= $("#email");
    Rpassword=$("#Rpassword");
    Rpassword2=$("#Rpassword2");
    
    username.next().html("*");
    password.next().html("*");
    email.next().html("*");
    Rpassword.next().html("*");
    Rpassword2.next().html("*");
    $("#btn_login").click(function () {
      //  var name=$("#name").val();//用value时传递的是空值
        var params={username:username.val(),password:password.val()}
        $.ajax({
            method:"POST",
            url:"LoginServlet",
            data:params,
           // data:{method:"select",userCode:$("input[name='userCode']").val(),userPassword:$("input[name='userPassword']").val()},
            dataType:"json",
            success:function (data) {          	
           //  var result= Json.stringify(data.result);//将JSon对象转换为字符窜
                if(data.result == "false"){//账号与密码为空  
                	var check=$("#lol");
                	check.text("账号或密码不能为空");
                	check.css({"color":"red","visibility":"visible","font-size":"16px"});
                	check.css('display','block');
                	setTimeout(function(){
                		check.css('display','none');
                	},2000);
                }else if(data.result == "true"){//账号可用，密码正确，正确提示
                   // window.alert("该用户可以登入");
                    window.location.href="/MushroomStreet/index.jsp"
                }else if(data.result == "faile"){//账号可用，但密码错误
                	var check=$("#lolo");
                	check.text("密码错误");
                	check.css({"color":"red","visibility":"visible","font-size":"16px"});
                	check.css('display','block');
                	setTimeout(function(){
                		check.css('display','none');
                	},2000);              
                }else if(data.result == "fault"){//账号不存在，错误提示
                	var check=$("#lol");
                	check.text("账号错误");
                	check.css({"color":"red","visibility":"visible","font-size":"16px"});
                	check.css('display','block');
                	setTimeout(function(){
                		check.css('display','none');
                	},2000);              
                }
                
            },
        
        });
    });
    /*新密码格式*/
    Rpassword.on("focus",function(){
		//validateTip(Rpassword.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
	}).on("blur",function(){
		if( Rpassword.val() != null &&  Rpassword.val().length > 6
				&&  Rpassword.val().length < 20 ){
			var check=$("#pwd");
			check.text("密码格式正确");
        	check.css({"color":"red","visibility":"visible","font-size":"16px"});
        	check.css('display','block');
        	setTimeout(function(){
        		check.css('display','none');
        	},2000);  
			//alert("密码格式正确")
			//validateTip(Rpassword.next(),{"color":"green"},imgYes,true);
		}else{
			var check=$("#pwd");
			check.text("密码长度必须大于6小于20");
        	check.css({"color":"red","visibility":"visible","font-size":"16px"});
        	check.css('display','block');
        	setTimeout(function(){
        		check.css('display','none');
        	},2000);  
		//	validateTip(Rpassword.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
		}
	}); 
    /*重新输入密码*/
    Rpassword2.on("focus",function(){
		//validateTip(rnewpassword.next(),{"color":"#666666"},"* 请输入与上面一致的密码",false);
	}).on("blur",function(){
		if(Rpassword2.val() != null && Rpassword2.val().length > 6
				&& Rpassword2.val().length < 20 && Rpassword.val() == Rpassword2.val()){
			//validateTip(rnewpassword.next(),{"color":"green"},imgYes,true);
			var check=$("#pwd2");
			check.text("密码格式正确");
        	check.css({"color":"red","visibility":"visible","font-size":"16px"});
        	check.css('display','block');
        	setTimeout(function(){
        		check.css('display','none');
        	},2000); 
		}else{
			var check=$("#pwd2");
			check.text("两次密码输入的不一致");
        	check.css({"color":"red","visibility":"visible","font-size":"16px"});
        	check.css('display','block');
        	setTimeout(function(){
        		check.css('display','none');
        	},2000); 
			//validateTip(rnewpassword.next(),{"color":"red"},imgNo + " 两次密码输入不一致，请重新输入",false);
		}
	});
    /*邮箱验证*/
   email.on("focus",function(){
		//validateTip(newpassword.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
	}).on("blur",function(){
		var reg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		var msg=email.val();
		var result=reg.test(msg)
		//alert(result);
		if(msg != null && reg.test(msg) ){
			//validateTip(newpassword.next(),{"color":"green"},imgYes,true);
			var check=$("#emailname");
        	check.text("邮箱格式正确");
        	check.css({"color":"red","visibility":"visible","font-size":"16px"});
        	check.css('display','block');
        	setTimeout(function(){
        		check.css('display','none');
        	},2000); 
		}else{
			//validateTip(newpassword.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
			var check=$("#emailname");
        	check.text("邮箱格式错误");
        	check.css({"color":"red","visibility":"visible","font-size":"16px"});
        	check.css('display','block');
        	setTimeout(function(){
        		check.css('display','none');
        	},2000); 
		}
	});
});

/*注册验证*/
/*账号验证*/
$(function(){
	$("#Rusername").blur(function(){
		var Rusername = $("#Rusername")
		var Rpassword=$("#Rpassword")
		var email=$("#email")
		 var params={Rusername:Rusername.val(),Rpassword:Rpassword.val(),email:email.val()}
		$.ajax({
			method:"POST",
			url:"RegisterServlet2",
			data:params,
			dataType:"json",
			 success:function (data) {          	
		           //  var result= Json.stringify(data.result);//将JSon对象转换为字符窜
		                if(data.result == "false"){//账号不存在，错误提示   
		                	var check=$("#textname");
		                	check.text("账号格式不正确");
		                	check.css({"color":"red","font-size":"16px"});
		                	check.css('display','block');
		                	setTimeout(function(){
		                		check.css('display','none');
		                	},2000);
		                }else if(data.result == "true"){//账号可用，正确提示
		                	var check=$("#textname");
		                	check.text("账号可以注册");
		                	check.css({"color":"red","font-size":"16px"});
		                	check.css('display','block');
		                	setTimeout(function(){
		                		check.css('display','none');
		                	},2000);
		                }else if(data.result == "faile"){//账号不可用
		                	var check=$("#textname");
		                	check.text("账号已存在");
		                	check.css({"color":"red","visibility":"visible","font-size":"16px"});
		                	check.css('display','block');
		                	setTimeout(function(){
		                		check.css('display','none');
		                	},2000);              
		                }
		            },
		}) ;	
	});
});
/*提交验证*/
$(function(){
	$("#Rbtn_rg").click(function(){
		var Rusername = $("#Rusername")
		var Rpassword=$("#Rpassword")
		var email=$("#email")
		var Rpassword2=$("#Rpassword2")
		 var params={Rusername:Rusername.val(),Rpassword:Rpassword.val(),email:email.val(),Rpassword2:Rpassword2.val()}
		$.ajax({
			method:"POST",
			url:"RegisterServlet",
			data:params,
			dataType:"json",
			 success:function (data) {          	
		           //  var result= Json.stringify(data.result);//将JSon对象转换为字符窜
		                if(data.result == "false"){//账号不可用或者两次输入的密码不一致，错误提示   
		                	var check=$("#textname");
		                	check.text("账号已存在或者两次输入的密码不一致");
		                	check.css({"color":"red","font-size":"16px"});
		                	check.css('display','block');
		                	setTimeout(function(){
		                		check.css('display','none');
		                	},2000);
		                }else if(data.result == "true"){//账号可用，密码正确，正确提示
		                    window.location.href="/MushroomStreet/ToLoginServlet"
		                }else if(data.result == "faile"){
		                	var check=$("#textname");
		                	check.text("账号，邮箱，密码不能为空");
		                	check.css({"color":"red","visibility":"visible","font-size":"16px"});
		                	check.css('display','block');
		                	setTimeout(function(){
		                		check.css('display','none');
		                	},2000);              
		                }
		            },
		}) ;
	});
});