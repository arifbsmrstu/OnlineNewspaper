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
        <title>Online Newspaper</title>
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
        
        
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

       
	   
	  <!--Starting point of My Code||||||||||||||||||||||||||||||||-->
        
        
        <!--===========================================-->
        <!--                Header-top:START           -->
        <!--===========================================-->
        
        
        
        
        <div class="header_top_area">
            <div class="container">
                <div class="header_top">
                		
                    <div class="row">
                        
                        <div class="col-md-7">
                            <ul class="top_head_left_nav">
                                
                               
                                <li><a href="">Blog</a></li>
                                <li><a href="">Forums</a></li>
                                <li><a href="">Contact</a></li>
                            </ul>
                        </div>
                        
                        <div class="col-md-5">
                            <ul class="top_head_right_nav">
                                <li><a href=""><i class="fa fa-facebook" aria-hidden="true"></i>
                                <li><a href=""><i class="fa fa-twitter" aria-hidden="true"></i>
                                <li><a href=""><i class="fa fa-google-plus" aria-hidden="true"></i>
                                <li><a href=""><i class="fa fa-youtube" aria-hidden="true"></i></li>
                                <li><a href="Logout">Logout</i></li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!--===========================================-->
        <!--                Header-end:End             -->
        <!--===========================================-->
                    
        <!--===========================================-->
        <!--                Logo:End                   -->
        <!--===========================================-->
                    
        <div class="logo-area fix">
            <div class="container">
                <div class="logo_p">
                    <h1>Online<strong>N</strong>ewspaper</h1>
                    <p><strong>Update</strong> yourself</p>
                </div>
            </div>
        </div>
                    
        <!--===========================================-->
        <!--                Logo:End                   -->
        <!--===========================================-->
        
      <%@ include file="inc/menu.jsp" %>
      
	      <div class="view_area fix">
	      	<div class="container">
	      	
	      	<%
			       try{ 
			    	   
			       		String title = request.getParameter("title");
			       		System.out.println("Hi "+title);
						Connection connection8 = (Connection)application.getAttribute("MyConn");
						Statement statement8=connection8.createStatement();
						String sql ="SELECT * FROM onp_news where title='"+title+"'";
									
						ResultSet resultSet8 = statement8.executeQuery(sql);
						while(resultSet8.next()){
			 %>
	      		<div class="post_view">
	      		
	      				<div class="post_title_view">
	      					<h3><u>News<br/></u><%=resultSet8.getString("title") %></h3>
	      				</div>
	      				
	      				<div class="post_image_view">
	      					<img src="GetImage?title=<%=resultSet8.getString("title") %>" alt="image">
	      				</div>
	      				
	      				<div class="post_title_view">
	      					<h4><u>Posted by <%=resultSet8.getString("username") %></u></h4>
	      				</div>
	      				
	      				<div class="post_detail_view">
	      					<p><%=resultSet8.getString("details") %>
	      					</p>
	      				</div>
	      		
	      		</div>
	      		
	      		<% 
								}
								
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
	      	</div>
	      </div>
      
      
     <%@ include file="inc/most_read_news.jsp" %>
     <%@ include file="inc/footer.jsp" %>