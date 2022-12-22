package jmu.xinyihouse.servlet;

import jmu.xinyihouse.db.ConnectionManager;
import jmu.xinyihouse.vo.Reservation;
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

@WebServlet("/rootRoomplus")
public class RootRoomplus extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String room= request.getParameter("add_house_name");
        String information = request.getParameter("add_house_intro");
        String price = request.getParameter("add_house_price");
        String quantity = request.getParameter("add_house_quantity");
        //测试
        /*room ="aab";
        information = "jzjzjzjjzjz";
        price = "15";
        quantity = "12";*/
        Connection conn=null;
        PreparedStatement pre = null;
        boolean rs = Boolean.parseBoolean(null);
        // HttpSession session=request.getSession();
        try {

            conn = ConnectionManager.getConnection();
            String sql = "insert into " + "room(room, information, price, quantity)" +" values(?,?,?,?) ";
            // pre.setString(1,"123456789");
            pre = conn.prepareStatement(sql);
            pre.setString(1, room);
            pre.setString(2, information);
            pre.setString(3,price);
            pre.setString(4,quantity);
            // 5 获取结果 处理结果
            rs = pre.execute();
            //rs是获取到的信息，可以将其请求转发到另一个jsp页面再处理

            request.setAttribute("rs",rs);
            request.getRequestDispatcher("ad_nav.jsp").forward(request,response);
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

