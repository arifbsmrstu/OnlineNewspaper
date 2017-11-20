<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userId");
%>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>OnlineNewspaper</title>
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
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

       
	   
	  <!--Starting point of My Code||||||||||||||||||||||||||||||||-->
	  
	  <!-- For session check -->
        <%
        	if(null == session.getAttribute("name")){
        		response.sendRedirect("admin-login.jsp");
        	}
        %>
        
        <div class="logo-area fix">
            <div class="container">
                <div class="logo_p">
                    <h1>Online<strong>N</strong>ewspaper</h1>
                    <p><strong>Update</strong> yourself</p>
                </div>
            </div>
        </div>
        
        
        
        <!--     sign-up form -->
        <%
						try{ 
							String title = request.getParameter("title");
							Connection connection=(Connection)application.getAttribute("MyConn");
							Statement statement=connection.createStatement();
							String sql ="SELECT * FROM onp_news WHERE title='"+title+"'";
							
							ResultSet resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
								String tit=resultSet.getString("title");
		%>
        
        <div class="input_area">
            
            <div class="container">
                
                <div class="input_a">
                
                <form id="input_form" autocomplete="on" action="EditPost" method="post" enctype="multipart/form-data">
                    
                    <input id="hidd" value="<%=tit %>" name="title">
                    
                     <select name="category">
					  <option value="Politics">Politics</option>
					  <option value="Sports">Sports</option>
					  <option value="World">World</option>
					  <option value="Entertainment">Entertainment</option>
					  <option value="Lifestyle">Lifestyle</option>
					</select> 
                    
                    
                    <textarea id="detail" name="detail"><%=resultSet.getString("details") %></textarea>
                    
                    <%
							}
						}
							 catch (Exception e) {
							e.printStackTrace();
							}
                    %>
                   
                    
                    <button class="send-btn" type="submit">Upload</button>
                    
                    
                    
                </form>
               </div> 
                </div> 
            </div>
            
        
        
         
	  
	  <!--Ending point of my code|||||||||||||||||||||||||||||||||||-->
            
            <!-- All javascript -->
	   
		<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-1.12.0.min.js"></script>
        <script src="js/isotope.pkgd.js"></script>
        <script src="js/main.js"></script>

       
    </body>
</html>
