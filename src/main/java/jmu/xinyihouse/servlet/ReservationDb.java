package jmu.xinyihouse.servlet;

import jmu.xinyihouse.db.ConnectionManager;
import jmu.xinyihouse.vo.Reservation;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

public class ReservationDb extends HttpServlet {

    public List<Reservation> getReservation (String sql) throws SQLException {
        //查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
        List<Reservation> lst = new ArrayList<Reservation>();
        //获取连接对象
        Connection conn = ConnectionManager.getConnection();
        try {
            //连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
            Statement st = conn.createStatement();
            //执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
            ResultSet rs = st.executeQuery(sql);
            //遍历结果集对象
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(rs.getString("id"));
                reservation.setPhonenum(rs.getString("phonenum"));
                reservation.setInformation(rs.getString("information"));
                reservation.setName(rs.getString("name"));
                reservation.setDate(rs.getString("date"));
                lst.add(reservation);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            //资源使用完之后，如果没有关闭，则需要关闭
            if (conn != null) {
                conn.close();
            }
        }
        return lst;
    }

    public boolean reservationUpdate (String sql) throws SQLException {
        //获取数据库连接对象
        Connection conn = ConnectionManager.getConnection();
        try {
            //连接对象调用createStatement()方法，创建一个执行SQL语句的对象
            Statement st = conn.createStatement();
            //执行SQL语句的对象st，调用executeUpdate()方法执行SQL语句，执行结果为int类型，表示受到影响的记录条数
            //executeUpdate( )方法可以执行增删改DML语句和创建表、删除表等DDL语句
            int cnt = st.executeUpdate(sql);
            return cnt > 0; //如果有记录受到影响，则表示更新操作成功
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            if (conn != null)
                conn.close();
        }
    }



}


