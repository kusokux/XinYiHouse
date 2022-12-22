<%@ page import="jmu.xinyihouse.vo.Room" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

    <title>可预订的房间</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/pager.css">
    <link rel="stylesheet" href="css/PopupWindow.css">
    <link rel="stylesheet" href="css/search.css">
    <script type="text/javascript" src="js/pager.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">

</head>
<body>
<!-- 头部模块-->
<header>
    <!-- 快捷菜单模块-->
    <div class="xtx-shortcut">
        <div class="container">
            <ul class="fr">
                <%
                    if(request.getSession().getAttribute("uname") == null){
                %>
                <li><a href="login.jsp">请先登录</a>|</li>
                <li><a href="register.jsp">抢先注册</a>|</li>
                <%
                }else{
                %>
                <li><a href="Login?status=cancellation">注销</a></li>
                <li><i class="	fa fa-user-circle-o"></i></li>
                <li><a><%=request.getSession().getAttribute("uname")%></a></li>
                <%
                    }
                %>

                <li><a href="img.html" target="_blank">赞助合作</a></li>
            </ul>
        </div>
    </div>

    <!-- #主导航模块-->
    <div class="xtx-main-nav container">
        <!-- #logo -->
        <h1 class="logo fl">
            <a href="#">心怡民宿</a>
        </h1>
        <nav class="fl" id="app">
            <ul>
                <li><a href="index.jsp">首页</a></li>
                <li><a href="reservation.jsp">预定房间</a></li>
                <li><a href="reservation_search.jsp">查看预定</a></li>
                <li><a href="RoomRsource">查看房源</a></li>
            </ul>
        </nav>
        <!-- #search -->
        <div class="search bar2">
            <form>
                <input type="text" placeholder="请输入您要搜索的内容...">
                <button type="submit"></button>
            </form>
        </div>
    </div>
</header>

<!--从这里开始写-->
<div class="xtx-new-goods container">
    <!-- #好物模块头部 -->
    <div class="goods-hd">
        <!-- #左边h2 -->
        <h2 class="fl">
            值得拥有 <span>顶级房源 品质靠谱</span>
        </h2>
        <!-- #右边的a -->
        <a href="#" class="fr"></a>
    </div>
    <%--<div class="goods-list2">--%>
        <ul>
<%--动态渲染数据库中的房源--%>
    <% Object obj = request.getAttribute("roomList");
        List<Room> roomList = null;
        int i = 0;
        if (obj instanceof List){
            roomList = (List<Room>) obj;
        }
        if (roomList!=null){
            for (Room room:roomList){
                if (i==0){%>
    <div class="goods-list2">
        <%}
                i++;
                String roomRoom = room.getRoom();
                int roomId = room.getId();
    %>


    <li onclick="">
        <a class="open-dialog-button" id="<%=roomId%>" onclick="Showinformation(<%=roomId%>)">
            <img src="img/<%=i+1%>.jpg" alt="">
            <h3><%=roomRoom %></h3>
            <p><span>￥</span> 3399</p>

        </a>
    </li>


    <%
                if (i==4){
                    i=0;
                    %>
        </div>
    <%
                }
            }
        }
        assert roomList != null;%>
        </ul>

</div>
<%--分页器--%>
<div id="pagination" style="margin: 50px 0">
    <a>&#9668;</a>
    <span>
            <a class="current">1</a>
            <a>2</a>
            <a>3</a>
            <a>4</a>
            <a>5</a>
            <a>6</a>
            <a>7</a>
            <a>8</a>
            <a>9</a>
            <i>...</i>
            <a>30</a>
        </span>
    <a>&#9658;</a>
</div>


<!-- 弹窗部分 -->
<div class="dialog" style="display:none">

    <!-- 不透明遮罩 -->
    <div class="dialog-modal"></div>

    <!-- 主体 -->
    <div class="dialog-main">

        <div class="dialog-head">
            <button class="dialog-close-button icon-botton">x</button>
        </div>

        <!-- 内容区 -->
        <div class="dialog-body">
            <div >
                <h1 id="info_title">1111111111111</h1>
                <hr>
            </div>
            <div class="r-context">
                <a>详细信息</a>
                <p id="info_content">位于汕头市汕头大学西区，环境优美，鸟语花香</p>
            </div>

            <img id="info_img" src="img/3.jpg" alt="">
            <div> <a id="info_price">￥9999</a></div>
            <div><a id="info_quantity" style="color: red"></a></div>
            <div><button class="dialog-close-button text-button">关闭</button></div>
        </div>
    </div>

</div>


<script src="js/PopupWindow.js"></script>
<script>
var list = new Array();
var single = [
    {
        id:0
    },
    {
        room:"房间名"
    },
    {
        information:"信息"
    },
    {
        quantity:5
    },
    {
        price:500
    }
    ]
    function Showinformation(clicked_id){
        boostrap();

        <%Object ob = request.getAttribute("roomList");
        List<Room> rb = null;
        int j = 0;
        if (ob instanceof List){
            rb = (List<Room>) ob;
        }
        if (rb!=null){
            for (Room rooM:rb){
        %>
        console.log("<%=rooM.getId()%>\n<%=rooM.getRoom()%>\n<%=rooM.getInformation()%>\n<%=rooM.getPrice()%>\n<%=rooM.getQuantity()%>")
        list[<%=j%>]= {
            id:<%=rooM.getId()%>
            ,
            room: "<%=rooM.getRoom()%>"
            ,
            information: "<%=rooM.getInformation()%>"
            ,
            quantity:<%=rooM.getQuantity()%>
            ,
            price:<%=rooM.getPrice()%>
        }
        <%

            j++;}}assert rb != null;
        %>
        var title = document.querySelector('#info_title');
        var content = document.querySelector('#info_content');
        var price = document.querySelector('#info_price');
        var quantity = document.querySelector('#info_quantity');
        var img = document.querySelector('info_img')
        title.innerHTML=list[clicked_id-1].room;
        content.innerHTML=list[clicked_id-1].information;
        price.innerHTML="￥"+list[clicked_id-1].price;
        quantity.innerHTML="剩余房间数："+list[clicked_id-1].quantity;
        var num = clicked_id%5;
        img.src="img/"+num+".jpg";
    }


</script>
</body>
</html>
