<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
            <a href="jsp/admin/login.jsp">退出</a>
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
                <span>用户管理页面</span>
            </div>
            <div class="search">
           		<form method="get" action="AdminUserServlet?method=query&&name=${aa.uname}&&id=${aa.uid}">
					<input name="method" value="query" class="input-text" type="hidden">
					 <span>用户名：</span>
					 <input name="queryname" class="input-text"	type="text" value="">
					 
					 <span>用户角色：</span>
					 <select name="queryUserRole">
						
						   <option value="0">--请选择--</option>
						  <option value="1">用户</option>
                    		<option value="2">游客</option>
                    		<option value="3">管理员</option>
	        		</select>
					 
					 <input type="hidden" name="pageIndex" value="1"/>
					 <input	value="查 询" type="submit" id="searchbutton">
					 <a href="../jsp/useradd.html" >添加用户</a>
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="15%">用户编码</th>
                    <th width="20%">用户名称</th>
                    <th width="20%">用户邮箱</th>
                    <th width="10%">用户角色</th>
                    <th width="35%">操作</th>
                </tr>
                    <c:forEach items="${requestScope.user}" var="aa">
					<tr>
						<td>
						<span>${aa.getUid()}</span>
						</td>
						<td>
						<span>${aa.getUname()}</span>
						</td>
						<td>
						<span>${aa.getEmail()}</span>
						</td>
						<td>
						<span>用户</span>
						</td>
						<td>
						<span><a class="viewUser" href="javascript:;" userid=${aa.uid } username=${aa.uname }><img src="${pageContext.request.contextPath}/src/img/images/read.png" alt="查看" title="查看"/></a></span>
						<span><a class="modifyUser" href="javascript:;" userid=${aa.uid } username=${aa.uname }><img src="${pageContext.request.contextPath}/src/img/images/xiugai.png" alt="修改" title="修改"/></a></span>
						<span><a class="deleteUser" href="javascript:;" userid=${aa.uid } username=${aa.uname }><img src="${pageContext.request.contextPath}/src/img/images/schu.png" alt="删除" title="删除"/></a></span>
						</td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
		  	<div class="page-bar">
			<ul class="page-num-ul clearfix">
				<li>共xx条记录&nbsp;&nbsp; x/xx页</li>
				
					<a href="javascript:page_nav(document.forms[0],1);">首页</a>
					<a href="javascript:page_nav(document.forms[0],${param.currentPageNo-1});">上一页</a>
				
				
					<a href="javascript:page_nav(document.forms[0],${param.currentPageNo+1 });">下一页</a>
					<a href="javascript:page_nav(document.forms[0],${param.totalPageCount });">最后一页</a>
				
				&nbsp;&nbsp;
			</ul>
		 <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key" />页
	     <button type="button" class="page-btn" onClick='jump_to(document.forms[0],document.getElementById("inputPage").value)'>GO</button>
		</span>
		</div> 
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>


<footer class="footer">
  版权归31栋606F3
</footer>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/time.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/calendar/WdatePicker.js"></script>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/userlist.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/js/rollpage.js"></script>