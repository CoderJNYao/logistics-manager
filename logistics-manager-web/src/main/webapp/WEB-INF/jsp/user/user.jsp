<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $(".click").click(function() {
            $(".tip").fadeIn(200);
        });

        $(".tiptop a").click(function() {
            $(".tip").fadeOut(200);
        });

        $(".sure").click(function() {
            $(".tip").fadeOut(100);
        });

        $(".cancel").click(function() {
            $(".tip").fadeOut(100);
        });

    });
</script>
</head>
<body>
    <div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="#">首页</a></li>
            <li><a href="#">管理信息</a></li>
            <li><a href="#">用户管理</a></li>
        </ul>
    </div>
    <div class="rightinfo">
        <div class="tools">
            <ul class="toolbar">
                <li class="click">
                <a href="userUpdate">
                <span>
                <img src="/images/t01.png" />
                </span>
                	添加
                	</a>
                </li>
            </ul>
        </div>
        <table class="tablelist">
            <thead>
                <tr>
                    <th>编号<i class="sort"><img src="/images/px.gif" /></i></th>
                    <th>用户名</th>
                    <th>真实姓名</th>
                    <th>邮箱</th>
                    <th>电话</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pageModel.list}" var="user">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.realName}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td><a href="userUpdate?id=${user.userId}" class="tablelink">修改</a> 
                        
                        <a href="javascript:void(0);" onclick="deleteUser(${user.userId})"
                            class="tablelink"> 删除</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="inline pull-right page" style="margin-top: 20px;">
		    <form action="/user/queryPage" id="pager">
		        <input type="hidden" name="pageSize" id="pageSize" value="${pageModel.pageSize }">
		        <input type="hidden" name="pageNum" id="pageNum" value="${pageModel.pageNum }">
		    </form>
		    <jsp:include page="/pageBar.jsp"></jsp:include>
		</div>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
        function deleteUser(userId){
        	if(window.confirm("确定要删除该用户吗？")){
        		location.href="/user/delete?id="+userId;
        	}
        }
    </script>
</body>
</html>