package com.immunizationservice.controller;

import java.sql.Date;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.immunizationservice.dao.PatientRepo;
import com.immunizationservice.dao.VaccineRepo;
import com.immunizationservice.exception.DuplicateException;
import com.immunizationservice.model.PatientsDB;
import com.immunizationservice.model.VaccineDB;


@Controller
public class ImmunizationServiceController {
	@Autowired
	PatientRepo patientRepo;

	@Autowired
	VaccineRepo vaccineRepo;

	private int searchId;
	private static final String TITLE = "Immunization Service";
	private static final String DASHBOARD = "Dashboard";
	private static final String PATIENTS = "Patients";
	private static final String TITLEOBJ = "title";

	
	@RequestMapping("/home")
	public ModelAndView dashboard() {
		ModelAndView mv = new ModelAndView();
		List<PatientsDB> patientlist = patientRepo.findAll();
		mv.addObject(TITLEOBJ, TITLE);
		mv.addObject(DASHBOARD, DASHBOARD);
		mv.addObject(PATIENTS, PATIENTS);
		mv.addObject("data", patientlist);
		mv.addObject("k", 3);

		mv.setViewName("home");
		return mv;
	}

	@RequestMapping("/patients")
	public ModelAndView showPatients() { 
		ModelAndView mv = new ModelAndView();
		List<PatientsDB> list = patientRepo.findAll();
		mv.addObject(TITLEOBJ, TITLE);
		mv.addObject(DASHBOARD, DASHBOARD);
		mv.addObject(DASHBOARD, PATIENTS);
		mv.addObject("details", list);
		mv.addObject("toppatients", patientRepo.findAll());
		mv.addObject("topvaccines", vaccineRepo.findAll());
		mv.setViewName("patients");
		return mv;
	}

	@RequestMapping("/getpatient")
	public ModelAndView patientPage(@RequestParam("documentSearch") int document) {
		ModelAndView mv = new ModelAndView();
		searchId = document;
		mv.addObject(TITLEOBJ, TITLE);
		mv.addObject(DASHBOARD, DASHBOARD);
		mv.addObject(PATIENTS, PATIENTS);
		PatientsDB patient = patientRepo.findById(document).orElse(new PatientsDB());
		mv.addObject("document", patient.getDocument());
		mv.addObject("patient", patient);
		mv.addObject("topvaccines", vaccineRepo.findAllUsersbyid(document));
		mv.setViewName("getpatient");

		// DISPLAY AGE FROM DATE 

		Date d = patientRepo.datefindDateForUser(document);
		LocalDate now = LocalDate.now();
		int year = d.getYear();
		int month = d.getMonth();
		int day = d.getDay();

		LocalDate oldDate = LocalDate.of(year + 1900, month, day);
		Period diff = Period.between(oldDate, now);
		mv.addObject("patientAge", diff.getYears());

		return mv;

	}

	@RequestMapping("/addpatient")
	public ModelAndView addPatient() {

		ModelAndView mv2 = new ModelAndView();
		mv2.addObject(TITLEOBJ, TITLE);
		mv2.addObject(DASHBOARD, DASHBOARD);
		mv2.addObject(PATIENTS, PATIENTS);
		mv2.setViewName("addpatient");

		return mv2;
	}
 
	@RequestMapping("/addpatients")
	public ModelAndView savePatient(PatientsDB patient) {
		ModelAndView mv1 = new ModelAndView("patients");
		List<PatientsDB> patientList = patientRepo.findAll();
		for (PatientsDB p : patientList) {
			if (p.getDocument() == patient.getDocument()) {
				throw new DuplicateException("Patient", "document", patient.getDocument());
			}
		}
		patientRepo.save(patient);
		mv1.setViewName("addpatient");
		mv1.addObject(DASHBOARD, DASHBOARD);
		mv1.addObject(PATIENTS, PATIENTS);

		return mv1;
	}

	@RequestMapping("patient/addapplications") 
	public ModelAndView vaccine(VaccineDB vaccineDB) {
		ModelAndView mv = new ModelAndView();

		vaccineRepo.save(vaccineDB);
		updatePatient(vaccineDB.getVaccine(), vaccineDB.getDocument());
		mv.setViewName("vaccine");
		return mv;
	}

	@RequestMapping("/vaccine")
	public ModelAndView updateVaccine()  {
//		throws ParseException
		ModelAndView mv = new ModelAndView();

		mv.addObject(TITLEOBJ, TITLE);
		mv.addObject(DASHBOARD, DASHBOARD);
		mv.addObject(DASHBOARD, PATIENTS);
		mv.addObject("searchId", searchId);
		mv.setViewName("vaccine");

		return mv;
	}

	public void updatePatient(String vaccine, int doc) {
		PatientsDB patient = patientRepo.findById(doc).orElse(new PatientsDB());
		patient.setVaccine(vaccine);
		patientRepo.save(patient);
	}

}
