/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user;

import com.connection.mysql.MySqlConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Conseptify
 */
public class signup extends HttpServlet 
{

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
        String fname = (String) request.getParameter("fname");
        String mname = (String) request.getParameter("mname");
        String lname = (String) request.getParameter("lname");
        String dob = (String) request.getParameter("dob");
        String contact_no = (String) request.getParameter("contact_no");
        String gender  = (String) request.getParameter("gender");
        String email_id = (String) request.getParameter("email_id");
        String password = (String) request.getParameter("password");
        //System.out.println("Signup Called");
       
        try
        {
            MySqlConnection.init();
            Connection con = MySqlConnection.createConnection(3);
            
            Statement stmt = con.createStatement();
            stmt.execute("INSERT INTO `student_profiles` VALUES ( '"+ email_id +"','"+ fname +"','"+ lname +"','"+ gender +"','"+ contact_no +"','"+ dob +"')"); 
            stmt.execute("INSERT INTO `student_credentials` VALUES ( '"+ email_id +"','"+ password +"')"); 
            MySqlConnection.closeConnection(con);
            response.sendRedirect("signup_success.html");
        }
        catch( SQLException | IOException e )
        {
            System.out.println( e );
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
