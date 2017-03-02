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



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leader Boards</title>
    </head>
    
    <%@include file="leader_board_HTML.html" %>
    <body>
        


<div style=" text-align: left; font-size:20px;position:absolute;left:250px;top:350px;width:700px;height:410px;z-index:20;">    
    <div style="text-align: center; font-size: 25px; color: white;">Last Five Submissions</div>
        <%
            MySqlConnection.init();
            Connection con = MySqlConnection.createConnection(3);
            Statement st = con.createStatement();
            
            ResultSet rs = st.executeQuery( "SELECT * FROM assessment_history ORDER BY `assessment_id` DESC" );
            
            out.println("<table style='width:100%'>");
                out.println("<tr>");
                    out.println("<th>User</th>");
                    out.println("<th>Date</th>");
                    out.println("<th>Time</th>");
                    out.println("<th>Exam ID</th>");
                    out.println("<th>Right</th>");
                    out.println("<th>Wrong</th>");
                out.println("</tr>");        
            int i = 1;
            while( rs.next() && i++<=5 )
            {
                out.println("<tr>");
                    out.println( "<td>"+rs.getString(1)+"</td>" );
                    out.println( "<td>"+rs.getString(2)+"</td>" );
                    out.println( "<td>"+rs.getString(3)+"</td>" );
                    out.println( "<td>"+rs.getString(4)+"</td>" );
                    out.println( "<td>"+rs.getString(5)+"</td>" );
                    out.println( "<td>"+rs.getString(6)+"</td>" );
                out.println("</tr>");
            }
            out.println("</table>");
        %>
        <div style="text-align: center; font-size: 25px; color: white;">Best Five Submissions</div>
        <%
            rs = st.executeQuery( "SELECT * FROM assessment_history ORDER BY `rightAns` DESC" );
            
            out.println("<table style='width:100%'>");
                out.println("<tr>");
                    out.println("<th>User</th>");
                    out.println("<th>Date</th>");
                    out.println("<th>Time</th>");
                    out.println("<th>Exam ID</th>");
                    out.println("<th>Right</th>");
                    out.println("<th>Wrong</th>");
                out.println("</tr>");        
            i = 1;
            while( rs.next() && i++<=5 )
            {
                out.println("<tr>");
                    out.println( "<td>"+rs.getString(1)+"</td>" );
                    out.println( "<td>"+rs.getString(2)+"</td>" );
                    out.println( "<td>"+rs.getString(3)+"</td>" );
                    out.println( "<td>"+rs.getString(4)+"</td>" );
                    out.println( "<td>"+rs.getString(5)+"</td>" );
                    out.println( "<td>"+rs.getString(6)+"</td>" );
                out.println("</tr>");
            }
            out.println("</table>");
        
            MySqlConnection.closeConnection(con);
            
        %>
</div>
    </body>
</html>
