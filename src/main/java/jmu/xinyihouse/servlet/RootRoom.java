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

@WebServlet("/rootRoom")
public class RootRoom extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String roomid = request.getParameter("room");
        //测试
        // System.out.println(roomid);

        Connection conn=null;
        PreparedStatement pre = null;
        boolean rs = Boolean.parseBoolean(null);
        ArrayList<Reservation> list = new ArrayList<>();
        // HttpSession session=request.getSession();
        try {

            conn = ConnectionManager.getConnection();
            String sql =  "delete from room where id='"+roomid+"'";
            pre = conn.prepareStatement(sql);
            // 5 获取结果 处理结果
            rs = pre.execute();
            //rs是获取到的信息，可以将其请求转发到另一个jsp页面再处理
            // session.setAttribute("rs",rs);
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


