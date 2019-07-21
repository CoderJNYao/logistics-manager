<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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
    	$.ajax({
    		url:"/basic/getParentData",
    		dataType:"json",
    		success:function(data){
    			var p = $("#parentid")[0];
    			for(i =0;i<data.length;i++){
    				var opt = document.createElement("option");
    				opt.text = data[i].baseName;
    				opt.value = data[i].baseId;
    				p.appendChild(opt);
    			}
    		}
    	});
    	$("#parentid").change(function(){
    		window.location.href="/basic/searchData?id="+$("#parentid").val();
		});
    });

</script>

</head>

<body>

    <div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="#">首页</a></li>
            <li><a href="#">数据表</a></li>
            <li><a href="#">基本内容</a></li>
        </ul>
    </div>
    <div class="rightinfo">
        <div class="tools">
            <ul class="toolbar">
                <li class="click">
                    <a href="basicUpdate">
                        <span>
                                <img src="/images/t01.png" />
                        </span>
                        添加
                    </a>
                </li>
                <li class="click"><span><img src="/images/t02.png" /></span>修改</li>
                <li><span><img src="/images/t03.png" /></span>删除</li>
                <li>
                	<select name="id" id="parentid" class="chosen-select" style="width:200px; height:33px;">
                    	<option>全部</option>
                    </select>
                </li>
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
                    <th>基础数据</th>
                    <th>父节点</th>
                    <th>描述信息</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="basicp">
                <c:if test="${empty basicp.parentId}">
                    <tr>
                        <td><input name="" type="checkbox" value="" /></td>
                        <td>${basicp.baseId }</td>
                        <td>${basicp.baseName}</td>
                        <td>${basicp.parentId}</td>
                        <td>${basicp.baseDesc}</td>
                        <td>
                            <a href="/basic/basicUpdate?id=${basicp.baseId }" 
                            class="tablelink">修改</a> 
                            <a href="javascript:void(0)" onclick="deleteBasic(${basicp.baseId})" 
                            class="tablelink"> 删除</a></td>
                    </tr>
                    <c:forEach items="${list}" var="basic">
                    	<c:if test="${basic.parentId == basicp.baseId}">
                    		<tr>
                        <td><input name="" type="checkbox" value="" /></td>
                        <td style="padding-left:40px;">${basic.baseId }</td>
                        <td style="padding-left:40px;">${basic.baseName }</td>
                        <td>${basic.parentId }</td>
                        <td>${basic.baseDesc }</td>
                        <td>
                            <a href="/basic/basicUpdate?id=${basic.baseId }" 
                            class="tablelink">修改</a> 
                            <a href="javascript:void(0)" onclick="deleteBasic(${basic.baseId})" 
                            class="tablelink"> 删除</a></td>
                    </tr>
                    	</c:if>
                    </c:forEach>
                 </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
        function deleteBasic(baseId){
            if(window.confirm("确定要删除该数据吗?")){
                location.href="/basic/delete?id="+baseId;
            }
        }
    </script>
</body>
</html>