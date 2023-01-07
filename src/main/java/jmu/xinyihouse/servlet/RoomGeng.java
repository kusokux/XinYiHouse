package jmu.xinyihouse.servlet;

import jmu.xinyihouse.db.ConnectionManager;
import jmu.xinyihouse.vo.Reservation;

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

@WebServlet("/roomGeng")
public class RoomGeng extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String house_id = request.getParameter("house_id");
        String house_name = request.getParameter("house_name");
        String house_intro = request.getParameter("house_intro");
        String house_price = request.getParameter("house_price");
        String house_quantity = request.getParameter("house_quantity");
        Connection conn=null;
        PreparedStatement pre = null;
        boolean rs = Boolean.parseBoolean(null);
        ArrayList<Reservation> list = new ArrayList<>();
        try {
            conn = ConnectionManager.getConnection();
            String sql = "update room set id='"+house_id+"',room='"+house_name+"',information='"+house_intro+"',price='"+house_price+"',quantity='"+house_quantity+"'  where id='"+house_id+"'";
            pre = conn.prepareStatement(sql);
            rs = pre.execute();
            request.setAttribute("rs",rs);
            request.getRequestDispatcher("ad_nav.jsp").forward(request,response);
        } catch (SQLException e) {
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