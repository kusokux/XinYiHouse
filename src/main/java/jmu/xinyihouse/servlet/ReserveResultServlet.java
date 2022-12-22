package jmu.xinyihouse.servlet;
import jmu.xinyihouse.vo.Reservation;

import jmu.xinyihouse.db.ConnectionManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet("/ReserveResultServlet")
public class ReserveResultServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String phonenum = request.getParameter("phonenum");
        //测试
        //  System.out.println(phonenum);
        Connection conn=null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        ArrayList<Reservation> list = new ArrayList<>();
        // HttpSession session=request.getSession();
        try {

            conn = ConnectionManager.getConnection();
            String sql = "select * from reservation where  "+ "phonenum=  '"+phonenum+"'";
            // pre.setString(1,"123456789");
            pre = conn.prepareStatement(sql);
            // 5 获取结果 处理结果
            rs = pre.executeQuery();
            //rs是获取到的信息，可以将其请求转发到另一个jsp页面再处理
            while (rs.next()){
                Reservation reserve = new Reservation();
                reserve.setId(rs.getString("id"));
                reserve.setPhonenum(rs.getString("phonenum"));
                reserve.setInformation(rs.getString("information"));
                reserve.setName(rs.getString("name"));
                reserve.setDate(rs.getString("date"));
                list.add(reserve);
            }
            // session.setAttribute("rs",rs);
            request.setAttribute("list",list);
            request.getRequestDispatcher("reservation_search.jsp").forward(request,response);
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
}
