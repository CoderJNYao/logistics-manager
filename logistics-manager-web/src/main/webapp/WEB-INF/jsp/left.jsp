<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){   
    //导航切换
    $(".menuson li").click(function(){
        $(".menuson li.active").removeClass("active")
        $(this).addClass("active");
    });
    
    $('.title').click(function(){
        var $ul = $(this).next('ul');
        $('dd').find('ul').slideUp();
        if($ul.is(':visible')){
            $(this).next('ul').slideUp();
        }else{
            $(this).next('ul').slideDown();
        }
    });
})  
</script>


</head>

<body style="background:#f0f9fd;">
    <div class="lefttop"><span></span>主菜单</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>管理信息
    </div>
        <ul class="menuson">
        <li><cite></cite><a href="index.html" target="rightFrame">首页模版</a><i></i></li>
        <li><cite></cite><a href="/user/queryPage" target="rightFrame">用户管理</a><i></i></li>
        <li><cite></cite><a href="/role/query" target="rightFrame">角色管理</a><i></i></li>
        <li><cite></cite><a href="/basic/query" target="rightFrame">基础数据管理</a><i></i></li>
		<shiro:hasAnyRoles name="业务员,操作员,管理员">
		    <li><cite></cite><a href="/customer/query" target="rightFrame">客户管理</a><i></i></li>
		</shiro:hasAnyRoles>
        </ul>    
    </dd>
    </dl>
    
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>