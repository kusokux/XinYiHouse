package jmu.xinyihouse.vo;

public class Room {
    private int id;
    private String room;
    private String information;
    private int quantity;
    private int price;
    public int getId(){return id;}
    public void setId(int id){
        this.id = id;
    }
    public String getRoom(){
        return room;
    }
    public void setRoom(String room){
        this.room = room;
    }
    public String getInformation(){
        return information;
    }
    public void setInformation(String information){
        this.information = information;
    }
    public int getQuantity(){
        return quantity;
    }
    public void setQuantity(int quantity){
        this.quantity = quantity;
    }
    public int getPrice(){
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    @Override
    public String toString() {
        return "Room{" +
                "id='" + id + '\'' +
                ", room='" + room + '\'' +
                ", information='" + information + '\'' +
                ", quantity='" + quantity + '\'' +
                '}';
    }

}
