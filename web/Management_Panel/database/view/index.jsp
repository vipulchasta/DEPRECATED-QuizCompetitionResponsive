<%-- 
    Document   : index
    Created on : Jan 18, 2017, 4:04:14 PM
    Author     : Conseptify
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.mysql.MySqlConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question</title>
        <style>
            table 
            {
                font-family: arial, sans-serif;
                width: 100%;
            }
            td, th 
            {
                border: 1px solid #000000;
                text-align: left;
                padding: 8px;
                color: white;
            }
            #myContent
            {
                position: absolute;
                top: 340px;
                left: 230px;
                z-index: 20;
                height: 900px;
                width: 880px;
            //    background-color: red;
            }
        </style>
    </head>
    <body>
        <%@include file="index_HTML.html" %>
        <div id="myContent">
            <%
                out.print("<table>");
                out.print("<tr>");
                    out.print("<th>Question Id</th>");
                    out.print("<th>Question</th>");
                    out.print("<th>Option A</th>");
                    out.print("<th>Option B</th>");
                    out.print("<th>Option C</th>");
                    out.print("<th>Option D</th>");
                    out.print("<th>Currect Ans</th>");
                out.print("</tr>");                
                MySqlConnection.init();
                Connection con = MySqlConnection.createConnection(2);                
                Statement st = con.createStatement();
                String query = "SELECT * FROM `aptitude_question_set` WHERE 1";
                ResultSet rs = st.executeQuery(query);
                while( rs.next() )
                {
                    out.print("<tr>");
                    for( int i = 1 ; i <= 7 ; i++ )
                    {
                        out.print("<td>");
                        out.print(rs.getString(i));
                        out.print("</td>");
                    }
                    out.print("</tr>");
                }
                out.print("</table>");
            %>
        </div>
    </body>
</html>
