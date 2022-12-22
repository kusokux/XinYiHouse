package jmu.xinyihouse.servlet;

import jmu.xinyihouse.db.ConnectionManager;
import jmu.xinyihouse.vo.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RoomDb extends HttpServlet {

    public List<Room> getRoom (String sql) throws SQLException {
        //查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
        List<Room> lst = new ArrayList<Room>();
        //获取连接对象
        Connection conn = ConnectionManager.getConnection();
        try {
            //连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
            Statement st = conn.createStatement();
            //执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
            ResultSet rs = st.executeQuery(sql);
            //遍历结果集对象
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setRoom(rs.getString("room"));
                room.setInformation(rs.getString("information"));
                room.setPrice(rs.getInt("price"));
                room.setQuantity(rs.getInt("quantity"));
                lst.add(room);
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

    public boolean roomUpdate (String sql) throws SQLException {
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
