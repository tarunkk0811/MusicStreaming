<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    <!--jQuery-->
    <script
      src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <!-- Bootstarp -->
    <link
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
      crossorigin="anonymous"
    />
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"
    ></script>
   
    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/bae75bb48f.js"></script>
    
    <!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    

<link rel="stylesheet" href="css/login-css.css">
<meta charset="ISO-8859-1">
<meta name="theme-color" content="#343a40">
<title>Signup here</title>
</head>
<body>



<%
response.setHeader("cache-control","no-cache, no-store, must-revalidate");//http 1.1
response.setHeader("Pragma","no-cache");//http 1.0
response.setHeader("Expires","0");//Proxies
if(session.getAttribute("uid")==null);
else
{
	response.sendRedirect("homepage.jsp");		
}
%>



<div class="background-wrap">
  <div class="background"></div>
</div>
<form id="accesspanel" name='signupform' action="ChangePassword" method="POST" style="height: 255px;">
  <h1 id="litheader">Music Streamer</h1>
  <div class="inset">

	<br><br>
    <p id='email'>
      <input autocomplete="off" type="text" required name="email" id="emailid" placeholder="Email address">
    </p>
   
    <p id='new' style="display:none;">
     <input autocomplete="off" type="text" required name="pass" id="pass" placeholder="New Password">
    </p>
    </p>
    <p id='con' style="display:none;">
     <input type="password" required name="conpass" id="conpass" placeholder="Confirm Password">
    </p>
      
    
    <p id='otp' style="display:none;">
      <input type="password" required name="otp" id="otpid" placeholder="Otp">
    </p>
    
    <p id='ins'>	
    </p>
  </div>
  
  
<%--      <% 
 if(request.getAttribute("message")!=null)
 {
  out.print("<center><p>"+request.getAttribute("message")+"</p></center>");
 }
   %>   --%>
   
   <center>
     <p id='message'>
     <%if(request.getAttribute("message")!=null){
     out.print(request.getAttribute("message"));
     }	 
   	  %> </p>
     
     </center>
    
   
  <p class="p-container" style="width:300px;" id="button">
    <input type="submit" form=""  name="Login" id="go" value="Send Otp"/>
    </p>
    
    <center>
     <p id='nwuser'> New User ? <a href='signup.jsp'>SignUp here</a></p>
     </center>
     
</form>

<script>

function sendotp(){
	
	
	//if(document.getElementById('name').innerText!="" &&  (document.getElementById('email').innerText!="") && (document.getElementById('password').innerText!="")){
		
	//	document.getElementById('accesspanel').style.height="235px";
	
		document.getElementById('ins').innerHTML="<button form='' id='resendotp'>Resend Otp</button>";
		
		document.getElementById('otp').style.display="block";
		
		document.getElementById('button').innerHTML= "<input type='submit' form='' name='verify' id='verify' value='Confirm Otp'>";
		
		document.getElementById('message').innerHTML="";
		
		document.getElementById('nwuser').innerHTML="";
		
		document.getElementById('accesspanel').style.height="300px";
	
	//}
}


function newpassword(){
	document.getElementById('email').style.display="none";
	document.getElementById('otp').style.display="none";
	document.getElementById('new').style.display="block";
	document.getElementById('con').style.display="block";
	document.getElementById('button').innerHTML= "<input type='submit' name='verify' id='verify' value='Change Password'>";
	document.getElementById('message').innerHTML="";
}


$(document).on("click", "#resendotp", function(e) {
	document.getElementById('message').innerHTML="";
    $.ajax({
    	method: 'post',
        url: 'ForgotPassword',
        data: {
            username:document.getElementById("emailid").value
        },
        success: function(responseText) {
           sendotp();
           $("#message").html("Otp sent");
        },
        error: function () {
        	$("#message").html("failed to send otp");
        
          }
    });


});



$(document).on("click", "#go", function(e) {
	document.getElementById('message').innerHTML="";
    $.ajax({
    	method: 'post',
        url: 'ForgotPassword',
        data: {
            username:document.getElementById("emailid").value
        },
        success: function(responseText) {
           sendotp();
           $("#message").html("otp sent");
        },
        error: function () {
        	$("#message").html("You are not a User please SignUp");
        
          }
    });


});


$(document).on("click", "#verify", function(e) {
	document.getElementById('message').innerHTML="";
	
    $.ajax({
    	method: 'post',
        url: 'VerifyUser',
        data: {
            username:document.getElementById("emailid").value,
            otp:document.getElementById("otpid").value
        },
        success: function(responseText) {
        	document.getElementById('ins').innerHTML= "";
        	newpassword();
        },
        error: function () {
        	$("#message").html("Incorrect Otp");
        
          }
    });

});


</script>


</body>
</html>