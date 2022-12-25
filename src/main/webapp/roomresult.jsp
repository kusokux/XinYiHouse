<%@ page import="java.util.ArrayList" %>
<%@ page import="jmu.xinyihouse.vo.Room" %><%--
  Created by IntelliJ IDEA.
  User: late
  Date: 2022/12/23
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索结果</title>
    <div class="" >
        <table class="roomResult-table"  style="border:1px black solid">

            <tr>
                <td>房间号</td>
                <td>名称</td>
                <td>信息</td>
                <td>价格</td>
                <td>数量</td>
            </tr>
            <%//房源
                ArrayList list = (ArrayList) request.getAttribute("list");


                if(list!=null) {
                    for (int i = 0; i < list.size(); i++) {
                        Room room = (Room) list.get(i);
                        out.println("<tr><td>" + room.getId() + "</td><td>" + room.getRoom() + "</td><td>" +
                                room.getInformation() + "</td><td>" + room.getPrice() + "</td><td>" + room.getQuantity()+"</td><td>");
                    }
                }
            %>


        </table>
    </div>
</head>
<body>

</body>
</html>
