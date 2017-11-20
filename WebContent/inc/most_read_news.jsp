<!-- Most read : START -->
        <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<div class="blog_area">
            <div class="container">
                
                <!-- Common Header : Start -->
                <div class="common_header">
                    <h1>Most recent post</h1>
                    <span></span>
                </div>
                <!-- Common Header : End   -->
                
                
                
                <div class="blog fix">
                    <div class="row">
                        
                        <!-- Starting Pint of news_item -->
                        <%
					          try{ 
					        	  
					        	 Connection connection1=(Connection)application.getAttribute("MyConn");
								  Statement statement1=connection1.createStatement();
								String sql ="SELECT * FROM onp_news  where permission='Yes' ORDER BY view DESC limit 4";
											
								ResultSet resultSet1 = statement1.executeQuery(sql);
								while(resultSet1.next()){
					      %>
                        <div class="col-md-3">
                            <div class="blog_item fix">
                                
                                <img class="blog_image" src="GetImage?title=<%=resultSet1.getString("title") %>" alt="news">
                                
                                <div class="blog_details">
                                    <div class="blog_title">
                                        <h3><%=resultSet1.getString("title") %></h3>
                                        <span><i class="fa fa-calendar" aria-hidden="true"></i> 11 - 08 - 16 /  <i class="fa fa-comments-o" aria-hidden="true"></i>20</span>
                                    </div>
                                	
                                    <div class="short_blog">
                                        <%
			                        	String detail = resultSet1.getString("details");
			                        	detail = detail.substring(0, 200);
			                        	detail= detail+" . . .";
			                       		 %>
                                    	<%=detail %>
                                    </div>
                                    
                                    <div class="read_more">
                                        <a href="post_view.jsp?title=<%=resultSet1.getString("title") %>">Read More</a>
                                    </div>
                                    
                                </div>
                                 
                            </div>
                        </div>
                        
                        <% 
								}
								
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
                                
                        <!-- Ending Pint of news_item -->
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Most Read : END   -->   