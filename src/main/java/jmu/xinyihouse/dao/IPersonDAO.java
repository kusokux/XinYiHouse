package jmu.xinyihouse.dao;
import jmu.xinyihouse.vo.Person;

import java.util.List;

public interface IPersonDAO {
    public boolean login(Person person) throws Exception ;
    public List<Person> getAllPerson() throws Exception;
    public boolean register(Person person) throws Exception;
}
