<%-- 
    Document   : index
    Created on : Dec 29, 2016, 10:29:11 AM
    Author     : Conseptify
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@ include file="index_HTML.html" %>

<%
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

    if( sessionEmail_id == null || !sessionRole.equals("management") ||  !sessionIP.equals(requestIP) )
    {
        response.sendRedirect("error/login_required.html");
        return;
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Management Panel</title>
    </head>
    <body>
<!--        <div style="font-size: 0px">  
                (String)session.getId() 
            </div> -->
  
    </body>
</html>