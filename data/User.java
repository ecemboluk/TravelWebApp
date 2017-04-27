package com.toyota.project.data;

import javax.persistence.*;

@Entity
@Table(name="kullanici")
public class User {
	@Id
	@Column(name="kullaniciadi")
	private String username;
	@Column(name="adi")
	private String name;
	@Column(name="soyadi")
	private String surname;
	@Column(name="sifre")
	private String pass;
	@Column(name="sicilnumarasi")
	private String scNumber;
	@Column(name="bolum")
	private String departmen;
	@Column(name="mudur")
	private String departmenManager;
	@Column(name="rol")
	private String role;
	@Column(name="bilgilendirmeservisi")
    private String informationservice;
	@Column(name="seyehatsistemi")
    private String travelsystem;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getScNumber() {
		return scNumber;
	}

	public void setScNumber(String scNumber) {
		this.scNumber = scNumber;
	}

	public String getDepartmen() {
		return departmen;
	}

	public void setDepartmen(String departmen) {
		this.departmen = departmen;
	}

	public String getDepartmenManager() {
		return departmenManager;
	}

	public void setDepartmenManager(String departmenManager) {
		this.departmenManager = departmenManager;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

    public String getInformationservice() {
        return informationservice;
    }

    public void setInformationservice(String informationservice) {
        this.informationservice = informationservice;
    }

    public String getTravelsystem() {
        return travelsystem;
    }

    public void setTravelsystem(String travelsystem) {
        this.travelsystem = travelsystem;
    }
}
