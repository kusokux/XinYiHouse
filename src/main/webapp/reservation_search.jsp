<%@ page import="java.util.ArrayList" %>
<%@ page import="jmu.xinyihouse.vo.Reservation" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

    <title>查询</title>
    <link rel="stylesheet" href="css/button.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/reservation_search.css">
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
            </ul>
        </nav>

    </div>
</header>
<!-- #显示查询文字模块-->
<div class="cx">
<div class="w-txt">
    <h3>查询预订</h3>
</div>
<!-- #查询框模块-->
<div class="wrapper">

    <form action="ReserveResultServlet" method="post">
        <div class="input-data">
            <input type="text" placeholder="请输入手机号" name="phonenum" required>
        </div>
        <div class="input-data2">
            <input type="submit" class="button gray" value="查询">
        </div>

    </form>
</div>
<%
    ArrayList list = (ArrayList) request.getAttribute("list");
%>
<form class="bd" action="ReservationDelete" method="post" onsubmit="return Delete()">
    <div class="result_tb">
            <table>
                <tr>
                    <td id="title">编号</td>
                    <td phonenum="title">电话号码</td>
                    <td indormation="title">信息</td>
                    <td name="title">预定人</td>
                    <td date="title">预定时间</td>
                    <td date="title">取消预定</td>
                </tr>
                    <%
                    if(list!=null)
                        for(int i = 0;i<list.size();i++){
                            Reservation reserve =(Reservation) list.get(i);
                %>
                <tr>
                    <td><%=reserve.getId() %></td>
                    <td><%=reserve.getPhonenum() %></td>
                    <td><%=reserve.getInformation() %></td>
                    <td><%=reserve.getName() %></td>
                    <td><%=reserve.getDate() %></td>
                    <td>
                        <button type="submit" class="button red" name="reserve" value="<%=reserve.getId()%>">取消</button>

                    </td>

                </tr>

                    <%
                    }
                %>

    </div>
</form>
</div>
<script>
 function Delete() {
     var issure = confirm("确定要删除？");
     if (issure==true){
         return true;
     }else{
         return false;
     }
 }
</script>
</body>
</html>
