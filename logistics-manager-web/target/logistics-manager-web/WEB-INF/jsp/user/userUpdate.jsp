<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript">
    	function sub(){
    		var userName = $("#userName").val();
    		var realName = $("#realName").val();
    		var password = $("#password").val();
    		var confirmPassword = $("#confirmPassword").val();
    		var 
    		if(userName == ""){
    			alert("用户名不能为空");
    			return false;
    		}
    		reg = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
    		if(!reg.test(userName)){
    			alert("用户名需以字母开头，长度在5~16之间，只能包含字母、数字和下划线！");
				return false;
    		}
    		if(realName == ""){
    			alert("真实姓名不能为空");
    			return false;
    		}
			reg =/^[\u4e00-\u9fa5]{2,4}$/;
			if (!reg.test(realName)) {
				alert("真实姓名只能为中文！");
				return false;
			}
    		if(password == ""){
    			alert("密码不能为空");
    			return false;
    		}
    		reg = /^[a-zA-Z]\w{5,17}$/;
			if (!reg.test(passowrd)) {
				alert("密码需以字母开头，长度在6~18之间，只能包含字母、数字和下划线！");
				return false;
			}
    		if(confirmPassword == ""){
    			alert("重复密码不能为空");
    			return false;
    		}
    		if(confirmPassword != password){
    			alert("重复密码与密码不一致");
    			return false;
    		}
			if (email.length == 0) {
				alert("邮箱不能为空！");
				return false;
			}
			reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (!reg.test(email)) {
				alert("邮箱格式不正确！");
				return false;
			}
			if (phone.length == 0) {
				alert("电话不能为空！");
				return false;
			}
			reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
			if (!reg.test(phone)) {
				alert("电话格式不正确！");
				return false;
			}
    	    $("#userForm").submit();
    	}
	</script>
</head>
<body>
    <div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="/">首页</a></li>
            <li><a href="/user/query">用户管理</a></li>
        </ul>
    </div>
    <div class="formbody">

        <div class="formtitle">
            <span>基本信息</span>
        </div>

        <form action="/user/saveOrUpdate" id="userForm">
    <ul class="forminfo">
        <input type="hidden" name="user.userId" value="${user.userId}">
        <li><label>账号</label>
            <input id="userName" name="user.userName"  type="text" value="${user.userName}"
            class="dfinput" />
        </li>
        <li><label>姓名</label>
            <input id="realName"name="user.realName" type="text" value="${user.realName}"
            class="dfinput" />
        </li>
        <li><label>密码</label>
            <input id="password"name="user.password" type="password" value="${user.password}"
            class="dfinput" required="required"/>
        </li>
        <li><label>确认密码</label>
            <input id="confirmPassword" name="confirmPassword" value="${user.password}"
            type="password" class="dfinput" />
        </li>
        <li><label>电话</label>
            <input id="phone" name="user.phone" type="text" value="${user.phone}"
            class="dfinput" /><i></i>
        </li>
        <li><label>邮箱</label>
            <input id="phone" name="user.email" type="text" value="${user.email}"
            class="dfinput" /><i></i>
        </li>
        <li><label>分配角色</label>
            <div style="height: 32px;line-height: 32px;">
                <c:set var="flag" value="false"></c:set>
                
                <c:forEach items="${roles }" var="role">
                    <!-- 
                        每循环一次 判断取出来的角色编号在不在用户具有的角色集合中
                        在就设置flag=true
                        不在就设置flag=false
                     -->
                     <c:forEach items="${roleIds }" var="roleId">
                        <c:if test="${roleId eq role.roleId }">
                            <c:set var="flag" value="true"></c:set>
                        </c:if>
                     </c:forEach>
                    <input type="checkbox"  ${flag eq true?'checked':'' } value="${role.roleId }" name="roles">
                     ${role.roleName }&nbsp;&nbsp;
                     
                    <c:set var="flag" value="false"></c:set> 
                </c:forEach>
            </div>
           
        </li>
        <li><label>&nbsp;</label>
            <button type="button" class="btn" onclick="sub();">确认</button></li>
        </ul>
</form>
    </div>
    <div style="display: none">
        <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
            language='JavaScript' charset='gb2312'></script>
    </div>
</body>
</html>