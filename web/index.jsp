<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%--<link rel="stylesheet" type="text/css" href="css/indexstyle.css">--%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>

<title>flowerShop</title>
<style>
    .card img {
        width:224px;
        height: 190px;
        margin-top:15px;
        padding-left: 18px;
    }
    .card{
        height: 370px;
        width: 260px;
        background-color: white;
        /*box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);*/
        /*border-radius: 4px;*/
        display: inline-block;
        margin-left: 3%;
        vertical-align: top;
        margin-bottom: 20px;
    }
    /*.card a {*/
    /*    font-size: 12px;*/
    /*    color: #BFBFBF;*/
    /*    display: block;*/
    /*    letter-spacing: 2px;*/
    /*    padding: 30px 20px;*/
    /*}*/

    .typeitem img {
        width:230px;
        height: 200px;
        margin-top:35px;
        padding-left: 10px;
    }
    .typeitem{
        height: 300px;
        width: 350px;
        background-color: white;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        border-radius: 4px;
        display: inline-block;
        margin-left: 7%;
        vertical-align: top;
    }
    .typeitem a {
        float: right;
        font-size: 20px;
        color: #bfbfbf;
        display: block;
        margin-right: 30px;
        margin-top:70px;
        text-decoration:none;
        /*letter-spacing: 2px;*/
        /*padding: 30px 20px;*/
    }
    .typeitem a:hover{
        color: #0f0f0f;
    }
    .info-font{
        margin-left: 60px;
    }

    .bar{
        margin-top: 150px;
        margin-bottom: 40px;
        width: 100%;
        height: 70px;
        margin-left: 45%;
    }
</style>
</head>
<body >
<%@ include file="header.jsp"%>
<!--网站中间内容开始-->
<div id="thred" style="width: 100%;padding-left:18%;margin-top: 100px" >
    <a href="/product?method=show&amp;tid=1"><img src="image/logo.png" width="1260" height="600"/></a>

</div>

<div class="bar"><p style="font-weight: bolder;font-size: 30px;color:#878787;">&nbsp;&nbsp;/&nbsp;分 类&nbsp;/</p></div>

<div class="typegoods" style="margin-top: 70px;margin-left: 10%">
    <div class="typeitem">
        <div>
            <a href="/product?method=show&amp;tid=1">
                ——<br>
                &nbsp;鲜<br>
                &nbsp;花<br>
                ——<br>
            </a>
        </div>
        <img  src="/image/flower-3.png" alt=""/>

    </div>
    <div class="typeitem">
        <div>
            <a href="/product?method=show&amp;tid=2">
                ——<br>
                &nbsp;永<br>
                &nbsp;生<br>
                &nbsp;花<br>
                ——<br>
            </a>
        </div>
        <img  src="/image/dried-1.jpg" alt=""/>

    </div>
    <div class="typeitem">
        <div>
            <a href="/product?method=show&amp;tid=3">
                ——<br>
                &nbsp;绿<br>
                &nbsp;植<br>
                ——<br>
            </a>
        </div>
        <img  src="/image/green-1.png" alt=""/>

    </div>
</div>

<div class="bar"><p style="font-weight: bolder;font-size: 30px;color:#878787;">/&nbsp;新 品 上 市&nbsp;/</p></div>

<div id="item" style="margin-left: 18%;margin-top: 30px">
    <div class="card">
        <a href="/product?method=detail&amp;pid=5"><img class="img-rounded" src="/image/sunflower.png" alt=""/></a>

        <div class="info-font">
            <h3>向日葵<br>
            </h3>
            <p>￥39.90</p>

        </div>
    </div>
    <div class="card">
        <a href="/product?method=detail&amp;pid=7"><img class="img-rounded" src="/image/jugeng.jpg" alt=""/></a>
        <div class="info-font">
            <h3>牡丹<br>
            </h3>
            <p>￥39.90</p>
        </div>
    </div>
    <div class="card">
        <a href="/product?method=detail&amp;pid=9"><img class="img-rounded" src="/image/dried-3.png" alt=""/></a>
        <div class="info-font">
            <h3>干花组合<br>
            </h3>
            <p>￥39.90</p>
        </div>
    </div>
    <div class="card">
        <a href="/product?method=detail&amp;pid=8"><img class="img-rounded" src="/image/denglong.jpg" alt=""/></a>
        <div class="info-font">
            <h3>灯笼花<br></h3>
            <p>￥39.90</p>
        </div>
    </div>

</div>

<!-- 底部 -->
<%@ include file="footer.jsp"%>
</body>
</html>