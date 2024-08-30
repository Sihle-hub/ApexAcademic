package com.example.demo.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Booking;
import com.example.demo.model.Tutor;
import com.example.demo.repository.TutorRepository;
import com.example.demo.service.BookingService;
import com.example.demo.service.TutorService;

@Controller
public class PageController {
	
	 @Autowired
    private TutorService tutorService;
	 
	 @Autowired
	 private BookingService bookingService;
	 
	 @Autowired
	 private TutorRepository tutorRepo;

	@GetMapping("/")
	public ModelAndView bookTutorPage() {
	    // Retrieve the list of tutors
	    List<Tutor> tutors = tutorService.listAll();
	    
	    // Sort the list in descending order based on hoursTutored
	    Collections.sort(tutors, new Comparator<Tutor>() {
	        @Override
	        public int compare(Tutor t1, Tutor t2) {
	            return Integer.compare(t2.getHoursTutored(), t1.getHoursTutored());
	        }
	    });
	    
	    // Create and populate ModelAndView
	    ModelAndView data = new ModelAndView("chooseTutor.jsp");
	    data.addObject("tutors", tutors);
	    
	    return data;
	}
	
	
	@GetMapping("/admin")
	public ModelAndView adminDashboard() {
		
		List<Tutor> tutor = tutorService.listAll();
		List<Booking> booking = bookingService.listAll();
		
		ModelAndView data = new ModelAndView("adminDashboard.jsp");// load the admin dashboard
		data.addObject("tutors" , tutor);
		data.addObject("bookings", booking);
				
		return data;
		
	}
	

	 @PostMapping("/addTutor")//only admin have access
		public String addTutor(@RequestParam("profile") MultipartFile profile , @RequestParam("hiddenName")  String name ,
				@RequestParam("hiddenID") String id , @RequestParam("hiddenEmail") String email ,
				@RequestParam("hiddenPhone") String phone , @RequestParam("hiddenSubjects") String subjects ,
				@RequestParam("hiddenGrades") String grades , @RequestParam("hiddenSyllabus") String syllabus ,
				@RequestParam("tutorOption") String tutorOption , @RequestParam("hiddenAddress") String address,
				@RequestParam("bio") String bio , @RequestParam("about") String about,
				@RequestParam("hours") int hours) throws IOException 
		{
		 
           byte[] imageData = profile.getBytes();
		    
    
		   Tutor tutor = new Tutor(email,name,id,phone,subjects,grades,address,tutorOption,bio,about,hours,imageData,syllabus);
		      
		    tutorService.save(tutor); 
		   
			return "redirect:/admin"; // Redirect to adminDashBoard
		 
 
		}
	 
	 @PostMapping("/deleteTutor")
     public String deleteTutor(@RequestParam("deleteEmail") String email ) {
		 
		 Tutor tutor = new Tutor();
		    tutor.setEmail(email);
		      tutorService.delete(tutor);
		 	 
		 return "redirect:/admin";
		 
	 }
	 
	 @PostMapping("/editTutor")//only admin have access
		public String updateTutor(@RequestParam("editprofile") MultipartFile profile , @RequestParam("edithiddenName")  String name 
				, @RequestParam("edithiddenEmail") String email ,
				@RequestParam("edithiddenPhone") String phone , @RequestParam("edithiddenSubjects") String subjects ,
				@RequestParam("edithiddenGrades") String grades , @RequestParam("edithiddenSyllabus") String syllabus ,
				@RequestParam("edittutorOption") String tutorOption , @RequestParam("edithiddenAddress") String address,
				@RequestParam("editbio") String bio , @RequestParam("editabout") String about,
				@RequestParam("edithours") int hours) throws IOException 
		{
		 
           byte[] imageData = profile.getBytes();
		    
           Tutor tutor = new Tutor();
           tutor.setEmail(email);
		    tutor.setFullNames(name);
		    tutor.setImage(imageData);
		    tutor.setPhoneNumber(phone);
		    tutor.setEmail(email);
		    tutor.setAddress(address);
		    tutor.setSubjects(subjects);
		    tutor.setGrades(grades);
		    tutor.setSyllabus(syllabus);
		    tutor.setBio(bio);
		    tutor.setAbout(about);
		    tutor.setHoursTutored(hours);
		    tutor.setAvailability(tutorOption);
           
    
		    tutorService.update(email, tutor);
		    
		   
			return "redirect:/admin"; // Redirect to adminDashBoard
		 
 
		}
	 
	 
	 @PostMapping("/searchTutor")
	 @ResponseBody
	 public Tutor searchTutor(@RequestBody Map<String, String> requestBody) {
		 
		 System.out.println("SILANE NJEH");
		 String email = requestBody.get("searchEmail");
		 System.out.println(email);
		 
		 Optional<Tutor> opT = tutorRepo.findById(email);
		 Tutor tutor = new Tutor();
		 
		 if (opT.isPresent()){
			 
			 System.out.println("SIMTHOLILE");
			 
			 tutor = opT.get();
			 
			 
		 
		 }
		
		 return tutor;
		 
	 }
	 
	 
	 @PostMapping("/booking")
	 @ResponseBody
	 public void placeBooking(@RequestBody Map<String, String> booking) {
		 
		 /*form 1 data*/
		    String name = booking.get("first-name");
		    String surname = booking.get("last-name");
		    String email = booking.get("email");
		    String phone = booking.get("phone");
		    String subject = booking.get("subject");
		    String tutoring = booking.get("tutoring");
		    /*if null - no Internet connection*/
		    String internetCheck= booking.get("internet-check");
		    /*if empty - no suburb selected*/
		    String suburb = booking.get("suburb");
		    String contactMethod = booking.get("contact-method");
		    String province = booking.get("province");
		    String tutorName = booking.get("hiddenTutorName");
		    String tutorEmail = booking.get("hiddenTutorEmail");
		    

		    
		    /*form 2 data*/
		    
		    String tutoringFor = booking.get("tutoring-for");
		    String helpWith = booking.get("help-with");
		    /*School*/
		    String studName = "";
		    String studSurname="";
		    String grade = "";
		    String syllabus = "";
		     
		    /*University*/
		    String year = "";
		    
		    if(helpWith.equals("school")) {
		    	
		    	studName = booking.get("student-name");
		    	studSurname = booking.get("student-last-name");
		    	grade = booking.get("grade");
		    	syllabus = booking.get("syllabus");
		    }
		    
		    else {
		    	
		    	year = booking.get("year");
		    	
		    }
		    

		    /*form 3 data*/
		    
		    String message = booking.get("message");
		    
		    
		    Booking book = new Booking(name,surname,email,phone,subject,tutoring,internetCheck,suburb,contactMethod,province,
				   tutoringFor,helpWith,studName,studSurname,grade,syllabus,year,message,tutorName,tutorEmail);
		        
		    bookingService.save(book);
		    
		 
	 }
	
	
}
