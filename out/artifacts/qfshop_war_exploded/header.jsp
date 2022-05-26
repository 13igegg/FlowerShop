<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%--<link rel="stylesheet" type="text/css" href="css/login2.css">--%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<title>头部</title>
    <script type="text/javascript">
        $(document).ready(function(){
            $.ajax({
                url:"${pageContext.request.contextPath}/type?method=findAll",
                type:"GET",
                dataType:"json",
                success:function(data){
                    for(var i in data){
                        var a = $("<a href='${pageContext.request.contextPath}/product?method=show&tid="+data[i].tid+"'>"+data[i].tname+"</a>");
                        $("#goodsType").append(a);

                    }
                },
                error:function(){
                    alert("失败");
                }
            })
        })
    </script>
    <style>
        a{
            font-size: 20px;
            font-weight: bold;
        }
        .heardnav:hover{
            text-decoration:none;
        }
    </style>
</head>
<body style="margin-bottom: 100px">

<nav class="nav navbar-default navbar-fixed-top" role="navigation" style="height: 64px;background-color: #ffffff;padding-top: 10px;padding-bottom: 10px;">
    <div class="container-fluid">
        <div class="navbar-header">
                <span>
                    <a class="heardnav" href="index.jsp"  target="_blank" title="首页" style="color:#777777;font-size: 35px">
                        FlowerShop❀
                    </a>
                </span>
        </div>

        <ul class="nav navbar-nav navbar-right">

            <c:if test="${empty loginUser}">
                <li><a href="login.jsp" class="ul" title="用户登录">
                    登录
                </a></li>

                <li><a href="register.jsp" class="ur" title="注册">
                    注册
                </a></li>
            </c:if>
            <c:if test="${not empty loginUser}">
                <li><a href="address?method=show" class="as">${loginUser.username}，你好！</a>
                </li>
                <li><a href="user?method=logOut" class="ue" title="用户退出">
                    退出
                </a></li>

                <li><a href="order?method=show" class="uo" title="我的订单">
                    订单
                </a></li>

                <li><a href="address?method=show" class="ag" title="地址管理">
                    地址
                </a></li>
            </c:if>

            <li><a href="" class="info" title="消息通知">
                通知
            </a></li>
            <li><a href="${pageContext.request.contextPath}/cart?method=show&uid=${loginUser.uid}" title="购物车" class="cs" style="font-size: 25px; font-weight: bolder;">
                购物车
            </a></li>

        </ul>
    </div>
</nav>
</body>
</html>