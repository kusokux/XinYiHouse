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

@WebServlet("/ReservationDelete")
public class ReservationDeleteServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        // ArrayList list = (ArrayList) request.getSession().getAttribute("list");
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("reserve");
        //String information =
        // System.out.println("id="+Integer.parseInt(id));//测试
        int id2 = Integer.parseInt(id);//resercation表的id
        ResultSet resultSet = null;
        boolean result = Boolean.parseBoolean(null);
        String information = null;
        Connection conn=null;//删除操作
        Connection conn2=null;//找到id对应的information
        Connection conn3=null;//使对应information的房源+1
        PreparedStatement pre = null;
        PreparedStatement pre2 = null;
        PreparedStatement pre3 = null;
        boolean rs = Boolean.parseBoolean(null);
        //获取对应的information
        try{
            conn2 = ConnectionManager.getConnection();
            String sql2 = "select information from reservation where id='"+id2+"'";
            pre2=conn2.prepareStatement(sql2);
            resultSet=pre2.executeQuery();
            Reservation reser = new Reservation();
            while (resultSet.next()){
                reser.setInformation(resultSet.getString("information"));
            }
            information=reser.getInformation();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        // System.out.println("information="+information);//测试用
        //根据information找出room表内对应房源，使其+1
        try{
            conn3 = ConnectionManager.getConnection();
            String sql3 = "update room set quantity=quantity+1 where quantity<6 and "+  "information=  '"+information+"'";
            pre3=conn3.prepareStatement(sql3);
            result=pre3.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        try {

            conn = ConnectionManager.getConnection();
            String sql = "delete from reservation where id='"+id+"'";
            //   String sql2 = "update room set quantity=quantity+1 where quantity>0 and "+  "information=  '"+information+"'";
            // pre.setString(1,"123456789");
            pre = conn.prepareStatement(sql);
            //pre2 = conn.prepareStatement(sql2);
            // 5 获取结果 处理结果
            rs = pre.execute();
            //   rs = pre2.execute();
            //rs是获取到的信息，可以将其请求转发到另一个jsp页面再处理
            request.setAttribute("rs",rs);
            request.getRequestDispatcher("reservation_search.jsp").forward(request,response);
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

