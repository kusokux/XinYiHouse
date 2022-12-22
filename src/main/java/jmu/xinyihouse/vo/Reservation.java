package jmu.xinyihouse.vo;

public class Reservation {
    private String id;
    private String phonenum;
    private String name;
    private String date;
    private String information;

    public Reservation(){}
    public String getId(){ return id; }
    public void setId(String id){ this.id = id; }
    public String getPhonenum() {
        return phonenum;
    }
    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getInformation() {
        return information;
    }
    public void setInformation(String information) {
        this.information = information;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "phonenum"+ phonenum + '\''+
                "information='" + information + '\'' +
                "name"+ name + '\''+
                "date"+ date + '\''+
                '}';
    }
}
