<%--
  Created by IntelliJ IDEA.
  User: zzh
  Date: 2022/12/19
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jmu.xinyihouse.servlet.PersonDb" %>
<%@ page import="java.util.List" %>
<%@ page import="jmu.xinyihouse.vo.Person" %>
<%@ page import="jmu.xinyihouse.vo.Room" %>
<%@ page import="jmu.xinyihouse.vo.Reservation" %>
<%@ page import="jmu.xinyihouse.servlet.ReservationDb" %>
<%@ page import="jmu.xinyihouse.servlet.RoomDb" %>
<%@ page import="jmu.xinyihouse.servlet.PersonDb" %>
<%@ page import="jmu.xinyihouse.servlet.ReservationDb" %>
<%@ page import="jmu.xinyihouse.servlet.RoomDb" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <link rel="stylesheet" href="css/ad_nav.css">
    <%--    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script><!--引入vue-->--%>
    <link rel="stylesheet" href="css/Room_manager.css">
    <!-- Import style -->
    <link rel="stylesheet" href="//unpkg.com/element-plus/dist/index.css" />
    <!-- Import Vue 3 -->
    <script src="//unpkg.com/vue@3"></script>
    <!-- Import component library -->
    <script src="//unpkg.com/element-plus"></script>
</head>
<body>
<%-- 管理员系统导航栏模块 --%>
<%--头部模块--%>
<div class="top-bar">
    管理员系统
</div>
<%-- 侧边栏 --%>
<div class="aside-bar" id="app">
    <ul>
        <li v-for="(site, index) in sites">
            <a  @click="change(index)" :href="site.path" :class="currentIndex==index?'active':''"> {{site.text}}</a>
        </li>
    </ul>
    <div class="roomManager-body">
        <form action="rootRoomsearch" class="roomManager-form" v-show="currentIndex>=1">
            <input type="text" name="inf">
            <input type="submit" value="搜索" >
        </form>
        <iframe style="display: none"></iframe>
        <div class="add-room" v-show="currentIndex==1">
            <el-button type="warning" round @click="add_Visible = true" >添加房源</el-button>
        </div>


        <div class="" v-show="currentIndex==1">
            <table class="roomManager-table">

                <tr>
                    <td>房间号</td>
                    <td>名称</td>
                    <td>信息</td>
                    <td>价格</td>
                    <td>数量</td>
                    <td>操作</td>
                </tr>
                <%//房源
                    ArrayList list = (ArrayList) request.getAttribute("list");
                    RoomDb rdb = new RoomDb();
                    String sql = "select * from room";
                    List<Room> lst = rdb.getRoom(sql);
                    if (list == null) {
                        for (Room room : lst) {
                            out.println("<tr><td>" + room.getId() + "</td><td>" + room.getRoom() + "</td><td>" + room.getInformation() + "</td><td>" + room.getPrice() + "</td><td>" + room.getQuantity() + "</td> <td> <el-button type='primary' class='e-button' round @click='edit' onclick='delete_room(" + room.getId() + ")'>编辑</el-button> </td> </tr>");
                        }
                    }
                    else {
                        if(list!=null) {
                            for (int i = 0; i < list.size(); i++) {
                                Room room = (Room) list.get(i);
                                out.println("<tr><td>" + room.getId() + "</td><td>" + room.getRoom() + "</td><td>" + room.getInformation() + "</td><td>" + room.getPrice() + "</td><td>" + room.getQuantity() + "</td> <td> <el-button type='primary' class='e-button' round @click='edit' onclick='delete_room(" + room.getId() + ")'>编辑</el-button> </td> </tr>");
                            }
                        }
                    }
                %>


            </table>
        </div>

        <div v-show="currentIndex==2">
            <table class="roomManager-table">
                <tr>
                    <td>id</td>
                    <td>phonenum</td>
                    <td>information</td>
                    <td>name</td>
                    <td>data</td>
                    <td>option</td>
                </tr>

                <%//订单
                    ReservationDb rdbb = new ReservationDb();
                    String sqlb = "select * from reservation";
                    List<Reservation> lstb = rdbb.getReservation(sqlb);
                    for (Reservation reservation : lstb) {
                        out.println("<tr><td>" +reservation.getId()+"</td><td>"+ reservation.getPhonenum() + "</td><td>" + reservation.getInformation() + "</td><td>" + reservation.getName() + "</td><td>"+ reservation.getDate() + "</td>  <td> <el-button type='success' class='e-button' round @click='Approval_Visible = true' onclick='delete_reservation("+reservation.getId()+")'>审核</el-button> </td>  </tr>");
                    }
                %>
            </table>
        </div>

        <div v-show="currentIndex==3" >
            <table class="roomManager-table" border="1">
                <tr>
                    <td>id</td>
                    <td>name</td>
                    <td>password</td>
                    <td>option</td>
                </tr>

                <%//用户
                    PersonDb rdba = new PersonDb();
                    String sqla = "select * from person";
                    List<Person> lsta = rdba.getPerson(sqla);
                    for (Person person : lsta) {
                        out.println("<tr><td>" + person.getId() + "</td><td>" + person.getName() + "</td><td>" + person.getPassword() + "</td> <td> <el-button type='danger' round @click='delete_Visible = true' onclick='delete_user("+person.getId()+")'>删除</el-button> </td> </tr>");

                    }
                %>
            </table>
        </div>
    </div>
    <%-- 添加房源弹窗--%>
    <el-dialog v-model="add_Visible" title="添加房源" width="60%" center>
        <div>
            <form style="text-align: center" name="house_add" action="rootRoomplus" method="post">
                <label>房源名字:</label> <input name="add_house_name" placeholder="请输入房源名字">
                <br>
                <br>
                <label>房源介绍:</label> <input name="add_house_intro" placeholder="请输入简要介绍">
                <br>
                <br>
                <label>房源价格:</label> <input name="add_house_price" placeholder="请输入房源价格">
                <br>
                <br>
                <label>房间数量:</label> <input name="add_house_quantity" placeholder="请输入房间数量">
                <br>
                <br>
                <input type="submit" value="添加" class="handin">
            </form>
        </div>
    </el-dialog>
    <el-dialog v-model="delete_Visible" title="删除用户" width="60%" center>
        <div>
            <form style="text-align: center" name="house_add" action="rootPerson" method="post">
                确认要删除以下用户?
                <br>
                <br>
                <input placeholder="" id="uname" name="personid" value="">
                <br>
                <br>
                <input type="submit" value="删除" class="handin">
            </form>

        </div>
    </el-dialog>
    <%--  编辑房源弹窗 --%>
    <el-dialog v-model="centerDialogVisible" title="编辑房源信息" width="60%" center>
        <form style="text-align: center" name="house_edit" action="rootRoom" method="post">
            <label>房源编号:</label>
            <input placeholder="1" id="hid" name="house_id" disabled>
            <br>
            <br>
            <label>房源名字:</label>
            <input id="hname" name="house_name" placeholder="1好房子">
            <br>
            <br>
            <label>房源介绍:</label>
            <input id="hintro" name="house_intro" placeholder="简单介绍">
            <br>
            <br>
            <label>房源状态:</label>
            <input id="hstate" name="house_state" placeholder="空闲">
            <br>
            <br>
            <input type="submit" value="完成编辑" class="handin">
            <button name="room" type="submit" id="uroom" class="handin" style="margin-left: 20px">删除该项</button>
        </form>
    </el-dialog>

    <el-dialog v-model="Approval_Visible" title="预约审核" width="60%" center>
        <div>
            <form style="text-align: center" name="house_add" action="rootReservationDelete" method="post">
                <input type="radio" name="reserve">允许
                <br>
                <br>
                <input id="ureservation" type="radio" name="reserve">拒绝
                <br>
                <br>
                <input type="submit" value="审批" class="handin">
            </form>
        </div>
    </el-dialog>
</div>


<script src="js/ad_nav.js"></script>
</body>
</html>
