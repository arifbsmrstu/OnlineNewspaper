
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
     
     
     <!--     sign-up form -->
        
        <div class="input_area">
            
            <div class="container">
            	<div class="logo_p">
                    <h1>Online<strong>N</strong>ewspaper</h1>
                    <p><strong>Update</strong> yourself</p>
                </div>
                
                <div class="input_a">
                
                <form  method="POST" action="register">
                    
                    <input id="name" type="text" placeholder="Enter your name" name="name">
                    <input id="email" type="text" name="email" placeholder="Enter your email">
                    <input id="password" type="text" name="password" placeholder="Enter your password">
                    <input id="conf_pass" type="text" name="conf_password" placeholder="Confirm password">
                    <button class="send-btn" type="submit">Sign Up</button>
                    
                </form>
               </div> 
                </div> 
            </div>
     
     
     </body>
     </html>
     
     