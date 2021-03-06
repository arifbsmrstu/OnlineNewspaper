<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Online Newspaper</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

         <!-- All CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">		
        <link rel="stylesheet" href="css/owl.carousel.css">		
        <link rel="stylesheet" href="css/owl.theme.default.min.css">		
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="admin-style.css">
        <link rel="stylesheet" href="css/reponsive.css">
        
         <!-- For google font -->
        <link href="https://fonts.googleapis.com/css?family=Spirax" rel="stylesheet"> <!-- font-family: 'Spirax', cursive; -->
        <link href="https://fonts.googleapis.com/css?family=News+Cycle" rel="stylesheet"> <!-- font-family: 'News Cycle', sans-serif; -->
        
        
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
        
        <!--Header section -->
        <div class="header_area">
            <div class="container">
                <div class="header">
                    <h1>Online Newspaper</h1>
                    <p>Admin pannel</p>
                    
                </div>
            </div>
        </div>
        
        
        <!-- Menu : Start -->
        <div class="menu_area fix">
            <div class="container">
                <div class="menu_b">
                <div class="row">
                    
                    <div class="col-md-7">
                        <nav>
                           <ul id="menu">
                               <li><a href="admin-index.jsp">HOME</a></li>
                               
                               <li><a href="admin.jsp">POST</a></li>
                               <li><a href="">CONTACT</a></li>
                           </ul>
                        </nav>
                    </div>
                    
                    <div class="col-md-5">
                        <nav>
                            
                           <ul id="menu_social">
                               <li><a class="aa" href=""><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                               
                               <li><a href=""><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                               <li><a href="AdminLogout">Logout</i></a></li>
                               
                           </ul>
                           
                        </nav>
                    </div>
                    
                </div>
                </div>
            </div>
        </div>
        <!-- Menu : End -->
        
        <div class="admin-post-area">
            <div class="container">
                <div class="admin-post">
                <%
				String id = request.getParameter("userId");
				%>
                
                    
                     <table style="width:100%" border="1">
                      <tr>
                        <th style="width:20%">title</th>
                        <th style="width:10%">category</th>
                        <th style="width:50%">detail</th>
                        <th style="width:5%">Publish</th>
                        <th style="width:15%">Action</th>
                      </tr>
                      
                      <%
						try{ 
						Connection connection15=(Connection)application.getAttribute("MyConn");
						Statement statement15=connection15.createStatement();
						String sql ="SELECT * FROM onp_news";
						
						ResultSet resultSet15 = statement15.executeQuery(sql);
							while(resultSet15.next()){
							%>
	                      <tr>
	                        <td><%=resultSet15.getString("title") %></td>
	                        <td><%=resultSet15.getString("category") %></td>
	                        <%
	                        	String detail = resultSet15.getString("details");
	                        	detail = detail.substring(0, 45);
	                        	detail= detail+" . . .";
	                        %>
	                        <td><%= detail %></td>
	                        <td><%=resultSet15.getString("permission") %></td>
	                        <td><a href="admin_edit.jsp?title=<%=resultSet15.getString("title") %>">Edit</a> | <a href="DeletePostAdmin?title=<%=resultSet15.getString("title") %>">Delete</a> | <a href="PostPublish?title=<%=resultSet15.getString("title") %>">publish</a></td>
	                      </tr>
	                      <% 
							}
						
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
                      
                    </table> 
                    
                </div>
            </div>
        </div>
        
        
        
        
        
        <Footer>
            <div class="footer_area">
                <div class="container">
                    <div class="footer_a">
                    <h3>&copy; Nothing, All Right Reserved</h3>
                    </div>
                </div>
            </div>
        </Footer>
        <!-- Most Read : END   -->

	  
	  
	  <!--Ending point of my code|||||||||||||||||||||||||||||||||||-->
            
            <!-- All javascript -->
	   
		<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/vendor/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-1.12.0.min.js"></script>
        <script src="js/isotope.pkgd.js"></script>
        <script src="js/main.js"></script>

       
    </body>
</html>
    