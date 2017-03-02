/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assessment;

import com.connection.mysql.MySqlConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Conseptify
 */
public class AssessmentAllotment 
{
    public static void action( String email_id ) throws SQLException
    {
        MySqlConnection.init();
        
        Connection con = MySqlConnection.createConnection(1);
        Statement st = con.createStatement();
                
        int[] questionArray = new int[10];
        int i = 0;
        
        String query = "SELECT count(`question_id`) FROM `question_set_aptitude`;";
        ResultSet rs = st.executeQuery(query);
        rs.next();
        int maxQuestions = rs.getInt(1);        // Total Questions in Aptitude Section
        while( i < 2 )
        {
            int randomQuestionId = (int )(Math.random() * maxQuestions + 1);
            query = "SELECT `question_id` FROM `question_set_aptitude` WHERE question_id = "+ randomQuestionId +" AND visible = 'YES';";
            rs = st.executeQuery(query);
            if( rs.next() )
            {
                questionArray[ i ] = randomQuestionId;
                i++;
            }        
        }
        
        
        
        query = "SELECT count(`question_id`) FROM `question_set_generalknowledge`;";
        rs = st.executeQuery(query);
        rs.next();
        maxQuestions = rs.getInt(1);        // Total Questions in Aptitude Section
        while( i < 4 )
        {
            int randomQuestionId = (int )(Math.random() * maxQuestions + 1);
            query = "SELECT `question_id` FROM `question_set_generalknowledge` WHERE question_id = "+ randomQuestionId +" AND visible = 'YES';";
            rs = st.executeQuery(query);
            if( rs.next() )
            {
                questionArray[ i ] = randomQuestionId;
                i++;
            }        
        }
        
        
        
        
        
        query = "SELECT count(`question_id`) FROM `question_set_verbal`;";
        rs = st.executeQuery(query);
        rs.next();
        maxQuestions = rs.getInt(1);        // Total Questions in Aptitude Section
        while( i < 6 )
        {
            int randomQuestionId = (int )(Math.random() * maxQuestions + 1);
            query = "SELECT `question_id` FROM `question_set_verbal` WHERE question_id = "+ randomQuestionId +" AND visible = 'YES';";
            rs = st.executeQuery(query);
            if( rs.next() )
            {
                questionArray[ i ] = randomQuestionId;
                i++;
            }        
        }
        
        
        
        query = "INSERT into `assessment_allotment` ( email_id , question_set_of_q1, question_id_of_q1, question_set_of_q2, question_id_of_q2, question_set_of_q3, question_id_of_q3, question_set_of_q4, question_id_of_q4, question_set_of_q5, question_id_of_q5, question_set_of_q6, question_id_of_q6) VALUES ("+email_id+"'question_set_aptitude',"+questionArray[0]+",'question_set_aptitude',"+questionArray[1]+",'question_set_generalknowledge',"+questionArray[2]+",'question_set_generalknowledge',"+questionArray[3]+",'question_set_verbal',"+questionArray[4]+",'question_set_verbal',"+questionArray[5]+");";
        st.execute(query);

    }
    
    
}
