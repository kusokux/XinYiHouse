package jmu.xinyihouse.factory;

import jmu.xinyihouse.dao.IPersonDAO;
import jmu.xinyihouse.dao.IReservationDAO;
import jmu.xinyihouse.dao.impl.PersonDAOImpl;
import jmu.xinyihouse.dao.impl.ReservationDAOImpl;

public class DAOFactory {
    public static IPersonDAO getPersonDAOInstance()
    {
        return new PersonDAOImpl() ;
    }
    public static IReservationDAO getReservationDAOInstance()
    {
        return new ReservationDAOImpl();
    }
}
