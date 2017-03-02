/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assessment;

import com.connection.mysql.MySqlConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Conseptify
 */
public class assessment_submission extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        HttpSession session = request.getSession(false);
        {
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
        }
        
        MySqlConnection.init();
        
        String email_id = (String)session.getAttribute("email_id");
        try
        {
            
            int rightAns = 0;
            for( int i = 1 ; i <= 6 ; i++ )
            {
                String s = (String)request.getParameter("q"+i);
                int userAns=0;
                if( s!= null )
                    userAns = Integer.parseInt(s);
                s = (String)request.getParameter("ans"+i);
                int currectAns = Integer.parseInt(s);
                if( userAns == currectAns )
                    rightAns++;
            }
            
            int wrongAns = 6 - rightAns;
            Connection con = MySqlConnection.createConnection(3);
            Statement st = con.createStatement();
            st.execute("INSERT INTO `assessment_history` (email_id,date,time,rightAns,wrongAns) values ( '"+email_id+"',CURDATE(),CURTIME(),"+ rightAns +","+ wrongAns +") "); 
            response.sendRedirect("reports/");
        }
        catch( SQLException ex )
        {
            System.out.println(ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
