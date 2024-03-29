<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Role</title>
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
            <li><a href="#">角色管理</a></li>
        </ul>
    </div>

    <div class="rightinfo">
        <div class="tools">
            <ul class="toolbar">
                <li class="click"><span><img src="/images/t01.png" /></span>添加</li>
                <li class="click"><span><img src="/images/t02.png" /></span>修改</li>
                <li><span><img src="/images/t03.png" /></span>删除</li>
                <li><span><img src="/images/t04.png" /></span>统计</li>
            </ul>
            <ul class="toolbar1">
                <li><span><img src="/images/t05.png" /></span>设置</li>
            </ul>
        </div>
        <table class="tablelist">
            <thead>
                <tr>
                    <th><input name="" type="checkbox" value="" checked="checked" /></th>
                    <th>编号<i class="sort"><img src="/images/px.gif" /></i></th>
                    <th>角色名称</th>
                    <th>角色描述</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list }" var="role">
                    <tr>
                        <td><input name="" type="checkbox" value="" /></td>
                        <td>${role.roleId}</td>
                        <td>${role.roleName}</td>
                        <td>${role.roleDesc}</td>
                        <td><a href="#" class="tablelink">查看</a> <a href="#"
                            class="tablelink"> 删除</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
</body>
</html>