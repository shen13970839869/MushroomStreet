  function CkPS() {
    var pw2=document.getElementById("Rpassword2").value
        var pw1=document.getElementById("Rpassword").value
		if(pw2==pw1){
			pw2.oninvalid = function() {
    this.setCustomValidity('两次密码不一致！');
			}
}
			
			else{
					pw2.oninvalid = function() {
    this.setCustomValidity('两次密码不一致！');
	
	
				}}}





  
  
  /*window.onload = function () {
    //给表单绑定onsubmit事件
    document.getElementById("lgForm").onsubmit = function () {
        return CkUsername() && CkPassword();
    }

    //给用户名和密码框、Email、姓名、手机号分别绑定离焦事件
    document.getElementById("username").onblur = CkUsername;
    document.getElementById("password").onblur = CkPassword;
}

//校验用户名
function CkUsername() {
    //获取用户名的值
    var username = document.getElementById("username").value;

    //定义正则表达式
    var reg_username = /^[a-zA-Z0-9_-]{4,8}$/;
    //判断值是否符合正则表达式的规则
    var flag = reg_username.test(username);

    //提示信息
    var s_username = document.getElementById("s_username");

    if (flag) {
        //提示绿色对勾
        s_username.innerHTML = "<img src='gou.png' width='35' height='25'>";
    } else {
        //提示红色错误信息
        s_username.innerHTML = "用户名格式有误！";
    }
    return flag;
}

//校验密码
function CkPassword(){
    //1.获取密码的值
    var password = document.getElementById("password").value;
    //2.定义正则表达式
    var reg_password = /^[a-zA-Z0-9]{8,16}$/;
    //3.判断值是否符合正则的规则
    var flag = reg_password.test(password);
    //4.提示信息
    var s_password = document.getElementById("s_password");

    if(flag){
        //提示绿色对勾
        s_password.innerHTML = "<img style='top:50px' width='35' height='25' src='gou.png'/>";
    }else{
        //提示红色错误信息
        s_password.innerHTML = "请输入8~16位由数字和字母组成的密码！";
    }
    return flag;
}*/

