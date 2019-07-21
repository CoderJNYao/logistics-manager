<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
            <li><a href="#">数据表</a></li>
            <li><a href="#">基本内容</a></li>
        </ul>
    </div>
    <div class="rightinfo">
        <div class="tools">
            <ul class="toolbar">
                <shiro:hasAnyRoles name="业务员,操作员">
				                <li class="click">
                    <a href="customerUpdate">
                        <span>
                                <img src="/images/t01.png" />
                        </span>
                   	     添加
                    </a>
                </li>
			</shiro:hasAnyRoles>
            </ul>
        </div>
        <table class="tablelist">
            <thead>
                <tr>
                    <th>编号<i class="sort"><img src="/images/px.gif" /></i></th>
                    <th>客户姓名</th>
                    <th>客户电话</th>
                    <th>邮箱</th>
                    <th>性别</th>
                    <th>业务员</th>
                    <th>常用区间</th>
                    <th>身份证号</th>
                    <th>通讯地址</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pageModel.list}" var="dto">
                    <tr>
                        <td>${dto.customer.customerId }</td>
                        <td>${dto.customer.customerName }</td>
                        <td>${dto.customer.mobilePhone }</td>
                        <td>${dto.customer.email }</td>
                        <td>${dto.customer.cSex eq true?"男":"女" }</td>
                        <td>${dto.salesMan }</td>
                        <td>${dto.interval }</td>
                        <td>${dto.customer.idCard}</td>
                        <td>${dto.customer.address }</td>
                        <td>
                            <a href="/customer/customerUpdate?id=${dto.customer.customerId }" 
                            class="tablelink">修改</a> 
                            <shiro:hasAnyRoles name="业务员,操作员">
							    <c:if test="${dto.orderNum eq 0 or empty dto.orderNum}">
							        <a href="javascript:void(0)" onclick="deleteCustomer(${dto.customer.customerId})" 
							        class="tablelink"> 删除</a>
							    </c:if>
							</shiro:hasAnyRoles>
							</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
            <div class="inline pull-right page" style="margin-top: 20px;">
                <form action="/customer/query" id="pager">
                    <input type="hidden" name="pageSize" id="pageSize" value="${pageModel.pageSize }">
                    <input type="hidden" name="pageNum" id="pageNum" value="${pageModel.pageNum }">
                </form>
                <jsp:include page="/pageBar.jsp"></jsp:include>
            </div>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
        function deleteCustomer(customerId){
            if(window.confirm("确定要删除该用户吗?")){
                location.href="/customer/delete?id="+customerId;
            }
        }
    </script>
</body>
</html>