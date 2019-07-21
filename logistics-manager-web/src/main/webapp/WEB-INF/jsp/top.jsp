<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>top</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){   
    //顶部导航切换
    $(".nav li a").click(function(){
        $(".nav li a.selected").removeClass("selected")
        $(this).addClass("selected");
    })  
})  
</script>
</head>
<body style="background:url(images/topbg.gif) repeat-x;">
    <div class="topleft">
    <img src="images/logo.png" title="系统首页" />
    </div>
    <div class="topright">    
    <ul>
    <li><a href="/logout.do" target="_parent">退出</a></li>
    </ul>
    <div class="user">
    <span>
   	<shiro:principal property="userName"/>
    </span>
    </div>    
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>