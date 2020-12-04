package com.example.immunizationService.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table; 
  
@Entity 
@Table(name = "vaccinedb")
public class VaccineDB { 

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sno")
    private int sno;
    
    @Column(name = "age")
    private int age;
    
    
	@Column(name = "document")
    private int document; 
    
    @Column(name = "vaccine")
    private String vaccine;

    public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	} 
	public int getDocument() { 
        return document; 
    } 
    public void setDocument(int document) { 
        this.document = document; 
    } 
    public String getVaccine() { 
        return vaccine; 
    } 
    public void setVaccine(String vaccine) { 
        this.vaccine = vaccine; 
    }
    public int getAge() {
		return age;
	}
    public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return " document=" + document + ", vaccine=" + vaccine  ;
	} 

    
} 
