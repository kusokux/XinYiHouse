
<%@ page import="java.util.List" %>
<%@ page import="jmu.xinyihouse.vo.Room" %><%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2022/12/21
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>用来测试jsp渲染房源</h1>
<form action="RoomRsource" method="post">
    <input type="submit">查看
</form>

<ul>
    <% Object obj = request.getAttribute("roomList");
        List<Room> roomList = null;
        if (obj instanceof List){
            roomList = (List<Room>) obj;
        }
        if (roomList!=null){
            for (Room room:roomList){
                String roomRoom = room.getRoom();
    %>
    <li><%=roomRoom %></li>
    <%
            }
        }
    %>
</ul>
</body>
</html>
