package jmu.xinyihouse.dao.impl;

import jmu.xinyihouse.dao.IPersonDAO;
import jmu.xinyihouse.db.ConnectionManager;
import jmu.xinyihouse.factory.DAOFactory;
import jmu.xinyihouse.vo.Person;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonDAOImpl implements IPersonDAO {
    @Override
        public boolean login(Person person) throws Exception {
            boolean flag = false;
            Connection conn=null;
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            String sql = "SELECT name FROM person WHERE id=? and password=?";
            try {
                conn = ConnectionManager.getConnection();
                pstmt=conn.prepareStatement(sql);
                pstmt.setString(1, person.getId());
                pstmt.setString(2, person.getPassword());
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    flag = true;
                    person.setName(rs.getString(1));
                }

            } catch (Exception e) {
                throw new Exception("操作出现错误！！！");
            } finally {
                ConnectionManager.closeResultSet(rs);
                ConnectionManager.closeStatement(pstmt);
                ConnectionManager.closeConnection(conn);
            }
            return flag;
        }

    @Override
    public List<Person> getAllPerson() throws Exception {
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        List<Person> personList = new ArrayList<>();
        String sql = "SELECT * from person";

        try{
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            Person person = null;
            while(rs.next()){
                person = new Person();
                person.setId(rs.getString(1));
                person.setName(rs.getString(2));
                person.setPassword((rs.getString(3)));
                personList.add(person);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(conn);
        }

        return personList;
    }

    @Override
    public boolean register(Person person) throws Exception {
        List<Person> personList = DAOFactory.getPersonDAOInstance().getAllPerson();
        for(Person i : personList){
            if(person.getId().equals(i.getId()))
                return false;
        }

        String sql = "insert into person values(?,?,?) ";
        Connection conn=null;
        PreparedStatement pstmt=null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, person.getId());
            pstmt.setString(2, person.getName());
            pstmt.setString(3, person.getPassword());
            int count = pstmt.executeUpdate();
            if(count > 0){
                return true;
            }else{
                System.out.println("count = " + count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.closeStatement(pstmt);
            ConnectionManager.closeConnection(conn);
        }

        return false;
    }

}
