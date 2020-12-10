package com.immunizationservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table; 
  
@Entity 
@Table(name = "patientdb")
public class PatientsDB { 
     
    @Id 
    @Column(name = "document")
    private int document; 
    @Column(name = "name")
    private String name; 
    @Column(name = "birth")
    private String birth; 
    @Column(name = "vaccine")
    private String vaccine; 
     
    public int getDocument() { 
        return document;
    } 
    public void setDocument(int document) { 
        this.document = document; 
    } 
    public String getName() { 
        return name; 
    } 
    public void setName(String name) { 
        this.name = name; 
    } 
    public String getBirth() { 
        return birth; 
    } 
    public void setBirth(String birth) { 
        this.birth = birth; 
    } 
    public String getVaccine() { 
        return vaccine; 
    } 
    public void setVaccine(String vaccine) { 
        this.vaccine = vaccine; 
    } 
    @Override 
    public String toString() { 
        return "Patients [document=" + document + ", name=" + name + ", birth=" + birth + ", vaccine=" + vaccine + "]"; 
    } 
} 
