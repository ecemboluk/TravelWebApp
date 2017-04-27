package com.toyota.project.data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="seyehat")
public class Travels {

    @Id
    @Column(name="kullanici_id")
    private String username;
    @Column(name="amaci")
    private String purpose;
    @Column(name ="baslangic")
    private String  start;
    @Column(name="bitis")
    private String  finish;
    @Column(name="projekodu")
    private String projectCode;
    @Column(name="seyehatyeri")
    private String travelPlace;
    @Column(name="maliyet")
    private int cost;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getFinish() {
        return finish;
    }

    public void setFinish(String finish) {
        this.finish = finish;
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    public String getTravelPlace() {
        return travelPlace;
    }

    public void setTravelPlace(String travelPlace) {
        this.travelPlace = travelPlace;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }
}
