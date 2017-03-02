<%-- 
    Document   : asessment
    Created on : Dec 29, 2016, 10:37:45 AM
    Author     : Conseptify

    if Already Login then Continue on page
    if no login redirect to login required page

    Show Only those Assessment results which are taken by the same user
--%>


<%@page import="com.connection.mysql.MySqlConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    if( session == null )                                   // If there is no session for that user
        response.sendRedirect("../error/login_required.html");    
    // If there is any session for that user then validate the session
    String requestIP = request.getRemoteAddr();
    
    String sessionEmail_id = (String)session.getAttribute("email_id");
    String sessionRole = (String)session.getAttribute("role");
    String sessionIP = (String)session.getAttribute("client_ip");
    
    if( sessionEmail_id == null || !sessionRole.equals("student") ||  !sessionIP.equals(requestIP) )
    {
        response.sendRedirect("../error/login_required.html");
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assessment History</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    </head>
   
    
    <body>
        <%@include file="/HeaderHTML.html" %>    

        <div class="container" style="color: white;">
        <div class="col-md-12" style=" text-align: left; font-size:20px;">    
            <table class="table table-bordered table-hover table-responsive" >
                <%
                    MySqlConnection.init();
                    Connection con = MySqlConnection.createConnection(3);
                    Statement st = con.createStatement();

                    ResultSet rs = st.executeQuery( "SELECT * FROM assessment_allotment WHERE email_id = '"+sessionEmail_id+"'" );
                    out.println("For User ID = " + sessionEmail_id + "<br><br>");

                        out.println("<tr>");
                            out.println("<th>Assessment Id</th>");
                            out.println("<th>Email-ID</th>");
                            out.println("<th>Date</th>");
                            out.println("<th>Time</th>");
                        out.println("</tr>");
                        while( rs.next() )
                        {
                            out.print("<tr>");
                            out.println( "<td>" + rs.getString(1) + "</td>");
                            out.println( "<td>" + rs.getString(2) + "</td>");
                            out.println( "<td>" + rs.getString(3) + "</td>");
                            out.println( "<td>" + rs.getString(4) + "</td>");
                            out.println( "<td>" + rs.getString(5) + "</td>");
                            out.print("</tr>");
                        }

                    MySqlConnection.closeConnection(con);

                %>
            </table>
        </div>
    </div>
                <%@include file="/FooterHTML.html" %>
                
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="/js/bootstrap.min.js"></script>
    </body>
</html>
