package jmu.xinyihouse.servlet;

import jmu.xinyihouse.db.ConnectionManager;
import jmu.xinyihouse.factory.DAOFactory;
import jmu.xinyihouse.vo.Reservation;

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
import java.util.Date;

@WebServlet("/Reservation")
public class ReservationServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException{

        request.setCharacterEncoding("utf-8");
        String phonenum= request.getParameter("phonenum");
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String information = request.getParameter("information");

//        String information = number + ", " +  HName + ", " + date + ", " + house;
//
//        Reservation reservation = new Reservation();
//        reservation.setInformation(information);

        Reservation reservation = new Reservation();
        reservation.setPhonenum(phonenum);
        reservation.setInformation(information);
        reservation.setName(name);
        reservation.setDate(date);

        boolean flag = DAOFactory.getReservationDAOInstance().insertReservation(reservation);

        request.setAttribute("flag", flag);
        //测试
//        System.out.println(information);//成功
        /*
           对room表进行修改，使得对应房间数量减一
         */
        Connection conn=null;
        PreparedStatement pre = null;
        boolean rs = Boolean.parseBoolean(null);
        try {

            conn = ConnectionManager.getConnection();
            String sql = "update room set quantity=quantity-1 where quantity>0 and "+  "information=  '"+information+"'";
            // pre.setString(1,"123456789");
            pre = conn.prepareStatement(sql);
            // 5 获取结果 处理结果
            rs = pre.execute();
            //rs是获取到的信息，可以将其请求转发到另一个jsp页面再处理
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //6、关闭流资源

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

        String path = "reservation_success.jsp";
        //跳转
        request.getRequestDispatcher(path).forward(request, response);
    }
}
