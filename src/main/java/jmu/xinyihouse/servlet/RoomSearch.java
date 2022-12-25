package jmu.xinyihouse.servlet;

import jmu.xinyihouse.db.ConnectionManager;
import jmu.xinyihouse.vo.Room;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/RoomSearch")
public class RoomSearch extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
//        String room= request.getParameter("add_house_name");
//        String information = request.getParameter("add_house_intro");
//        String price = request.getParameter("add_house_price");
//        String quantity = request.getParameter("add_house_quantity");
        String roomname = request.getParameter("room");
        //测试
        //System.out.println(info);
        Connection conn=null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        ArrayList<Room> list = new ArrayList<>();
        // HttpSession session=request.getSession();
        try {
            //判断是搜索
            int choice = 1;
            conn = ConnectionManager.getConnection();
            String sql = "select * from room where room like  '%"+roomname+"%' ";
            // System.out.println(info);
            // pre.setString(1,"123456789");
            // 5 获取结果 处理结果
            pre = conn.prepareStatement(sql);
            // pre.setString(1,info);
            rs = pre.executeQuery();
            while (rs.next()){
                Room room = new Room();
                room.setId(Integer.parseInt(rs.getString("id")));
                room.setRoom(rs.getString("room"));
                room.setInformation(rs.getString("information"));
                room.setPrice(Integer.parseInt(rs.getString("price")));
                room.setQuantity(Integer.parseInt(rs.getString("quantity")));
                list.add(room);
            }

            //rs是获取到的信息，可以将其请求转发到另一个jsp页面再处理
            request.setAttribute("choice",choice);
            request.setAttribute("list",list);
            request.getRequestDispatcher("roomresult.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
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

