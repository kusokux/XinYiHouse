package jmu.xinyihouse.dao.impl;

import jmu.xinyihouse.dao.IReservationDAO;
import jmu.xinyihouse.db.ConnectionManager;
import jmu.xinyihouse.vo.Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ReservationDAOImpl implements IReservationDAO {
    @Override
    public boolean insertReservation(Reservation reservation) {
        String sql = "insert into " + "reservation(phonenum, information, name, date)" +" values(?,?,?,?) ";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reservation.getPhonenum());
            pstmt.setString(2, reservation.getInformation());
            pstmt.setString(3, reservation.getName());
            pstmt.setString(4, reservation.getDate());
            int count = pstmt.executeUpdate();
            if (count > 0) {
                return true;
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
