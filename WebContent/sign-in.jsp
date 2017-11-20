<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>TheME_BD</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

         <!-- All CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">		
        <link rel="stylesheet" href="css/owl.carousel.css">		
        <link rel="stylesheet" href="css/owl.theme.default.min.css">		
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/reponsive.css">
        
         <!-- For google font -->
        <link href='https://fonts.googleapis.com/css?family=Roboto:300italic,400italic,500italic,700,900,400,500' rel='stylesheet' type='text/css'>
        
        
         <!-- SMOOTH SCROLL -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
            <script>
            $(function() {
              $('a[href*=#]:not([href=#])').click(function() {
                if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
                  var target = $(this.hash);
                  target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                  if (target.length) {
                    $('html,body').animate({
                      scrollTop: target.offset().top
                    }, 1000);
                    return false;
                  }
                }
              });
            });
            </script>
        <!-- End of SMOOTH SCROLL -->
        
        
    </head>
      
	
	
	<body>    
     
     <!--     sign-in form -->
     
     <!-- For session check -->
        <%
        	if(null != session.getAttribute("username")){
        		response.sendRedirect("home.jsp");
        	}
        %>
        
        <div class="input_area">
            
            <div class="container">
            
            	<div class="logo_p">
                    <h1>Online<strong>N</strong>ewspaper</h1>
                    <p><strong>Update</strong> yourself</p>
                </div>
                
                <div class="input_a">
                
                <form id="input_form" autocomplete="on" action="Login" method="post">
                    
                    <input id="email" type="email" placeholder="Email" name="email">
                    <input id="password" type="password" placeholder="Enter your password" name="password">
                
                    
                    <button class="send-btn" type="submit">Sign In</button>
                    <h5 class="sign_up_link">Or <a href="sign-up.jsp">Sign Up</a></h5>
                    
                    
                </form>
                    
                    
                </div>
               </div> 
            </div>
     
     </body>
     </html>