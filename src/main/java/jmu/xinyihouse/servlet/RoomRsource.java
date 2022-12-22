package jmu.xinyihouse.servlet;


import jmu.xinyihouse.db.ConnectionManager;
import jmu.xinyihouse.vo.Room;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 *    显示所有房源
 *     结构与ReservationResult相似
 * */

@WebServlet("/RoomRsource")
public class RoomRsource extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection conn=null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        try {

            conn = ConnectionManager.getConnection();
            String sql = "select * from room ";
            // pre.setString(1,"123456789");
            pre = conn.prepareStatement(sql);
            // 5 获取结果 处理结果
            rs = pre.executeQuery();
            //rs是获取到的信息，可以将其请求转发到另一个jsp页面再处理
            //自己试着加一下
            List<Room> roomList = new ArrayList<>();
            while(rs.next()){
                /*response.setContentType("text/html;;charset=utf-8");
                PrintWriter out = response.getWriter();*/
                //打印在网页上
                /*out.write(rs.getString("id")+" ");
                out.write(rs.getString("room")+" \n");
                out.write(rs.getString("information")+" ");
                out.write(rs.getString("quantity")+" \n");
                out.write("<br> ");*/
                //自己试着加一下
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setRoom(rs.getString("room"));
                room.setInformation(rs.getString("information"));
                room.setQuantity(rs.getInt("quantity"));
                room.setPrice(rs.getInt("price"));
                roomList.add(room);
                /*System.out.println(roomList);*/
            }
            //自己加的
            request.setAttribute("roomList", roomList);
            request.getRequestDispatcher("list_view.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //6、关闭流资源
            if (rs != null){
                try {
                    rs.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            if (pre != null){
                try {
                    pre.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            if (conn != null){
                try {
                    conn.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }
    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
        doPost(request,response);
    }
}
