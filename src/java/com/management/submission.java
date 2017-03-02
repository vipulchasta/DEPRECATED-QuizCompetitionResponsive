/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.management;

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
public class submission extends HttpServlet 
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
        String question_type = (String)request.getParameter("question_type");
        String question = (String)request.getParameter("question");
        String ans_a = (String)request.getParameter("ans_a");
        String ans_b = (String)request.getParameter("ans_b");
        String ans_c = (String)request.getParameter("ans_c");
        String ans_d = (String)request.getParameter("ans_d");
        String currect_ans = (String)request.getParameter("currect_ans");
        
        MySqlConnection.init();
        
        Connection con = MySqlConnection.createConnection(2);
        try 
        {
            String query = "INSERT INTO `"+question_type+"` (question,ans_a,ans_b,ans_c,ans_d,currect_ans) VALUES ('"+question+"','"+ans_a+"','"+ans_b+"','"+ans_c+"','"+ans_d+"', "+currect_ans+" )";
            Statement st = con.createStatement();
            st.execute(query);
            response.sendRedirect("submission_success.jsp");
        }
        
        catch (SQLException ex) 
        {
            System.out.print(ex);
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