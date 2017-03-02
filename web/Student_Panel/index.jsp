<%-- 
    Document   : index
    Created on : Dec 29, 2016, 10:29:11 AM
    Author     : Conseptify
    Check 
        if Already Login then Continue on page
        if no login redirect to login required page
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if( session == null )                                   // If there is no session for that user
    {
        response.sendRedirect("login/");
        return;
    }
    // If there is any session for that user then validate the session
    String requestIP = request.getRemoteAddr();
    String sessionEmail_id = (String)session.getAttribute("email_id");
    String sessionRole = (String)session.getAttribute("role");
    String sessionIP = (String)session.getAttribute("client_ip");

    if( sessionEmail_id == null || !sessionRole.equals("student") ||  !sessionIP.equals(requestIP) )
    {
        response.sendRedirect("login/");
        return;
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Panel</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    </head>
    <body>
        <%@include file="/HeaderHTML.html" %>
        
        <div class="container" style="min-height: 800px;">
            <div class="col-md-6">
                <div class="col-data" style="min-height: 100px;background-color: rgba(0,0,0,0.7);">
                    <a href="/Student_Panel/reports/"> <p class="text-center" style="font-size: 50px;">Reports</p> </a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="col-data" style="min-height: 100px;background-color: rgba(0,0,0,0.7);">
                    <a href="/Student_Panel/reports/"> <p class="text-center" style="font-size: 50px;">Assessment</p> </a>
                </div>
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