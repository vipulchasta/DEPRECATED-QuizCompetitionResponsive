/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.management;

import com.connection.mysql.MySqlConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
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
public class Login extends HttpServlet 
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
        String email_id = (String)request.getParameter("email_id");
        String password = (String)request.getParameter("password");
        
        MySqlConnection.init();
        
        Connection con = MySqlConnection.createConnection(1);
        try 
        {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT password FROM management_credentials WHERE email_id='"+email_id+"'");

            String dbUserPassword="";
            boolean userFound = false;
            
            if( rs.next() )
            {   
                userFound = true;
                dbUserPassword = rs.getString(1);
            }
            
            MySqlConnection.closeConnection(con);            
            if( userFound == true )
            {
                if( dbUserPassword.equals(password))
                {
                    HttpSession session = request.getSession();
                    session.setAttribute("email_id", email_id );
                    session.setAttribute("role", "management" );
                    session.setAttribute("client_ip", request.getRemoteAddr() );
                    response.sendRedirect("../index.jsp");
                }
                else
                    response.sendRedirect("login_password_error.html");
            }
            else
                response.sendRedirect("login_id_error.html");

        } 
        catch (SQLException ex) 
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
