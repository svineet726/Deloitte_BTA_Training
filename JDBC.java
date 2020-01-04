package day3;

import java.sql.*;
import java.util.Date;

public class JDBC {
   // JDBC driver name and database URL
	
   static final String DB_URL = "jdbc:oracle:thin:@192.168.1.60:1521:xe";

   //  Database credentials
   static final String USER = "hr";
   static final String PASS = "hr";
   
   private static java.sql.Date getCurrentDate() {
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}

   public static void main(String[] args) {
	   Driver d= null;
	   Connection conn = null;
	   Statement stmt = null;
   try{
      
      //STEP 3: Open a connection
      System.out.println("Connecting to a selected database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      System.out.println("Connected database successfully...");
      
     
      System.out.println("Inserting records into the table...");
      stmt = conn.createStatement();
      
      
      String sql1 = "INSERT INTO Patients_1 " +
                   "VALUES (200, 'Sara', 's@abc.com',CURRENT_TIMESTAMP)";
      
      stmt.executeUpdate(sql1);
      sql1 = "INSERT INTO Patients_1 " +
                   "VALUES (400, 'Trump', 'Trump@usprez.com', CURRENT_TIMESTAMP)";
      stmt.executeUpdate(sql1);
      
      sql1 = "INSERT INTO Patients_1 " +
              "VALUES (402, 'KJ', 'KJ@xyz.com', CURRENT_TIMESTAMP)";
      stmt.executeUpdate(sql1);
 
      sql1 = "INSERT INTO Prescriptions_1 " +
                   "VALUES (600, CURRENT_TIMESTAMP, '500', 'Eno')";
      stmt.executeUpdate(sql1);
      sql1 = "INSERT INTO Prescriptions_1 " +
                   "VALUES(601, CURRENT_TIMESTAMP, '501', 'Crocin')";
      stmt.executeUpdate(sql1);
      sql1 = "INSERT INTO Prescriptions_1 " +
              "VALUES(602,CURRENT_TIMESTAMP , '502', 'Pantop')";
      stmt.executeUpdate(sql1);
 
      System.out.println("Inserted records into the table...");
    //UPDATING A RECORD
      String sql = "UPDATE Patients_1 " +
              "SET Patient_name = 'Klaus' WHERE patient_id = 200";
      stmt.executeUpdate(sql);
 System.out.println("Record updated");
 
 //Deleting a record
 
 String sql2 = "DELETE FROM Prescriptions_1 " +
         "WHERE Prescription_id = 601";
stmt.executeUpdate(sql2);

   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            conn.close();
      }catch(SQLException se){
      }// do nothing
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
   System.out.println("Goodbye!");
}//end main
}//end JDBCExample

