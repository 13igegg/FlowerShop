<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情页</title>

</head>
<body>
	<%@ include file="header.jsp"%>
  
    	<div style="margin: 0 auto;width: 90%;">
	   <ol class="breadcrumb">
		  <li><a href="#">FlowerShop</a></li>
		  <li><a href="#">itme</a></li>
		  <li class="active"><a href="getGoodsListByTypeId?typeid=${product.tid}">itme</a></li>
	   </ol>
   </div>
   
	<div class="container">
		<div class="row">
		  <div class="col-xs-6 col-md-6">
		    <a href="#" class="thumbnail">
		      <img src="${pageContext.request.contextPath}/${product.pimage}"  width="560" height="560"  alt="${product.pname}" />
		    </a>
		  </div>
		  <div class="col-xs-6 col-md-6">
		   	<div class="panel panel-default" style="height: 560px;margin:20% 20%;border:none;">
			  <div class="panel-body">
			    <p style="font-size: 30px">产品名称:&nbsp;${product.pname}</p>
			    <div style="margin-left: 10px;">
				    
				   <p>市场价格:&nbsp<span class="text-danger" style="font-size: 15px;">${product.pprice}</span>&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-yen"></span></p>
				    <p>上市时间:&nbsp${product.ptime}</p>
				     <p>推荐指数:&nbsp
						<c:forEach begin="1" end="${product.pstate}">
							☆
				        	</c:forEach>
					</p>
				    <p>详细介绍:&nbsp${product.pinfo }</p>
				    <a href="${pageContext.request.contextPath}/cart?method=create&pid=${product.pid}" class="btn btn-warning">加入购物车&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
			    </div>
			  </div>
			</div>
		  </div>
		</div>
	</div>



</body>
</html>