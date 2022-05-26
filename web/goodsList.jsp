<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表页</title>

	<style>
		.itema{
			text-decoration:none;
			color: #0f0f0f;
		}
		.itema:hover{
			color: #959595;
		}
	</style>

</head>
<body>
	<%@ include file="header.jsp"%>
	
   
<div class="panel panel-default" style="margin: 0 auto;width: 95%;">
	<div class="panel-heading">
	    <h3 class="panel-title"><span class="glyphicon glyphicon-th-list"></span>&nbsp;&nbsp;商品列表</h3>
	</div>
	<div class="panel-body" style="margin-top: 90px">
	   	   <!--列表开始-->
	    <div class="row" style="margin: 0 auto;">
	    	<c:forEach items="${pageBean.list}" var="g" varStatus="i">
		    	<div class="col-sm-3">
				    <div class="thumbnail" style="border: none">
				      <img class="img-rounded" src="${pageContext.request.contextPath}/${g.pimage}" width="180" height="180"  alt="" />
				      <div class="caption" style="margin-left: 20%;">
				        <h4><a class="itema" href="${pageContext.request.contextPath}/product?method=detail&pid=${g.pid}" >&nbsp;${g.pname}</a></h4>
				        <p>&nbsp;推荐指数
				        	<c:forEach begin="1" end="${g.pstate}">
				        		☆
				        	</c:forEach>
				        </p>
				         <p>&nbsp;上架日期:${g.ptime}</p>
			             <p>&nbsp;价格:${g.pprice}</p>
				      </div>
				    </div>
				  </div>
	    	</c:forEach>
			  
		</div>
        <center>
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<li class="${pageBean.currentPage==1?'disabled':''}">
					<a  href="product?method=show&tid=${param.tid}&currentPage=${pageBean.currentPage-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>

				<c:forEach begin="1" end="${pageBean.totalPage}" step="1" var="index">
					<c:if test="${pageBean.currentPage==index}">
						<li class="active"><a href="product?method=show&tid=${param.tid}&currentPage=${index}">${index}</a></li>
					</c:if>

					<c:if test="${pageBean.currentPage!=index}">
						<li ><a href="product?method=show&tid=${param.tid}&currentPage=${index}">${index}</a></li>
					</c:if>
				</c:forEach>

				<li class="${pageBean.currentPage==pageBean.totalPage?'disabled':''}">
					<a href="product?method=show&tid=${param.tid}&currentPage=${pageBean.currentPage+1}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</nav>
		</center>
   	</div>
</div>

</body>
</html>