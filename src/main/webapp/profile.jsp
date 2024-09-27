<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Tutor" %>
<%@ page import="com.example.demo.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <!--=============== REMIXICONS ===============-->
          <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">
          <!--=============== SWIPER CSS ===============-->
         <link rel="stylesheet" href="assets/swiper-bundle.min.css"> 
    
          <!--=============== CSS ===============-->
          <link rel="stylesheet" href="assets/styles.css">
          <link href="bookBook.css" rel="stylesheet">
          <link href="pp.css" rel="stylesheet"> 
    <title>ApexAcademicCentre</title>
</head>
<body>
 
    <nav class="navbar">
        <img src="apex.png" alt="Logo" class="logo" id="logo_image">
        <button class="navbar-toggle" id="navbar-toggle">
            <i class="fas fa-bars"></i> <!-- Hamburger icon -->
        </button>
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">About Us</a></li>
            <li class="dropdown">
                <a href="#" class="dropbtn">Tutoring <i class="fas fa-chevron-down"></i></a>
                <div class="dropdown-content">
                    <a href="#">Online Tutoring</a>
                    <a href="#">In-person Tutor</a>
                    <a href="#">Matric Re-Write</a>
                    <a href="#">Special Need Tutoring</a>
                    <a href="#">University/ College Tutors</a>
                    <a href="#">Homeschooling Support</a>
                    <a href="#">Person Edexcel Tutoring</a>
                </div>
            </li>
            <li class="dropdown">
                <a href="#" class="dropbtn">Cambridge <i class="fas fa-chevron-down"></i></a>
                <div class="dropdown-content">
                    <a href="#">Cambridge</a>
                    <a href="#">A Level Tutoring</a>
                    <a href="#">Expert Cambridge Tutors</a>
                    <a href="#">IGCSE Level Tutoring</a>
                    <a href="#">Cambridge Exam Timetable</a>
                </div>
            </li>
            <li><a href="#">Resources</a></li>
            <li><a href="#">Contact Us</a></li>


            <li>
                <button class="login-register">
                   Book Tutor
                </button>
            </li>
        </ul>
    </nav>





  <%
 
        Tutor tutor = (Tutor) request.getAttribute("tutor");

            byte[] image = tutor.getImage();
            String tutorImage = java.util.Base64.getEncoder().encodeToString(image);
            String name = tutor.getFullNames();
            Date currentDate = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
            String formattedDate = formatter.format(currentDate);
            int currentYear = Integer.parseInt(formattedDate); 

            Date dob = tutor.getDob();
            formattedDate = formatter.format(dob);
            int birthYear = Integer.parseInt(formattedDate);

            // Calculate age
            int age = currentYear - birthYear;
            
            // Optional: Adjust if the birthday hasn't occurred yet this year
            Calendar today = Calendar.getInstance();
            Calendar birthDate = Calendar.getInstance();
            birthDate.setTime(dob);
            
            if (today.get(Calendar.MONTH) < birthDate.get(Calendar.MONTH) || 
                (today.get(Calendar.MONTH) == birthDate.get(Calendar.MONTH) && today.get(Calendar.DAY_OF_MONTH) < birthDate.get(Calendar.DAY_OF_MONTH))) {
                age--; // Decrease age if birthday hasn't occurred yet this year
            }

            String area = tutor.getArea();
            String country = tutor.getCountry();
            String province = tutor.getAddress();
            String curriculum = tutor.getSyllabus();
            String tutoring = tutor.getAvailability();
            String subjects = tutor.getSubjects();
            String qualifications = tutor.getBio();
            int ratings = tutor.getRatings();
            String email = tutor.getEmail().trim().replaceAll("\\s+", "");
            String descTutor = tutor.getHoursTutored();
            String surname = tutor.getSurname();
            String modules = tutor.getModule();
            String fullName = name + " " + surname;
            String grades = tutor.getGrades();

            
  %>


    <div class="whole-wrapper">
        <div class="main-section">

            <div class="the-left">
                <!-- Tutor's Picture and Info Div -->
                <div class="upper-line">
                    <div class="profile-picture-container">
                        <img src="data:image/png;base64,<%= tutorImage %>" alt="Tutor's Picture">
                        <div class="name"><%= name %> <%= surname %></div>
                        <div class="age"><%= age %> years old</div>
                    </div>
                    <div class="details">
                        <p>
                            <span class="static-text">Country :</span> <span class="detail-info"><%= country %></span><br>
                            <span class="static-text">Province :</span> <span class="detail-info"><%= province %></span><br>
                            <span class="static-text">Area :</span> <span class="detail-info"><%= area %></span><br>
                            <span class="static-text">Curriculum :</span> <span class="detail-info"><%= curriculum %></span><br>
                            <span class="static-text">Tutoring Option :</span> <span class="detail-info"><%= tutoring %></span>
                        </p>
                        <div class="ratings">
                            <i class="fas fa-star" id="rate-icon"></i>
                            <span id="rate"> <%= ratings %> Ratings</span>
                        </div>
                        <div class="feedback-item">
                            <i class="fas fa-check-circle" id="back-icon"></i>
                            <span class="back">Background Checked</span>
                        </div>
                    </div>
                </div>
                

                <!--Book Tutor Button-->
                <div class="profile-action">
                    <button id="book-tutor-button" class="book-tutor-button" onclick="openOpenopen('<%= fullName %>' , '<%= email %>', '<%= curriculum %>', '<%= grades %> ', '<%= subjects %> ')">Book <%= name %></button>
                </div>


                <div class="matric">
                    <img src="matric.png" alt="Matric">

                </div>
            </div>

            <div class="right-side">

                <div class="profile-container">

                    <div class="about-tutor-row">
                        <div class="about-tutor-title"><i class="far fa-user"></i>&nbsp;&nbsp;Bio</div>
                        <div class="about-tutor-info">
                            <p id="profile_about">
                                <%= descTutor %>
                            </p>
                        </div>
                    </div>
                    <div class="qualifications-row">
                        <div class="qualifications-title"><i class="fas fa-university"></i>&nbsp;&nbsp;Education</div>

                        <div class="subjects-info" >
                            <ul>
                                <%
                                    String[] c = qualifications.split(",");
                                    for (String s : c) {
                                %>
                                    <li>•&nbsp;<%= s.trim() %></li>
                                <% } %>
                            </ul>
                            <br><br>
                        </div>
                        <br><br>

                    </div>
                    <div class="subjects-row">
                        <div class="subjects-title">
                            <div class="school_head">
                                <i class="fa fa-book"></i>&nbsp;&nbsp;Subjects
                            </div>
                            <div class="bongi">
                                School tutoring<br>
                                <span class="grades">GRD:1 - GRD:12</span>
                            </div>
                        </div>
                      
                            <div class="subjects-info">
                                <%
                               
                                    String[] sub = subjects.split(",");
                                    for (String subject : sub) {
                                %>
                                    <p><%= subject %></p>
                                <% } %>
                                <br><br>
                            </div>
 
                    </div>
                   
                    <%
                    if (modules != null && !modules.isEmpty()) { // Check for null and empty
                    %>
                        <div class="University-row">
                            <div class="subjects-title">
                                <div class="header1">
                                    <i class="fa fa-book"></i>&nbsp;&nbsp;Subjects
                                </div>
                                <div class="tutoring-container1">
                                    University tutoring<br>
                                    <span class="modules">1st yr - 4th yr</span>
                                </div>
                            </div>
                            <div class="subjects-info">
                                <%
                                String[] mod = modules.split(",");
                                for (String modu : mod) {
                                %>
                                    <p><%= modu.trim() %></p> <!-- Trim to remove any leading/trailing whitespace -->
                                <% } %>
                                <br><br>
                            </div>
                        </div>
                    <%
                    } else {
                    %>
                       
                    <%
                    }
                    %>

                </div>

                <div class="long-paragraph">
                    See the feedback and accolades from individuals who have experienced my work firsthand.
                </div>

                <section class="container">

                    <div class="card__container swiper">
                        <div class="card__content">
                            <div class="reviews1">
                                <i class="fas fa-star" id="rate-icon"></i>
                                <span id="rev">Reviews</span>
                            </div>
                            <div class="swiper-wrapper">
                                <%
                                    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
                                    Set<String> displayedTutors = new HashSet<>();
                                    boolean hasReviews = false; // Flag to check if there are any approved reviews
                                    int reviewCount = 0; // Counter to limit displayed reviews
                                    final int maxReviewsToShow = 3; // Maximum reviews to show
                    
                                    if (reviews != null) {
                                        for (Review r : reviews) {
                                            String emailTutor = r.getTutorEmail().trim().replaceAll("\\s+", "");
                                            if (emailTutor.equals(email) && r.getStatus().equals("approved")) {
                                                hasReviews = true; // Set flag if there's at least one approved review
                                                String tutName = r.getName();
                                                String reviewDescription = r.getMessage();
                                                
                                                // Create a unique key for each tutor's review
                                                String uniqueKey = emailTutor + "_" + tutName;
                    
                                                // Only display if this unique key hasn't been displayed yet
                                                if (!displayedTutors.contains(uniqueKey)) {
                                                    displayedTutors.add(uniqueKey);
                                                    reviewCount++; // Increment the review counter
                    
                                                    // Limit the number of displayed reviews
                                                    if (reviewCount > maxReviewsToShow) {
                                                        break; // Exit the loop if the limit is reached
                                                    }
                                %>
                                                    <article class="card__article swiper-slide">
                                                        <div class="card__data">
                                                            <h3 class="card__name"><%= tutName %></h3>
                                                            <p class="card__description">
                                                                <%= reviewDescription != null ? reviewDescription : "No description available." %>
                                                            </p>
                                                        </div>
                                                    </article>
                                <%
                                                }
                                            }
                                        }
                                    }
                    
                                    // Display a message if no approved reviews were found
                                    if (!hasReviews) {
                                %>
                                        <p>No reviews available.</p>
                                <%
                                    }
                                %>
                            </div>
                    
                            <!-- Navigation buttons -->
                            <div class="swiper-button-next">
                                <i class="ri-arrow-right-s-line"></i>
                            </div>
                    
                            <div class="swiper-button-prev">
                                <i class="ri-arrow-left-s-line"></i>
                            </div>
                    
                            <!-- Pagination -->
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    
                </section>

                <div class="short-paragraph">
                    Your Personal Tutor in the Comfort of Your Own Home
                    <!--Book Tutor Button and find tutor-->
                    <div class="button-action">
                        <button id="book-tutor-button" class="book-tutor-button" onclick="openOpenopen('<%= fullName %>' , '<%= email %>', '<%= curriculum %>', '<%= grades %> ', '<%= subjects %>')">Book <%= name %></button>
                        <button id="find-tutor-button" class="find-tutor-button">Find Me A Tutor</button>
                    </div>
                </div>

            </div>

        </div>

    </div>
    

    <div class="arrow-container">
        <button class="arrow" id="scrollLeft">&#10094;</button>
        
        <div class="scroll-container" id="scrollContainer">
            <%
            List<Tutor> tutors = (List<Tutor>) request.getAttribute("tutors");
            String excludedName = (String) request.getAttribute("name"); // Assuming 'name' is set in request scope
            if (tutors != null && !tutors.isEmpty()) {
                for (Tutor t : tutors) {
                    byte[] imgs = t.getImage();
                    String tutorImg = java.util.Base64.getEncoder().encodeToString(imgs);
                    String tName = t.getFullNames();
    
                    // Check if the tutor's name does not match the excluded name
                    if (excludedName == null || !tName.equals(excludedName)) {
            %>
                        <div class="scroll-item">
                            <img src="data:image/png;base64,<%= tutorImg %>" alt="Member Image" id="isthombe">
                            <p><%= tName %></p>
                            <p class="reviews" style="margin-top: 10px;">
                                <i class="fas fa-star review-icon"></i>
                                <i class="fas fa-star review-icon"></i>
                                <i class="fas fa-star review-icon"></i>
                                <i class="fas fa-star review-icon"></i>
                                <i class="fas fa-star review-icon"></i>
                            </p>
                        </div>
            <%
                    }
                }
            } else {
            %>
                <div class="no-tutors">
                    <p>No tutors found.</p>
                </div>
            <%
            }
            %>
        </div>
    
        <button class="arrow" id="scrollRight">&#10095;</button>
    </div>



     <!--BOOKING FORM--> 
	
     <div class="wrapper" id="modal">

        <div class="modal-content">

        <span class="close-btn" id="close-popup">&times;</span>
        <!--START OF FORMS-->
        <div class="form_wrap">
            <div class="form_1 data_info">
                <h2><span class="directTutor"></span></h2>
                <br>
                <form id="contact-form">
                    <div class="form_container">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="first-name">First Name <span class="required">*</span></label>
                                <input type="text" id="first-name" name="first-name" class="input" placeholder="John" required>
                                <div id="first-name-error" class="error"></div>
                            </div>
                            <div class="form-group">
                                <label for="last-name">Last Name <span class="required">*</span></label>
                                <input type="text" id="last-name" name="last-name" class="input" placeholder="Doe" required>
                                <div id="last-name-error" class="error"></div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="email">Email <span class="required">*</span></label>
                                <input type="email" id="email" name="email" class="input" placeholder="example@domain.com" required>
                                <div id="email-error" class="error"></div>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone <span class="required">*</span></label>
                                <input type="tel" id="phone" name="phone" class="input" placeholder="(123) 456-7890" required>
                                <div id="phone-error" class="error"></div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="province">Province <span class="required">*</span></label>
                                <select id="province" name="province" class="input" required>
                                    <option value="" disabled selected>Select your province</option>
                                    <option value="limpopo">Limpopo</option>
                                    <option value="gauteng">Gauteng</option>
                                    <option value="free-state">Free State</option>
                                    <option value="north-west">North West</option>
                                    <option value="northern-cape">Northern Cape</option>
                                    <option value="eastern-cape">Eastern Cape</option>
                                    <option value="kwa-zulu-natal">Kwa Zulu Natal</option>
                                    <option value="mpumalanga">Mpumalanga</option>
                                    <option value="western-cape">Western Cape</option>
                                    <option value="Internationally">Internationally</option>
                                </select>
                                <div id="province-error" class="error"></div>
                            </div>

                            <div class="form-group">
                                <label for="country">Country <span class="required">*</span></label>
                                <select id="country" name="country" class="input" required>
                                    <option value="" disabled selected>Select your country</option>
                                    <option value="South Africa">South Africa</option>
                                    <option value="Australia">Australia</option>
                                    <option value="Japan">Japan</option>
                                    <option value="Brazil">Brazil</option>
                                    <option value="India">India</option>
                                    <option value="Mexico">Mexico</option>
                                    <option value="France">France</option>
                                    <option value="Italy">Italy</option>
                                    <option value="Germany">Germany</option>
                                </select>
                                <div id="country-error" class="error"></div>
                            </div>


                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="language">Language<span class="required">*</span></label>
                                <select id="language" name="language" class="input" required>
                                    <option value="" disabled selected>Select Language of Instruction</option>
                                    <option value="English">English</option>
                                </select>
                                <div id="language-error" class="error"></div>
                            </div>

                        </div>


                    </div>
                    <div class="btns_wrap">
                        <div class="common_btns form_1_btns">
                            <button type="button" class="btn_next">Next</button>
                        </div>
                    </div>
                    <div class="form-group">
                        
                        <input type="hidden" id="hiddenTutorName" name="hiddenTutorName">
                        <input type="hidden" id="hiddenTutorEmail" name="hiddenTutorEmail">

                    </div>
                </form>
            </div>
            <div class="form_2" style="display: none;">
               <h2><span class="directTutor"></span></h2>
                <br>
                <div id="form-container-2" class="form-container hidden">
                    <form id="additional-form">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="tutoring-for">Who is the tutoring for? <span class="required">*</span></label>
                                <select id="tutoring-for" name="tutoring-for" required>
                                    <option value="" disabled selected>Select one</option>
                                    <option value="my-son">My son</option>
                                    <option value="my-daughter">My daughter</option>
                                    <option value="me">Me</option>
                                    <option value="someone-else">Someone else</option>
                                </select>
                                <div id="tutoring-for-error" class="error"></div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>What do you need help with? <span class="required">*</span></label>
                                <div class="radio-group">
                                    <label>
                                        <input type="radio" id="help-with" name="help-with" value="school" onclick="studentInfo()" required>
                                        School
                                    </label>
                                    <label>
                                        <input type="radio" id="help-with" name="help-with" value="university" onclick="vasityInfo()" required>
                                        University
                                    </label>
                                    <div id="help-with-error" class="error"></div>
                                </div>
                            </div>
                        </div>

                        <div id="student-info" class="hidden">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="student-name">Student Name <span class="required">*</span></label><br>
                                    <input type="text" id="student-name" name="student-name" placeholder="Student name" class="input" required>
                                    <div id="student-name-error" class="error"></div>
                                </div>
                                <div class="form-group">
                                    <label for="student-last-name">Last name <span class="required">*</span></label><br>
                                    <input type="text" id="student-last-name" name="student-last-name" placeholder="Last name" class="input" required>
                                    <div id="student-last-name-error" class="error"></div>
                                </div>
                            </div>
                       
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="grade">Grade <span class="required">*</span></label><br>
                                    <select id="grade" name="grade" required>
                                        <option value="" disabled selected>Select grade</option>

                                    </select>
                                    <div id="grade-error" class="error"></div>
                                </div>
                                <div class="form-group">
                                    <label for="syllabus">Syllabus <span class="required">*</span></label>
                                    <select id="syllabus" name="syllabus" required>
                                        <option value="Other" id="other-option">Other</option>
                                    </select>
                                    <div id="syllabus-error" class="error"></div>
                                </div>
                            </div>
                        
                        </div>


                        <div id="year-selection-container" class="hidden">

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="stud-name">Student Name <span class="required">*</span></label><br>
                                    <input type="text" id="stud-name" name="stud-name" placeholder="Student name" class="input" required>
                                    <div id="stud-name-error" class="error"></div>
                                </div>
                                <div class="form-group">
                                    <label for="stud-last">Last name <span class="required">*</span></label><br>
                                    <input type="text" id="stud-last" name="stud-last" placeholder="Last name" class="input" required>
                                    <div id="stud-last-error" class="error"></div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label>Select year <span class="required">*</span></label>
                                    <div class="radio-group">
                                        <label>
                                            <input type="radio" id="year" name="year" value="1st" required>
                                            1st
                                        </label>
                                        <label>
                                            <input type="radio" id="year" name="year" value="2nd" required>
                                            2nd
                                        </label>
                                        <label>
                                            <input type="radio" id="year" name="year" value="3rd" required>
                                            3rd
                                        </label>
                                        <label>
                                            <input type="radio" id="year" name="year" value="4th" required>
                                            4th
                                        </label>
                                        <label>
                                            <input type="radio" id="year" name="year" value="postgrad" required>
                                            Postgrad
                                        </label>
                                        <div id="year-error" class="error"></div>
                                    </div>
                                </div>
                            </div>
                        </div> 

                        <div class="btns_wrap">
                            <div class="common_btns form_2_btns">
                                <button type="button" class="btn_back">Back</button>
                                <button type="button" class="btn_next">Next</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="form_3" style="display: none;" id="formThree">
                <h2><span class="directTutor"></span></h2>
                <br>
            
                <form id="submit-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="subject">Select Subject <span class="required">*</span></label><br>
                            <input type="text" id="subject" name="subject" class="input" required readonly onclick="toggleSubjectOptions()">
                            <div id="subjectContainer" style="display: none;"></div>
                            <div id="subject-error" class="error"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Tutoring Option<span class="required">*</span></label>
                        <div class="radio-group">
                            <br>
                            <label>
                                <input type="radio" id="tutor-style" name="tutor-style" value="Online" onclick="onlineInfo()" required>
                                Online
                            </label>
                            <label>
                                <input type="radio" id="tutor-style" name="tutor-style" value="In Person" onclick="inPersonInfo()" required>
                                In-Person
                            </label>
                            <div id="tutor-style-error" class="error"></div>
                        </div>
                    </div>

                    <div class="form-row" id="in-person-teaching">
                        <div class="form-group">
                            <label for="address">Address<span class="required">*</span></label><br>
                            <input type="text" id="address-inperson" name="address-inperson" placeholder="" class="input" required>
                            <div id="inperson-error" class="error"></div>
                        </div>
                        <div class="form-group">
                            <label for="suburb-inperson">Suburb<span class="required">*</span></label><br>
                            <input type="text" id="suburb-inperson" name="suburb-inperson" placeholder="" class="input" required>
                            <div id="suburb-inperson-error" class="error"></div>
                        </div>
                    </div>


                <div class="btns_wrap">
                    <div class="common_btns form_3_btns">
                        <button type="button" class="btn_back">Back</button>
                        <button type="button" class="btn_next">Next</button>
                    </div>
                </div>
            </form>
            </div>
     

            <div class="form_4" style="display: none;" >
                <h2><span class="directTutor"></span></h2>
                <div id="Message" class="hidden">
                    <form id="formFour">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="message">Message <span class="required"></span></label><br><br>
                            <textarea id="message" name="message" placeholder="Is there anything else you would like to add?...." class="textarea" required></textarea>
                            <div id="message-error" class="error"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Would you like a second tutor option?<span class="required">*</span></label>
                        <div class="radio-group">
                            <br>
                            <label>
                                <input type="radio" id="tutor-option" name="tutor-option" value="Yes" required>
                                Yes
                            </label>
                            <label>
                                <input type="radio" id="tutor-option" name="tutor-option" value="No" required>
                               No
                            </label>
                            <div id="tutor-option-error" class="error"></div>
                        </div>
                    </div>

                    <div class="terms-row">
                        <input type="checkbox" id="terms" name="terms" required>
                        <label for="terms">
                            I have read and agree to the <a href="#" target="_blank">Terms and Conditions</a> and <a href="#" target="_blank">Privacy Policy</a>.<span class="required">*</span>
                        </label>
                        <div id="terms-error" class="error"></div>
                    </div>

                <div class="btns_wrap">
                    <div class="common_btns form_4_btns">
                        <button type="button" class="btn_back">Back</button>
                        <button type="button" class="btn_next">Next</button>
                    </div>
                </div>
               </form>
            </div>
        </div>

            <!--form 5-->

            <div class="form_5" style="display: none;" id="formFive">
                <h2>Payment Packages</h2>
            
                <div class="div-container" id="schoolPackages">
                    <div class="custom-div">
                        <h3>Once Off Package</h3>
                        <div class="content">
                            <div class="session-per-month">1 Session per month<br>(once off)</div>
                            <div class="package-details">Package Details</div>
                     
                            <button type="submit" class="package-btn" id="onceOffPackage"></button>
                          
                        </div>
                    </div>
                    <div class="custom-div">
                        <h3>Basic Package</h3>
                        <div class="content">
                            <div class="session-per-month">4 Sessions per month<br>(once a week)</div>
                            <div class="package-details">Package Details</div>
                    
                            <button type="submit" class="package-btn" id="basicPackage"></button>
                         
                        </div>
                    </div>
                    <div class="custom-div">
                        <h3>Premium Package</h3>
                        <div class="content">
                            <div class="session-per-month">8 Sessions per month<br>(once a week)</div>
                            <div class="package-details">Popular</div>
                     
                            <button type="submit" class="package-btn" id="premiumPackage"></button>
                        
                        </div>
                    </div>
                    <div class="custom-div">
                        <h3>Advanced Package</h3>
                        <div class="content">
                            <div class="session-per-month">12 Sessions per month<br>(once a week)</div>
                            <div class="package-details">Package Details</div>
                        
                            <button type="submit" class="package-btn" id="advancedPackage"></button>
                          
                        </div>
                    </div>
                    <div class="custom-div">
                        <h3>Elite Package</h3>
                        <div class="content">
                            <div class="session-per-month">16 Sessions per month<br>(once a week)</div>
                            <div class="package-details">Package Details</div>
                            
                            <button type="submit" class="package-btn" id="elitePackage"></button>
                        
                        </div>
                    </div>
                </div>

                <div class="div-container" id="universityPackages">
                    <div class="custom-div">
                        <h3>One on One</h3>
                        <div class="content">
                            <div class="session-per-month">1 Session per month<br>(once off)</div>
                            <div class="package-details">Package Details</div>
                     
                            <button type="submit" class="package-btn" id="oneOnone"></button>
                          
                        </div>
                    </div>
                    <div class="custom-div">
                        <h3>2 to 5 students</h3>
                        <div class="content">
                            <div class="session-per-month">4 Sessions per month<br>(once a week)</div>
                            <div class="package-details">Package Details</div>
                    
                            <button type="submit" class="package-btn" id="twoTofivePackage"></button>
                            
                        </div>
                    </div>
                    <div class="custom-div">
                        <h3>6 to 10 students</h3>
                        <div class="content">
                            <div class="session-per-month">8 Sessions per month<br>(once a week)</div>
                            <div class="package-details">Package Details</div>
                     
                            <button type="submit" class="package-btn" id="sixTo10Package"></button>
                        
                        </div>
                    </div>
            
                </div>
                
                <div class="btns_wrap">
                    <div class="common_btns form_5_btns">
                        <button type="button" class="btn_back">Back</button>
                        <button type="button" class="btn_next" id="consult_btn" ">Speak to consultant</button>
                    </div>
                </div>
            </div>

            <!--form 5-->

        </div>

        <!--END OF FORMS-->
        <div class="modal_wrapper">
            <div class="shadow"></div>
            <div class="success_wrap">
                <div class="modal_icon">✓</div>
                <p>Thank you! Your form has been submitted successfully.</p>
            </div>
        </div>
    </div>
</div>
<!--</div>-->
    

    


     <!--BOOKING FORM--> 
    
    
    <script>

const navbarToggle = document.getElementById('navbar-toggle');
const navLinks = document.querySelector('.nav-links');

// Toggle menu on button click
navbarToggle.addEventListener('click', function() {
    navLinks.classList.toggle('show');
});

// Close menu when a link is clicked
navLinks.querySelectorAll('li a').forEach(link => {
    link.addEventListener('click', function() {
        navLinks.classList.remove('show'); // Close the menu
    });
});

// Optional: Close menu when clicking outside of it
window.addEventListener('click', function(event) {
    if (!navbarToggle.contains(event.target) && !navLinks.contains(event.target)) {
        navLinks.classList.remove('show'); // Close the menu
    }
});



    const scrollContainer = document.getElementById('scrollContainer');

document.getElementById('scrollLeft').addEventListener('click', () => {
    scrollContainer.scrollLeft -= 210; // Adjust as necessary
});

document.getElementById('scrollRight').addEventListener('click', () => {
    scrollContainer.scrollLeft += 210; // Adjust as necessary
});




document.addEventListener('DOMContentLoaded', function() {
  const otherOption = document.getElementById('other-option');
  otherOption.style.display = 'none'; // Hide the "Other" option
});

document.addEventListener('DOMContentLoaded', function() {
            var form_1 = document.querySelector(".form_1");
            var form_2 = document.querySelector(".form_2");
            var form_3 = document.querySelector(".form_3");
            var form_4 = document.querySelector(".form_4");
            var form_5 = document.querySelector(".form_5");

            var form_1_btns = document.querySelector(".form_1_btns");
            var form_2_btns = document.querySelector(".form_2_btns");
            var form_3_btns = document.querySelector(".form_3_btns");
            var form_4_btns = document.querySelector(".form_4_btns");
            var form_5_btns = document.querySelector(".form_5_btns");

            var form_1_next_btn = document.querySelector(".form_1_btns .btn_next");
            var form_2_back_btn = document.querySelector(".form_2_btns .btn_back");
            var form_2_next_btn = document.querySelector(".form_2_btns .btn_next");
            var form_3_back_btn = document.querySelector(".form_3_btns .btn_back");
            var form_3_next_btn = document.querySelector(".form_3_btns .btn_next");
            var form_4_back_btn = document.querySelector(".form_4_btns .btn_back");
            var form_4_next_btn = document.querySelector(".form_4_btns .btn_next");
            var form_5_back_btn = document.querySelector(".form_5_btns .btn_back");
            var consult = document.querySelector(".form_5_btns .btn_next");


            var form_2_progessbar = document.querySelector(".form_2_progessbar");
            var form_3_progessbar = document.querySelector(".form_3_progessbar");

            var btn_done = document.querySelector(".btn_done");
            var modal_wrapper = document.querySelector(".modal_wrapper");
            var shadow = document.querySelector(".shadow");

            function validateForm1() {

                var firstName = document.getElementById('first-name').value.trim();
                var lastName = document.getElementById('last-name').value.trim();
                var email = document.getElementById('email').value.trim();
                var phone = document.getElementById('phone').value.trim();
                var province = document.getElementById('province').value;
                var country = document.getElementById('country').value;
                var language = document.getElementById('language').value;

                var isValid = true;

                // Validate required text inputs
                if (!firstName) {
                    document.getElementById('first-name-error').textContent = "First name is required.";
                    isValid = false;
                } else {
                    document.getElementById('first-name-error').textContent = "";
                }

                if (!lastName) {
                    document.getElementById('last-name-error').textContent = "Last name is required.";
                    isValid = false;
                } else {
                    document.getElementById('last-name-error').textContent = "";
                }

                if (!email) {
                    document.getElementById('email-error').textContent = "Email is required.";
                    isValid = false;
                } else {
                    document.getElementById('email-error').textContent = "";
                }

                if (!phone) {
                    document.getElementById('phone-error').textContent = "Phone number is required.";
                    isValid = false;
                } else {
                    document.getElementById('phone-error').textContent = "";
                }

                if (!country) {
                    document.getElementById('country-error').textContent = "Country is required.";
                    isValid = false;
                } else {
                    document.getElementById('country-error').textContent = "";
                }

                // Validate radio buttons
                if (!language) {
                    document.getElementById('language-error').textContent = "Language is required.";
                    isValid = false;
                } else {
                    document.getElementById('language-error').textContent = "";
                }

                // Validate dropdown
                if (!province) {
                    document.getElementById('province-error').textContent = "Please select a province.";
                    isValid = false;
                } else {
                    document.getElementById('province-error').textContent = "";
                }

                return isValid;
            }

            function validateForm2() {
        
                var isValid = true;
				var tutoringfor = document.getElementById("tutoring-for").value;
				var helpingFor = document.querySelector('input[name="help-with"]:checked');
				var ghg = helpingFor ? helpingFor.value : 'None';
				var studentName = document.getElementById('student-name').value.trim();
				var studentLastName = document.getElementById('student-last-name').value.trim();
				var yearFor = document.querySelector('input[name="year"]:checked');
				var syllabusId = document.getElementById('syllabus').value;
				var gradeId = document.getElementById('grade').value;
                var studname =  document.getElementById('stud-name').value;
                var studlast =  document.getElementById('stud-last').value;
				
				
				if(ghg === "school"){
					
					if (!studentName) {
                    document.getElementById('student-name-error').textContent = "Student name is required.";
                    isValid = false;
                } else {
                    document.getElementById('student-name-error').textContent = "";
                }

				if (!studentLastName) {
                    document.getElementById('student-last-name-error').textContent = "Last name is required.";
                    isValid = false;
                } else {
                    document.getElementById('student-last-name-error').textContent = "";
                }

				if (!syllabusId) {
                    document.getElementById('syllabus-error').textContent = "Please select syllabus.";
                    isValid = false;
                } else {
                    document.getElementById('syllabus-error').textContent = "";
                }

				if (!gradeId) {
                    document.getElementById('grade-error').textContent = "Please select grade.";
                    isValid = false;
                } else {
                    document.getElementById('grade-error').textContent = "";
                }

				}else{
					
					if (!yearFor) {
                    document.getElementById('year-error').textContent = "Please select year.";
                    isValid = false;
                    } else {
                    document.getElementById('year-error').textContent = "";
                    }

                    if (!studname) {
                    document.getElementById('stud-name-error').textContent = "Student name required.";
                    isValid = false;
                    } else {
                    document.getElementById('stud-name-error').textContent = "";
                    }

                    if (!studlast) {
                    document.getElementById('stud-last-error').textContent = "Student surname required.";
                    isValid = false;
                    } else {
                    document.getElementById('stud-last-error').textContent = "";
                    }

				}

				// Validate dropdown
                if (!tutoringfor) {
                    document.getElementById('tutoring-for-error').textContent = "Please select one.";
                    isValid = false;
                } else {
                    document.getElementById('tutoring-for-error').textContent = "";
                }

				// Validate radio buttons
                if (!helpingFor) {
                    document.getElementById('help-with-error').textContent = "Please choose what you need help with.";
                    isValid = false;
                } else {
                    document.getElementById('help-with-error').textContent = "";
                }

                return isValid;
            }

            function validateForm3() {

                 var isValid = true;
            
            var subject = document.getElementById('subject').value.trim();
            var tutoring = document.querySelector('input[name="tutor-style"]:checked');
            var ghg = tutoring ? tutoring.value : 'None';
            var addressTeaching = document.getElementById('address-inperson').value.trim(); 
            var suburbTeaching = document.getElementById('suburb-inperson').value.trim(); 

            if (!subject) {
                    document.getElementById('subject-error').textContent = "Please select subject(s) type.";
                    isValid = false;
                } else {
                    document.getElementById('subject-error').textContent = "";
                }

            if (!tutoring) {
                    document.getElementById('tutor-style-error').textContent = "Please select a tutoring type.";
                    isValid = false;
                } else {
                    document.getElementById('tutor-style-error').textContent = "";
                }

                if(ghg === "In Person"){
					
					if (!addressTeaching) {
                    document.getElementById('inperson-error').textContent = "please fill in your address.";
                    isValid = false;
                } else {
                    document.getElementById('inperson-error').textContent = "";
                }

				if (!suburbTeaching) {
                    document.getElementById('suburb-inperson-error').textContent = "please fill in your suburb.";
                    isValid = false;
                } else {
                    document.getElementById('suburb-inperson-error').textContent = "";
                }
              }
                
				return isValid;

            }

            consult.addEventListener("click", function() {

                alert("Consultant will get in touch  with you shortly. Thank you.");

                const allData = combineFormData();

                const dataToSend = {
                    ...allData
                };

                        fetch('/other-booking', { // Replace with your actual endpoint URL
                                method: 'POST',
                                headers: { 
                                    'Content-Type': 'application/json' 
                                },
                                body: JSON.stringify(dataToSend)
                            })
                            .then(response => response.json())
                            .then(result => {
                            
                                setTimeout(function(){
                                        window.location.href = '/';
                                    } , 2000);

                                    
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                // Optionally handle error response
                            });

                setTimeout(function(){
                    window.location.href = '/';
                } , 2000);

            
});


            function validateForm4() {

                var tutoring = document.querySelector('input[name="tutor-style"]:checked');
                var ghg = tutoring ? tutoring.value : 'None';
                var helpingFor = document.querySelector('input[name="help-with"]:checked');
				var forWho = helpingFor ? helpingFor.value : 'None';
                var syllabusId = document.getElementById('syllabus').value;

                if(forWho === "school"){

                    var universityPackages = document.getElementById("universityPackages");
                    universityPackages.style.display = 'none';
                    var schoolPackages = document.getElementById("schoolPackages");
                    schoolPackages.style.display = 'flex';

                if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){

                    const onceOffPackage = document.getElementById('onceOffPackage');
                    onceOffPackage.textContent = 'R300'; // or button.innerHTML = 'Submit';

                    const basicPackage= document.getElementById('basicPackage');
                    basicPackage.textContent = 'R1100'; // or button.innerHTML = 'Submit';

                    const premiumPackage = document.getElementById('premiumPackage');
                    premiumPackage.textContent = 'R2150'; // or button.innerHTML = 'Submit';

                    const advancedPackage = document.getElementById('advancedPackage');
                    advancedPackage.textContent = 'R3250'; // or button.innerHTML = 'Submit';

                    const elitePackage =  document.getElementById('elitePackage');
                    elitePackage.textContent = 'R4350'; // or button.innerHTML = 'Submit';

                }
                else{
                    if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexel" ){
                       
                        const onceOffPackage = document.getElementById('onceOffPackage');
                        onceOffPackage.textContent = 'R400'; // or button.innerHTML = 'Submit';

                        const basicPackage= document.getElementById('basicPackage');
                        basicPackage.textContent = 'R1550'; // or button.innerHTML = 'Submit';

                        const premiumPackage = document.getElementById('premiumPackage');
                        premiumPackage.textContent = 'R3100'; // or button.innerHTML = 'Submit';

                        const advancedPackage = document.getElementById('advancedPackage');
                        advancedPackage.textContent = 'R4650'; // or button.innerHTML = 'Submit';

                        const elitePackage =  document.getElementById('elitePackage');
                        elitePackage.textContent = 'R6200'; // or button.innerHTML = 'Submit';

                    }
                    else{
                        if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){

                            const onceOffPackage = document.getElementById('onceOffPackage');
                            onceOffPackage.textContent = 'R400'; // or button.innerHTML = 'Submit';

                            const basicPackage= document.getElementById('basicPackage');
                            basicPackage.textContent = 'R1550'; // or button.innerHTML = 'Submit';

                            const premiumPackage = document.getElementById('premiumPackage');
                            premiumPackage.textContent = 'R3100'; // or button.innerHTML = 'Submit';

                            const advancedPackage = document.getElementById('advancedPackage');
                            advancedPackage.textContent = 'R4650'; // or button.innerHTML = 'Submit';

                            const elitePackage =  document.getElementById('elitePackage');
                            elitePackage.textContent = 'R6200'; // or button.innerHTML = 'Submit';

                                }

                            else{
                                if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexel" ){
                       
                                        const onceOffPackage = document.getElementById('onceOffPackage');
                                        onceOffPackage.textContent = 'R550'; // or button.innerHTML = 'Submit';

                                        const basicPackage= document.getElementById('basicPackage');
                                        basicPackage.textContent = 'R2150'; // or button.innerHTML = 'Submit';

                                        const premiumPackage = document.getElementById('premiumPackage');
                                        premiumPackage.textContent = 'R4300'; // or button.innerHTML = 'Submit';

                                        const advancedPackage = document.getElementById('advancedPackage');
                                        advancedPackage.textContent = 'R6350'; // or button.innerHTML = 'Submit';

                                        const elitePackage =  document.getElementById('elitePackage');
                                        elitePackage.textContent = 'R8500'; // or button.innerHTML = 'Submit';

                                    }
                                   
                            }
                    }
                }
            }

                else{

                     var schoolPackages = document.getElementById("schoolPackages");
                     schoolPackages.style.display = 'none';
                     var universityPackages = document.getElementById("universityPackages");
                     universityPackages.style.display = 'flex';

                     if(ghg === "In Person"){
                       
                       const onceOffPackage = document.getElementById('oneOnone');
                       onceOffPackage.textContent = 'R650'; // or button.innerHTML = 'Submit';

                       const basicPackage= document.getElementById('twoTofivePackage');
                       basicPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

                       const premiumPackage = document.getElementById('sixTo10Package');
                       premiumPackage.textContent = 'R350'; // or button.innerHTML = 'Submit';

                        }
                        else{

                          
                       
                        const onceOffPackage = document.getElementById('oneOnone');
                        onceOffPackage.textContent = 'R450'; // or button.innerHTML = 'Submit';

                        const basicPackage= document.getElementById('twoTofivePackage');
                        basicPackage.textContent = 'R300'; // or button.innerHTML = 'Submit';

                        const premiumPackage = document.getElementById('sixTo10Package');
                        premiumPackage.textContent = 'R200'; // or button.innerHTML = 'Submit';

                        }
                  

                }

                    var isValid = true;

                    var message = document.getElementById('message').value.trim();
                    var secondTutor = document.querySelector('input[name="tutor-option"]:checked');
                    var ghg = secondTutor ? secondTutor.value : 'None';

                    if (!secondTutor) {
                    document.getElementById('tutor-option-error').textContent = "Please specify.";
                    isValid = false;
                    } else {
                    document.getElementById('tutor-option-error').textContent = "";
                    }
                    
                    var termsCheckbox = document.getElementById('terms');
                        if (termsCheckbox.checked) {
                            document.getElementById('terms-error').textContent = "";
                        } else {
                            document.getElementById('terms-error').textContent = "Required";
                            isValid = false;
                        }


                         return isValid;

                    }

            form_1_next_btn.addEventListener("click", function() {

                if (validateForm1()) {
                    form_1.style.display = "none";
                    form_2.style.display = "block";

                    form_1_btns.style.display = "none";
                    form_2_btns.style.display = "flex";

                    form_2_progessbar.classList.add("active");
                    form_1.classList.remove("active");
                }
            });

            form_2_back_btn.addEventListener("click", function() {
                form_1.style.display = "block";
                form_2.style.display = "none";

                form_1_btns.style.display = "flex";
                form_2_btns.style.display = "none";

                form_2_progessbar.classList.remove("active");
                form_1.classList.add("active");
            });

            form_2_next_btn.addEventListener("click", function() {
                if (validateForm2()) {
                    form_2.style.display = "none";
                    form_3.style.display = "block";

                    form_2_btns.style.display = "none";
                    form_3_btns.style.display = "flex";

                    form_3_progessbar.classList.add("active");
                    form_2.classList.remove("active");
                }
            });

            form_3_back_btn.addEventListener("click", function() {
                form_2.style.display = "block";
                form_3.style.display = "none";

                form_2_btns.style.display = "flex";
                form_3_btns.style.display = "none";

                form_3_progessbar.classList.remove("active");
                form_2.classList.add("active");
            });

            form_3_next_btn.addEventListener("click", function() {
               if (validateForm3()) {
                    form_2.style.display = "none";
                    form_3.style.display = "none";
                    form_4.style.display = "block";

                    form_2_btns.style.display = "none";
                    form_4_btns.style.display = "flex";

                }
            });

            form_4_back_btn.addEventListener("click", function() {
                form_3.style.display = "block";
                form_4.style.display = "none";

                form_3_btns.style.display = "flex";
                form_4_btns.style.display = "none";

            });

            form_4_next_btn.addEventListener("click", function() {
                if(validateForm4()) {

                    var syllabus = document.getElementById("syllabus").value;

                    if(syllabus === "Other"){

                    modal_wrapper.classList.add("active");
                    shadow.addEventListener("click", function() {
                        modal_wrapper.classList.remove("active");
                    });

                    const allData = combineFormData();

                    const dataToSend = {
                        ...allData
                    };

                            fetch('/other-booking', { // Replace with your actual endpoint URL
                                    method: 'POST',
                                    headers: { 
                                        'Content-Type': 'application/json' 
                                    },
                                    body: JSON.stringify(dataToSend)
                                })
                                .then(response => response.json())
                                .then(result => {
                                
                                    setTimeout(function(){
                                            window.location.href = '/';
                                        } , 2000);

                                        
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                    // Optionally handle error response
                                });

                    setTimeout(function(){
                        window.location.href = '/';
                    } , 2000);

                    }

                  else{


                    form_3.style.display = "none";
                    form_4.style.display = "none";
                    form_5.style.display = "block";

                    form_4_btns.style.display = "none";
                    form_5_btns.style.display = "flex";

                  }

                }
            });

            form_5_back_btn.addEventListener("click", function() {
                form_4.style.display = "block";
                form_5.style.display = "none";

                form_4_btns.style.display = "flex";
                form_4_btns.style.display = "flex";

            });

						
        });


        document.getElementById("student-info").style.display = 'none';
        document.getElementById("year-selection-container").style.display='none';
        document.getElementById("in-person-teaching").style.display='none';
      
           function studentInfo(){

            document.getElementById("student-info").style.display = 'block';
            document.getElementById("year-selection-container").style.display='none';

           }

           function vasityInfo(){
            document.getElementById("year-selection-container").style.display='block';
            document.getElementById("student-info").style.display = 'none';
        
           }

        function inPersonInfo(){

          document.getElementById("in-person-teaching").style.display = 'block';
           
         }

         function onlineInfo(){

                document.getElementById("in-person-teaching").style.display = 'none';
                
                }

		/*var modal = document.getElementById("modal");
        var btn = document.getElementById("open-popup");*/

		function openOpenopen(name, email, subjects, grades , subsub) {

            if(subjects === undefined){

                const syll = "CAPs,IEB,Cambridge,IB,Pearson Edexcel";
                const syllabusArray = syll.split(',').map(item => item.trim());

                const syllabi = syllabusArray.map(item => {
                        return { value: item, text: item };
                    });

                const syllabusSelect = document.getElementById('syllabus');

                while (syllabusSelect.options.length > 1) {

                    const secondOption = syllabusSelect.options[1];

                    // Check if the second option exists and remove it
                    if (secondOption) {
                        syllabusSelect.remove(1); // Remove the second option
                    } else {
                        break; // Exit the loop if no second option exists
                    }
                }


                syllabi.forEach(syllabus => {
                    const option = document.createElement('option');
                    option.value = syllabus.value;
                    option.textContent = syllabus.text;

                    syllabusSelect.appendChild(option);

                });
                            
            }
           else{
            const syllabusArray = subjects.split(',').map(item => item.trim());

            const syllabi = syllabusArray.map(item => {
                    return { value: item, text: item };
                });

                const syllabusSelect = document.getElementById('syllabus');

                while (syllabusSelect.options.length > 1) {

                    const secondOption = syllabusSelect.options[1];

                    // Check if the second option exists and remove it
                    if (secondOption) {
                        syllabusSelect.remove(1); // Remove the second option
                    } else {
                        break; // Exit the loop if no second option exists
                    }
                }


                syllabi.forEach(syllabus => {
                    const option = document.createElement('option');
                    option.value = syllabus.value;
                    option.textContent = syllabus.text;

                    syllabusSelect.appendChild(option);

                });

           }

           /*Grades Start Here*/

           if(grades === undefined){

                    const grd = "GRD:1,GRD:2,GRD:3,GRD:4,GRD:5,GRD:6,GRD:7,GRD:8,GRD:9,GRD:10,GRD:11,GRD:12";
                    const gradesArray = grd.split(',').map(item => item.trim());

                    const gr = gradesArray.map(item => {
                            return { value: item, text: item };
                        });

                    const gradesSelect = document.getElementById('grade');

                    while (gradesSelect.options.length > 0) {

                        const secondOption = gradesSelect.options[0];

                        // Check if the second option exists and remove it
                        if (secondOption) {
                            gradesSelect.remove(0); // Remove the second option
                        } else {
                            break; // Exit the loop if no second option exists
                        }
                    }


                    gr.forEach(gradee => {
                        const option = document.createElement('option');
                        option.value = gradee.value;
                        option.textContent = gradee.text;

                        gradesSelect.appendChild(option);

                    });
                                
                    }
                        else{
                            const gradesArray = grades.split(',').map(item => item.trim());

                            const gr = gradesArray.map(item => {
                                                    return { value: item, text: item };
                                                });

                                                const gradesSelect = document.getElementById('grade');

                        while (gradesSelect.options.length > 0) {

                            const secondOption = gradesSelect.options[0];

                            // Check if the second option exists and remove it
                            if (secondOption) {
                                gradesSelect.remove(0); // Remove the second option
                            } else {
                                break; // Exit the loop if no second option exists
                            }
                        }


                            gr.forEach(gradee => {
                                const option = document.createElement('option');
                                option.value = gradee.value;
                                option.textContent = gradee.text;

                                gradesSelect.appendChild(option);

                            });

                            }

           /*Grades End Here*/

           /*Subects Start Here*/

           const defaultSubjects = "Mathematics, Mathematics Literacy, Biology, Chemistry,Physics,Life Sciences,Physical Sciences,Combined Science,Natural Science,Social Sciences,Technonology";
    const subjectsArray = (subsub || defaultSubjects).split(',').map(item => item.trim());
    
    const subjectContainer = document.getElementById('subjectContainer');
    
    // Clear existing checkboxes
    subjectContainer.innerHTML = '';

    subjectsArray.forEach(subject => {
        const label = document.createElement('label');
        label.style.display = 'inline'; // Make each label take up a new line

        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.value = subject;
        checkbox.onchange = updateSubjects; // Assuming updateSubjects is defined elsewhere

        // Set the label text
        label.textContent = subject; // Set the text for the label

        // Append checkbox to label and label to container
        label.prepend(checkbox); // Add checkbox before the label text
        subjectContainer.appendChild(label);
    });

           /*Subects End Here*/

            const button = document.getElementById('tutorBtn');
            const directTutors = document.querySelectorAll('.directTutor');
            const otherOption = document.getElementById('other-option');

            if (event.target === button) {
                // The button was clicked
                directTutors.forEach(tutor => {
                    tutor.textContent = 'BOOK A PERSONALIZED TUTOR';
                });
                otherOption.style.display = 'block'; // Show the "Other" option

                

            } else {
                directTutors.forEach(tutor => {
                    tutor.textContent = 'Book ' + name + ' for Tutoring!';
                });
                otherOption.style.display = 'none'; // Hide the "Other" option
                document.querySelector("#syllabus option:first-child").textContent = "";
            }

			document.getElementById("modal").style.display = 'block';
			var span = document.getElementById("close-popup");

			var tutorName = document.getElementById('hiddenTutorName');
			tutorName.value = name;

			var tutorEmail = document.getElementById('hiddenTutorEmail');
			tutorEmail.value = email;

			span.onclick = function() {
            modal.style.display = "none";
            }

			window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
         }

		}

		function formDataToObject(formData) {
    const data = {};
    formData.forEach((value, key) => {
        // Handle multiple values for the same key
        if (data[key]) {
            // If value is already an array, push the new value
            if (Array.isArray(data[key])) {
                data[key].push(value);
            } else {
                // Convert existing value to an array and add new value
                data[key] = [data[key], value];
            }
        } else {
            data[key] = value;
        }
    });
    return data;
}

function combineFormData() {

    const form1 = document.getElementById('contact-form');
    const form2 = document.getElementById('additional-form');
    const form3 = document.getElementById('submit-form');
    const form4 = document.getElementById('formFour');

    const form1Data = new FormData(form1);
    const form2Data = new FormData(form2);
    const form3Data = new FormData(form3);
    const form4Data = new FormData(form4);

    const data1 = formDataToObject(form1Data);
    const data2 = formDataToObject(form2Data);
    const data3 = formDataToObject(form3Data);
    const data4 = formDataToObject(form4Data);

    // Combine all data into a single object
    return { ...data1, ...data2, ...data3, ...data4,};
}



document.addEventListener('DOMContentLoaded', (event) => {
    // Get the buttons by their IDs
    const onceOffButton = document.getElementById('onceOffPackage');
    const basicButton = document.getElementById('basicPackage');
    const premiumButton = document.getElementById('premiumPackage');
    const advancedButton = document.getElementById('advancedPackage');
    const eliteButton = document.getElementById('elitePackage');

    // Function to handle button clicks
    function handleButtonClick(event) {
        // Get the ID of the button that was clicked
        const buttonId = event.target.id;

        var tutoring = document.querySelector('input[name="tutor-style"]:checked');
        var ghg = tutoring ? tutoring.value : 'None';
        var syllabusId = document.getElementById('syllabus').value;
  
        // You can use a switch statement or if-else logic to handle specific buttons
        switch (buttonId) {
            case 'onceOffPackage':
            alert('Once Off Package selected');
            var amountTopay;

            if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
                 amountTopay = '300'; // amount to pay;
               }
               else{

               if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                       
                       amountTopay = '400'; // amount to pay;

               }

               else{

                if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){

                        amountTopay = '400'; // amount to pay;

                        }

                        else{

                            if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                       
                                    amountTopay = '550'; // amount to pay;
                
                                }

                        }

               }

            }

                const allData = combineFormData();

                const dataToSend = {
                    ...allData, // Spread the existing data
                    amount: amountTopay // Add the buttonId
                };

                fetch('/booking', { // Replace with your actual endpoint URL
								method: 'POST',
								headers: { 
									'Content-Type': 'application/json' 
								},
								body: JSON.stringify(dataToSend)
							})
							.then(response => response.json())
							.then(result => {
							
								// Optionally show success message or handle response
							})
							.catch(error => {
								console.error('Error:', error);
								// Optionally handle error response
							});

                            setTimeout(function(){
                        window.location.href = '/payment';
                    } , 2000);

                break;
            case 'basicPackage':
                alert('Basic Package selected');

                var amountTopay;

                if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
                 amountTopay = '1100'; // amount to pay;
                  }
                  else{
                  if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                      amountTopay = '1550'; // amount to pay;

                  }

                  else{

                    if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){

                        amountTopay = '1550'; // or button.innerHTML = 'Submit';

                        }
                        else{

                            if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                            amountTopay = '2150'; // amount to pay;
                  }

                            
                        }
                  }

                }

                const all = combineFormData();

                const ToSend = {
                    ...all, // Spread the existing data
                    amount: amountTopay // Add the buttonId
                };

                fetch('/booking', { // Replace with your actual endpoint URL
								method: 'POST',
								headers: { 
									'Content-Type': 'application/json' 
								},
								body: JSON.stringify(ToSend)
							})
							.then(response => response.json())
							.then(result => {
								
								// Optionally show success message or handle response
							})
							.catch(error => {
								console.error('Error:', error);
								// Optionally handle error response
							});

                            setTimeout(function(){
                        window.location.href = '/payment';
                    } , 2000);

                break;
            case 'premiumPackage':
                alert('Premium Package selected');

                var amountTopay;

                if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
                amountTopay = '2150'; // amount to pay;
                }
                else{
                    if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                       amountTopay = '3100'; // amount to pay;
                }

                else{

                    if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){

                            amountTopay = '3100'; // amount to pay;

                            }
                            else{

                                if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                       amountTopay = '4300'; // amount to pay;
                }

             }

                }

                }

                const dataall = combineFormData();

                const ToSendData = {
                    ...dataall, // Spread the existing data
                    amount: amountTopay // Add the buttonId
                };

                fetch('/booking', { // Replace with your actual endpoint URL
								method: 'POST',
								headers: { 
									'Content-Type': 'application/json' 
								},
								body: JSON.stringify(ToSendData)
							})
							.then(response => response.json())
							.then(result => {
								
								// Optionally show success message or handle response
							})
							.catch(error => {
								console.error('Error:', error);
								// Optionally handle error response
							});

                            setTimeout(function(){
                        window.location.href = '/payment';
                    } , 2000);

                break;
            case 'advancedPackage':
                alert('Advanced Package selected');

                var amountTopay;

                if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
                 amountTopay = '3250'; // amount to pay;
                  }
                  else{
                    if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                     amountTopay = '4650'; // amount to pay;
                  }

                  else{
                    if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){
                   amountTopay = '4650'; // amount to pay;
                  }
                  else{

                    if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                       amountTopay = '6350'; // amount to pay;
                      }

                  }

                  }

                  }

                const data = combineFormData();

                const sendData = {
                    ...data, // Spread the existing data
                    amount: amountTopay // Add the buttonId
                };

                fetch('/booking', { // Replace with your actual endpoint URL
                                method: 'POST',
                                headers: { 
                                    'Content-Type': 'application/json' 
                                },
                                body: JSON.stringify(sendData)
                            })
                            .then(response => response.json())
                            .then(result => {
                                
                                // Optionally show success message or handle response
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                // Optionally handle error response
                            });

                            setTimeout(function(){
                        window.location.href = '/payment';
                    } , 2000);


                break;
            case 'elitePackage':
               alert('Elite Package selected');

               var amountTopay;

                if(ghg === "Online" && syllabusId === "IEB" || syllabusId === "CAPs"){
                amountTopay = '4350'; // amount to pay;
                }
                else{
                    if(ghg === "Online" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                    amountTopay = '6200'; // or button.innerHTML = 'Submit';

                    }
                    else{

                        if(ghg === "In Person" && syllabusId === "IEB" || syllabusId === "CAPs"){
                        amountTopay = '6200'; // or button.innerHTML = 'Submit';

                            }
                            else{

                                if(ghg === "In Person" && syllabusId === "Cambridge" || syllabusId === "IB" || syllabusId === "Pearson Edexcel" ){
                      amountTopay = '8500'; // or button.innerHTML = 'Submit';

                   }

                            }
                    }

                }

                const gatherData = combineFormData();

                const dataSend = {
                    ...gatherData, // Spread the existing data
                    amount: amountTopay // Add the buttonId
                };

                fetch('/booking', { // Replace with your actual endpoint URL
                                method: 'POST',
                                headers: { 
                                    'Content-Type': 'application/json' 
                                },
                                body: JSON.stringify(dataSend)
                            })
                            .then(response => response.json())
                            .then(result => {
                                
                                // Optionally show success message or handle response
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                // Optionally handle error response
                            });

                            setTimeout(function(){
                        window.location.href = '/payment';
                    } , 2000);

                break;
            default:
                console.log('Unknown button clicked');
        }
    }

    // Add click event listeners to the buttons
    onceOffButton.addEventListener('click', handleButtonClick);
    basicButton.addEventListener('click', handleButtonClick);
    premiumButton.addEventListener('click', handleButtonClick);
    advancedButton.addEventListener('click', handleButtonClick);
    eliteButton.addEventListener('click', handleButtonClick);

});


function openPopup(email) {
    fetch('/view-profile', {
        method: 'POST',
        headers: { 
            'Content-Type': 'application/json' 
        },
        body: JSON.stringify({ email: email })
    })
    .then(response => {
        if (response.ok) {
            // Redirect to profile page after successful response
            window.location.href = '/profile'; // Adjust the path as needed
        } else {
            throw new Error('Network response was not ok');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });

}

function toggleSubjectOptions() {
    const container = document.getElementById('subjectContainer');
    container.style.display = container.style.display === 'none' ? 'block' : 'none';
}

function updateSubjects() {
    const checkboxes = document.querySelectorAll('#subjectContainer input[type="checkbox"]');
    const selectedSubjects = [];
    
    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
            selectedSubjects.push(checkbox.value);
        }
    });
    
    document.getElementById('subject').value = selectedSubjects.join(', ');
}






    </script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!--=============== SWIPER JS ===============-->
    <script src="swiper-bundle.min.js"></script> 

    <!--=============== MAIN JS ===============-->
     <script src="main.js"></script> 


</body>
</html>
