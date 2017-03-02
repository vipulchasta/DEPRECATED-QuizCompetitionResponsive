/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.connection.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Conseptify
 */
public class MySqlConnection 
{
    static String dbClass = "com.mysql.jdbc.Driver";
    static String dbHost = "jdbc:mysql://sql8.freemysqlhosting.net/";
    //static String dbHost = "jdbc:mysql://localhost:3306/";
    static String dbUser = "sql8154726";
    static String dbPassword = "Ep4uwiUBwV";

    public static void init()
    {
        try 
        {
            Class.forName( dbClass );
        } 
        catch (ClassNotFoundException ex) 
        {
            System.out.println("Exception: " + ex );
        }
    }  
            
    public static Connection createConnection( int dbChoice )
    {   
        String dbName="";
        switch( dbChoice )
        {
            case 1:
//                dbName = "quiz_management";
                dbName = "sql8154726";
                break;
            case 2:
//                dbName = "quiz_question_set";
                dbName = "sql8154726";
                break;
            case 3:
//                dbName = "quiz_student";
                dbName = "sql8154726";
                break;
        }
        Connection con = null;
        try 
        {
            con = DriverManager.getConnection( dbHost + dbName , dbUser , dbPassword );
        }
        catch (SQLException ex) 
        {
            System.out.println(ex);
        }
        return con;
    }
    
    public static void closeConnection( Connection con )
    {
        try 
        {
            con.close();
        } 
        catch (SQLException ex) 
        {
            System.out.println(ex);
        }
    }
}