 <!-- Main part :: Start -->
        <%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<div class="main_part_area fix">
            <div class="container">
                <div class="main_part">
                    
                    <div class="row">
                        
                        <div class="col-md-8">
                            
                            <div class="recent_blog">
                                
                                <div class="recent_blog_small_title">
                                    <p>Recent post</p>
                                </div>
                                <%
			                    	try{ 
			                    		
									Connection connection = (Connection)application.getAttribute("MyConn");
									Statement statement=connection.createStatement();
									String sql ="SELECT * FROM onp_news where permission='Yes'";
									
									ResultSet resultSet = statement.executeQuery(sql);
									while(resultSet.next()){
			                    %>
                                
                                <!-- Recent post :: Start -->
                                
                                <div class="recent_post fix">
                                    <h1><%=resultSet.getString("title") %></h1>
                                    
                                    <img src="GetImage?title=<%=resultSet.getString("title") %>" alt="image">
                                    <p class="post_by">Posted by <%=resultSet.getString("username") %> on <%=resultSet.getString("date") %> </p>
                                    <p class="post_summary">
                                    <%
			                        	String detail = resultSet.getString("details");
			                        	detail = detail.substring(0, 300);
			                        	detail= detail+" . . .";
			                        %>
                                    	<%=detail %>
                                     </p>
                                    
                                    <a href="post_view.jsp?title=<%=resultSet.getString("title") %>">Read More</a>
                                    
                                </div>
                                <% 
								}
								
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
                                
                                <!-- Recent post :: End -->
                                
                                
                              
                                
                            </div>
                        </div>