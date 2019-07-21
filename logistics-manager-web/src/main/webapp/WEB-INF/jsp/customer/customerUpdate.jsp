<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="/js/select-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
        width : 345           
    });
    $(".select2").uedSelect({
        width : 167  
    });
    $(".select3").uedSelect({
        width : 100
    });
});
function sub(){
	var customerName = $("#customerName").val();
	var mobilePhone = $("#mobilePhone").val();
	var email = $("#email").val();
	var idCard = $("#idCard").val();
	if(customerName == ""){
		alert("客户姓名不能为空");
		return false;
	}
	reg =/^[\u4e00-\u9fa5]{2,4}$/;
	if (!reg.test(customerName)) {
		alert("客户姓名只能为汉字！");
		return false;
	}
	if (mobilePhone == "") {
		alert("客户电话不能为空！");
		return false;
	}
	reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
	if (!reg.test(mobilePhone)) {
		alert("客户电话格式不正确！");
		return false;
	}
	if (email == "") {
		alert("邮箱不能为空！");
		return false;
	}
	reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	if (!reg.test(email)) {
		alert("邮箱格式不正确！");
		return false;
	}
	if(idCard == ""){
		alert("身份证号不能为空");
		return false;
	}
	reg = /^\d{15}|\d{18}$/;
	if (!reg.test(idCard)) {
		alert("身份证号格式不正确！");
		return false;
	}
    $("#customerForm").submit();
}
</script>
</head>
<body>
    <div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="/">首页</a></li>
            <li><a href="/customer/query">客户管理</a></li>
        </ul>
    </div>
    <div class="formbody">

        <div class="formtitle">
            <span>客户信息</span>
        </div>
        <form action="/customer/saveOrUpdate" id="customerForm">
            <ul class="forminfo">
                <input type="hidden" name="customerId" value="${dto.customer.customerId}">
                <li><label>客户姓名</label>
                    <input id="customerName" name="customerName"  type="text" value="${dto.customer.customerName}" class="dfinput" />
                    <i></i>
                </li>
                <li><label>客户电话</label>
                    <input id="mobilePhone" name="mobilePhone" type="text" value="${dto.customer.mobilePhone}" class="dfinput" />
                </li>
                <li><label>性别 ${dto.customer.cSex}</label>
                    <input type="radio" name="cSex" value="0"  ${dto.customer.cSex eq true?"checked":"" }>&nbsp;男 
                    <input type="radio" name="cSex" value="1" ${dto.customer.cSex eq false?"checked":"" }>&nbsp;女
                </li>
                
                <li><label>电子邮箱</label>
                    <input id="email" name="email" type="text" class="dfinput" value="${dto.customer.email}"/><i></i>
                </li>
                <li><label>通讯地址</label>
                    <input name="address" type="text" class="dfinput"  value="${dto.customer.address}"/><i></i>
                </li>
                <li><label>身份证号码</label>
                    <input id="idCard" name="idCard" type="text" class="dfinput"  value="${dto.customer.idCard}"/><i></i>
                </li>
                
                <li><label>业务员</label>
                    <div class="vocation">
                        <select class="select1" name="userId">
                        <!-- 和新增客户区分开 -->
                        <c:if test="${empty dto}">
                            <c:forEach items="${ users}" var="user">
                                <option value="${user.userId }" >
                                    ${user.realName }
                                </option>
                            </c:forEach>
                        </c:if>
                        <c:if test="${not empty dto }">
                            <shiro:hasAnyRoles name="业务员,操作员">
                                <option value="${dto.customer.userId }" >${dto.salesMan }</option>
                            </shiro:hasAnyRoles>
                            <shiro:hasRole name="管理员">
                                <c:forEach items="${ users}" var="user">
                                    <option value="${user.userId }" ${user.userId eq dto.customer.userId?"selected":"" } >
                                        ${user.realName }
                                    </option>
                                </c:forEach>
                            </shiro:hasRole>
                        </c:if>
                        </select>
                    </div>
                    <i></i>
                </li>
                <li><label>常用区间</label>
                    <div class="vocation">
                        <select class="select1" name="baseId">
                        <c:forEach items="${ intervals}" var="it">
                            <option value="${it.baseId }" ${it.baseId eq dto.customer.baseId?"selected":"" }>
                                ${it.baseName }
                            </option>
                        </c:forEach>
                        </select>
                    </div>
                    <i></i>
                </li>
                 <li><label>备注</label>
                    <textarea name="remark" cols="" rows="" class="textinput" >
                        ${dto.customer.remark }
                    </textarea>
                 </li>
                <li><label>&nbsp;</label>
                    <button name="" type="button"
                    class="btn" onclick="sub();">提交</button></li>
                </ul>
        </form>
        
    </div>
    <div style="display: none">
        <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
            language='JavaScript' charset='gb2312'></script>
    </div>
</body>
</html>