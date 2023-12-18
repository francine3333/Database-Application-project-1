package facultymgt;

import java.util.*;
import java.sql.DriverManager;
import java.sql.*;


public class faculty_promotion {
    
    public int evaluation_id;
    public int faculty_id;
    public int achievement_id;
    public int dachievement_id;
    public String qualifications;
    public String promotion_status;
    public String transaction_date;
    
    public int vevaluation_id;
    public int vfaculty_id;
    public int vachievement_id;
    public String vqualifications;
    public String vpromotion;
    public String vtransaction_date;
    
    public ArrayList<Integer> evaluation_idlist = new ArrayList<> ();
    public ArrayList<Integer> faculty_idlist = new ArrayList<> ();
    public ArrayList<Integer> achievement_idlist = new ArrayList<> ();
    public ArrayList<Integer> dachievement_idlist = new ArrayList<> ();
    public ArrayList<String> qualificationslist = new ArrayList<> ();
    public ArrayList<String> promotion_statuslist = new ArrayList<> ();
    public ArrayList<String> transaction_datelist = new ArrayList<> ();
    
    public ArrayList<String> modify_list = new ArrayList<> ();
    public ArrayList<String> view_list = new ArrayList<> ();
    
    
    public ArrayList<Integer> vevaluation_idlist = new ArrayList<> ();
    public ArrayList<Integer> vfaculty_idlist = new ArrayList<> ();
    public ArrayList<Integer> vachievement_idlist = new ArrayList<> ();
    public ArrayList<String> vqualificationslist = new ArrayList<> ();
    public ArrayList<String> vpromotion_statuslist = new ArrayList<> ();
    public ArrayList<String> vtransaction_datelist = new ArrayList<> ();
    
    
    public faculty_promotion() {}
    
    public int register_promotion() {
        
        try{
            // This is where we will put codes that will interact with databases
            //1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);

            
            //2.Sql Statements
            //2.1 To get the new Asset ID
            String getMaxIdQuery = "SELECT MAX(evaluation_id) + 1 AS newID FROM promotion";
            PreparedStatement pstmt = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt.executeQuery();

            String getFacultyIdQuery = "SELECT DISTINCT faculty_id FROM faculty_profile WHERE is_eligible = 'Yes'";
            PreparedStatement pstmt1 = conn.prepareStatement(getFacultyIdQuery);
            ResultSet rst1 = pstmt1.executeQuery();
            
            String getAchievementIdQuery = "SELECT    fa.achievement_id\n" +
                "FROM    faculty_profile fp JOIN    faculty_achievements fa\n" +
                "                            ON    fp.faculty_id = fa.faculty_id\n" +
                "WHERE    fp.is_eligible = 'Yes';";
            PreparedStatement pstmt2 = conn.prepareStatement(getAchievementIdQuery);
            ResultSet rst2 = pstmt2.executeQuery();
            
            String getQualificationIdQuery = "SELECT qualifications FROM promotion";
            PreparedStatement pstmt3 = conn.prepareStatement(getQualificationIdQuery);
            ResultSet rst3 = pstmt3.executeQuery();
             
            String getStatusQuery = "SELECT promotion_status FROM promotion";
            PreparedStatement pstmt4 = conn.prepareStatement(getStatusQuery);
            ResultSet rst4 = pstmt4.executeQuery();
            
            String getAchievementQuery = "SELECT achievement_id FROM promotion";
            PreparedStatement pstmt5 = conn.prepareStatement(getAchievementQuery);
            ResultSet rst5 = pstmt5.executeQuery();
       
            String getEval_Id = "SELECT evaluation_id FROM promotion";
            PreparedStatement pstmt6 = conn.prepareStatement(getEval_Id);
            ResultSet rst6 = pstmt6.executeQuery();
            
            String getTrans_Date = "SELECT transaction_date FROM promotion";
            PreparedStatement pstmt7 = conn.prepareStatement(getTrans_Date);
            ResultSet rst7 = pstmt7.executeQuery();
      
            evaluation_idlist.clear();
            faculty_idlist.clear();
            achievement_idlist.clear();
            dachievement_idlist.clear();
            qualificationslist.clear();
            promotion_statuslist.clear();
            transaction_datelist.clear();
            
            while (rst.next()) {
            evaluation_id = rst.getInt("newID");
            }
            
           while (rst1.next()) {
            faculty_id = rst1.getInt("faculty_id");
            faculty_idlist.add(faculty_id);
            }
           
            while (rst2.next()) {
            achievement_id = rst2.getInt("achievement_id");
            achievement_idlist.add(achievement_id);
            }

            while (rst3.next()) {
            qualifications = rst3.getString("qualifications");
            }
                        
            promotion_statuslist.add("Accepted");
            promotion_statuslist.add("Rejected");           
            
            while (rst5.next()) {
            dachievement_id = rst5.getInt("achievement_id"); 
            dachievement_idlist.add(dachievement_id);
            }

            while (rst6.next()) {
            vevaluation_id = rst6.getInt("evaluation_id"); 
            evaluation_idlist.add(vevaluation_id);
            }
            
            transaction_datelist.add(transaction_date);

            
            conn.commit();
            pstmt.close();
            conn.close();
            
            System.out.println("Succesful");
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
    
     // Method to insert promotion information into the database
    public int insertPromotion(int faculty_id, int achievement_id, String qualifications, String promotion_status, String transaction_date) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getMaxIdQuery = "SELECT MAX(evaluation_id) + 1 AS newID FROM promotion";
            PreparedStatement pstmt1 = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt1.executeQuery();
            
            while (rst.next()) {
            evaluation_id = rst.getInt("newID");
            }
           
            // Insert into promotion table
            String insertPromotionQuery = "INSERT INTO promotion (evaluation_id, faculty_id, achievement_id, qualifications, promotion_status, transaction_date) "
                    + "                     VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertPromotionQuery);
            pstmt.setInt(1, evaluation_id);
            pstmt.setInt(2, faculty_id);
            pstmt.setInt(3, achievement_id);
            pstmt.setString(4, qualifications);
            pstmt.setString(5, promotion_status);
            pstmt.setString(6, transaction_date);
            pstmt.executeUpdate();

            conn.commit();
            pstmt.close();
            conn.close();

            System.out.println("Promotion inserted successfully");
            return 1;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
public int delete (int e_id){
     try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);
        
        String deleteQuery = "DELETE FROM promotion WHERE evaluation_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
        pstmt.setInt(1, e_id); 
        

      int rowsAffected = pstmt.executeUpdate(); 
        
        conn.commit(); 

        if(rowsAffected > 0) {
            return 1; 
        } else {
            return 0; 
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0; 
    }
 }

   public int modify() {
       
       modify_list.clear();
       view_list.clear();
      
        modify_list.add("all");
        modify_list.add("faculty_id");
        modify_list.add("achievement_id");
        modify_list.add("qualifications");
        modify_list.add("promotion_status");
        modify_list.add("transaction_date");
        
        view_list.add("all");
        view_list.add("specific id");
        
       return 1;

   }
   
   public int modify_get(int h_id){
      try{
           
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);

            String getTextQuery = "SELECT evaluation_id, faculty_id, achievement_id, qualifications, promotion_status, transaction_date  "
                    + " FROM promotion WHERE evaluation_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            pstmt.setInt(1, h_id); 
            ResultSet rst = pstmt.executeQuery();
                        
            evaluation_idlist.clear();
            faculty_idlist.clear();
            achievement_idlist.clear();
            dachievement_idlist.clear();
            qualificationslist.clear();
            promotion_statuslist.clear();
            transaction_datelist.clear();
            
            while (rst.next()) {
                 evaluation_id = rst.getInt("evaluation_id");
                 faculty_id = rst.getInt("faculty_id");
                 achievement_id = rst.getInt("achievement_id");
                 qualifications = rst.getString("qualifications");
                 promotion_status = rst.getString("promotion_status");
                 promotion_statuslist.add(promotion_status);
                 transaction_date = rst.getString("transaction_date");
  
            }
  
             promotion_statuslist.add("Accepted");
             promotion_statuslist.add("Rejected");

            
            transaction_datelist.add(transaction_date);

            return 1;
  } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
 }
   
   public int view_promotion() {
        try{
            // This is where we will put codes that will interact with databases
            //1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getTextQuery = "SELECT evaluation_id, faculty_id, achievement_id, qualifications, promotion_status, transaction_date "
                    + "             FROM promotion";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            ResultSet rst = pstmt.executeQuery();
            
            vevaluation_idlist.clear();
            vfaculty_idlist.clear();
            vachievement_idlist.clear();
            vqualificationslist.clear();
            vpromotion_statuslist.clear();
            vtransaction_datelist.clear();
   
            while (rst.next()) {
                vevaluation_id = rst.getInt("evaluation_id"); 
                vevaluation_idlist.add(vevaluation_id);
                vfaculty_id = rst.getInt("faculty_id"); 
                vfaculty_idlist.add(vfaculty_id);
                vachievement_id = rst.getInt("achievement_id"); 
                vachievement_idlist.add(vachievement_id);
                vqualifications = rst.getString("qualifications");
                vqualificationslist.add(vqualifications);
                vpromotion = rst.getString("promotion_status");
                vpromotion_statuslist.add(vpromotion);
                vtransaction_date = rst.getString("transaction_date");
                vtransaction_datelist.add(vtransaction_date);
            }
            
            conn.commit();
            pstmt.close();
            conn.close();
            
            System.out.println("Succesful");
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
   
   public int view_promotion_sID(int e_id) {
        try{
            // This is where we will put codes that will interact with databases
            //1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getTextQuery = "SELECT evaluation_id, faculty_id, achievement_id, qualifications, promotion_status, transaction_date "
                    + "             FROM promotion WHERE evaluation_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            pstmt.setInt(1, e_id); 
            ResultSet rst = pstmt.executeQuery();
            
            vevaluation_idlist.clear();
            vfaculty_idlist.clear();
            vachievement_idlist.clear();
            vqualificationslist.clear();
            vpromotion_statuslist.clear();
            vtransaction_datelist.clear();
   
            while (rst.next()) {
                vevaluation_id = rst.getInt("evaluation_id"); 
                vevaluation_idlist.add(vevaluation_id);
                vfaculty_id = rst.getInt("faculty_id"); 
                vfaculty_idlist.add(vfaculty_id);
                vachievement_id = rst.getInt("achievement_id"); 
                vachievement_idlist.add(vachievement_id);
                vqualifications = rst.getString("qualifications");
                vqualificationslist.add(vqualifications);
                vpromotion = rst.getString("promotion_status");
                vpromotion_statuslist.add(vpromotion);
                vtransaction_date = rst.getString("transaction_date");
                vtransaction_datelist.add(vtransaction_date);
            }
            
            conn.commit();
            pstmt.close();
            conn.close();
            
            System.out.println("Succesful");
            return 1;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
   
   public int modify_all(int e_id, String quali, String p_s, String year  ){
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);
       
        String updateRecruitmentIdQuery = "UPDATE promotion SET "
                + "qualifications = ?, promotion_status = ?, transaction_date = ? WHERE evaluation_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateRecruitmentIdQuery);
        pstmt.setString(1,quali);
        pstmt.setString(2,p_s);
        pstmt.setString(3,year);
        pstmt.setInt(4, e_id); 
        
        int rowsAffected = pstmt.executeUpdate(); 
        
        conn.commit(); 

        if(rowsAffected > 0) {
            return 1; 
        } else {
            return 0; 
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0; 
    }
}
   
   
        
    public static void main (String args[]) {
        
        faculty_promotion P = new faculty_promotion();
        
        P.register_promotion();
        
    }
    
}

