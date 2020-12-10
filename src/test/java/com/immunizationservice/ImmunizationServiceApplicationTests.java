package com.immunizationservice;

import org.junit.jupiter.api.Test;
import org.junit.Assert;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;

import com.immunizationservice.model.PatientsDB;
import com.immunizationservice.model.VaccineDB;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ImmunizationServiceApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class ImmunizationServiceApplicationTests {

	@Autowired
	private TestRestTemplate restTemplate;
	@LocalServerPort
	private int port;

	private String getRootUrl() {
		return "http://localhost:" + port;
	}
	
	

	@Test
	 void testfindAll() {
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<String>(null, headers);
		ResponseEntity<String> response = restTemplate.exchange(getRootUrl() + "/stock-items/", HttpMethod.GET, entity,
				String.class);
		Assert.assertNotNull(response.getBody());
	}

	@Test
	 void testfindById() {
		PatientsDB patient = restTemplate.getForObject(getRootUrl() + "/getPatient/1", PatientsDB.class);
		Assert.assertNotNull(patient);
	}
	
	@Test
	 void testCreatePatient() {
		PatientsDB patient = new PatientsDB();
		patient.setDocument(1234);
		patient.setName("aaa");
		patient.setBirth("12/12/2018");
		ResponseEntity<PatientsDB> postResponse = restTemplate.postForEntity(getRootUrl() + "/addPatient", patient, PatientsDB.class);
		Assert.assertNotNull(postResponse);
		Assert.assertNotNull(postResponse.getBody());
	}

	@Test
	 void testaddVAccine() {
		int id = 1;
		restTemplate.put(getRootUrl() + "/patients/addApplication/" + id, new Double(100));
		VaccineDB vaccine = new VaccineDB();
		vaccine.setVaccine("BCG");
		ResponseEntity<PatientsDB> postResponse = restTemplate.postForEntity(getRootUrl() + "/addPatient", vaccine, PatientsDB.class);
		Assert.assertNotNull(postResponse);
		Assert.assertNotNull(postResponse.getBody());
	}
	
}
