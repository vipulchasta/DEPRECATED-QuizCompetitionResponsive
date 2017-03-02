<%-- 
    Document   : asessment
    Created on : Dec 29, 2016, 10:37:45 AM
    Author     : Conseptify
    Check 
        if Already Logged in then
            if user has not taken assessment then Continue on page
            else redirect to assessment already taken page
        if not logged in then redirect to login required page
    
--%>

<%@page import="com.connection.mysql.MySqlConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    /*
    if( session == null )                                   // If there is no session for that user
    {
        response.sendRedirect("error/login_required.html");
        return;
    }
    // If there is any session for that user then validate the session
    String requestIP = request.getRemoteAddr();
    String sessionEmail_id = (String)session.getAttribute("email_id");
    String sessionRole = (String)session.getAttribute("role");
    String sessionIP = (String)session.getAttribute("client_ip");

    if( sessionEmail_id == null || !sessionRole.equals("student") ||  !sessionIP.equals(requestIP) )
    {
        response.sendRedirect("error/login_required.html");
        return;
    }
    */
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assessment</title>
    </head>
    
    <body>
    <%@include file="../HeaderHTML.html" %>
        <div style=" text-align:left;font-size:15px;position:absolute;left:250px;top:370px;width:850px;height:900px;z-index:20;">
            <form action="assessment_submission.do" method="post">
            <%
                MySqlConnection.init();
                Connection con = MySqlConnection.createConnection(2);
                Statement st = con.createStatement();

                int i = 1;
                while( i <= 6 )
                {
                    
                    rs.next();
                    int maxQuestions = rs.getInt(1);
                    rs = st.executeQuery("SELECT * FROM `aptitude_question_set`;");
                    out.print("<h3>Aptitude Questions</h3><br>");
                    while( i <= 2 )
                    {
                        
                        rs.next();
                        {
                            out.println(i+">");
                            out.println( rs.getString(2) + "<br>");
                            out.print("(A) ");
                            out.println( rs.getString(3) + "<br>");
                            out.print("(B) ");
                            out.println( rs.getString(4) + "<br>");
                            out.print("(C)  ");
                            out.println( rs.getString(5) + "<br>");
                            out.print("(D) ");
                            out.println( rs.getString(6) + "<br>");
                            out.print(" a <input type='radio' name='q"+i+"' value='1'> ");
                            out.print(" b <input type='radio' name='q"+i+"' value='2'> ");
                            out.print(" c <input type='radio' name='q"+i+"' value='3'> ");
                            out.print(" d <input type='radio' name='q"+i+"' value='4'> <br><br>");
                            out.print("<input type='hidden' name='ans"+i+"' value='"+rs.getString(7)+"'<br>");
                            i++;
                        }
                    }
                    
                    
                    rs = st.executeQuery("SELECT max(`question_id`) FROM `generalknowledge_question_set`;");
                    rs.next();
                    int maxQuestions = rs.getInt(1);
                    int randomQuestionId = (int )(Math.random() * maxQuestions + 1);                   //Min-1 Max-5
                    rs = st.executeQuery("SELECT * FROM `generalknowledge_question_set` WHERE question_id =  "+ randomQuestionId);
                    out.print("<h3>General Knowledge Questions</h3><br>");
                    
                    
                    while( i <= 4 )
                    {
                        
                    }

                    rs = st.executeQuery("SELECT max(`question_id`) FROM `verbal_question_set`;");
                    rs.next();
                    maxQuestions = rs.getInt(1);
                    randomQuestionId = (int )(Math.random() * maxQuestions + 1);                   //Min-1 Max-5
                    rs = st.executeQuery("SELECT * FROM `verbal_question_set` WHERE question_id =  "+ randomQuestionId);
                    out.print("<h3>Verbal Questions</h3><br>");
                    
                    while( i <= 6 )
                    {
                    }
                }

                out.print("<input type='submit' value='submit'>");


                MySqlConnection.closeConnection(con);
            %>

            </form>
        </div>
    <%@include file="../FooterHTML.html" %>
    </body>
</html>