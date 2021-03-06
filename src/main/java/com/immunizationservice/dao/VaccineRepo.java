package com.immunizationservice.dao;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.immunizationservice.model.VaccineDB; 

public interface VaccineRepo extends JpaRepository<VaccineDB, Integer>{ 
	
	@Query(value = "SELECT * FROM vaccineDB u WHERE u.document= ?#{[0]}", nativeQuery = true)
	ArrayList<VaccineDB> findAllUsersbyid(int document);

   
}
