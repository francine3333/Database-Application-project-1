package facultymgt;

import java.util.*;
import java.sql.DriverManager;
import java.sql.*;


public class faculty_decision {
    
    //fields of assets
    public int hiring_id;
    public int recruitment_id;
    public int mhiring_id;
    public int total;
    public String department_name;
    public String position_name;
    public String acad_acts;
    public String responsibility;
    public String year;
    public String Dyear;
    
    public int    rhiring_id;
    public String racad_year;
    public String rfirst_name;
    public String rlast_name;
    public String rgender;
    public String rposition_name;
    public String rapplication_date;
    public String rqualifications;
    public String rmobile_number;
    public String rexperiences;
    public String ryear;
    public String racad_act;
    public String rresposibility;
    public String rrstatus;
    
      public int vhiring_id;
    public int vrecruitment_id;
    public String vdepartment_name;
    public String vposition_name;
    public String vacad_acts;
    public String vresponsibility;
    public String vyear;
    
    public ArrayList<Integer> hiring_idlist = new ArrayList<> ();
    public ArrayList<Integer> recruitment_idlist = new ArrayList<> ();
    public ArrayList<String> department_namelist = new ArrayList<> ();
    public ArrayList<String> position_namelist = new ArrayList<> ();
    public ArrayList<String> year_list = new ArrayList<> ();
    public ArrayList<String> Dyear_list = new ArrayList<> ();
    public ArrayList<String> acad_actslist = new ArrayList<> ();
    public ArrayList<String> resp_list = new ArrayList<> ();
    
    public ArrayList<Integer> rhiring_idlist = new ArrayList<> ();
    public ArrayList<String> rfirst_namelist = new ArrayList<> ();
    public ArrayList<String> rlast_namelist = new ArrayList<> ();
    public ArrayList<String> rgender_list = new ArrayList<> ();
    public ArrayList<String> rposition_namelist = new ArrayList<> ();
    public ArrayList<String> rapplication_datelist = new ArrayList<> ();
    public ArrayList<String> rqualifications_list = new ArrayList<> ();
    public ArrayList<String> rmobile_number_list = new ArrayList<> ();
    public ArrayList<String> rexperiences_list = new ArrayList<> ();
    public ArrayList<String> ryear_list = new ArrayList<> ();
    public ArrayList<String> racad_act_list = new ArrayList<> ();
    public ArrayList<String> rresponsibility_list = new ArrayList<> ();
    public ArrayList<String> rrstatus_list = new ArrayList<> ();
    
    public ArrayList<Integer> vhiring_idlist = new ArrayList<> ();
    public ArrayList<Integer> vrecruit_idlist = new ArrayList<> ();
    public ArrayList<String> vdept_namelist = new ArrayList<> ();
    public ArrayList<String> vpos_namelist = new ArrayList<> ();
    public ArrayList<String> vacad_actlist = new ArrayList<> ();
    public ArrayList<String> vresp_list = new ArrayList<> ();
    public ArrayList<String> vacad_yearlist = new ArrayList<> ();
    
    public ArrayList<String> modify_list = new ArrayList<>();
    public ArrayList<String> view_list = new ArrayList<>();
          
    public faculty_decision() {}
    
    public int register_decision() {
        
        try{
            // This is where we will put codes that will interact with databases
            //1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);

            
            //2.Sql Statements
            //2.1 To get the new Asset ID
           // Query to get the maximum hiring_id + 1 from the hiring_decision table
            String getMaxIdQuery = "SELECT MAX(hiring_id) + 1 AS newID FROM faculty_decision";
            PreparedStatement pstmt = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt.executeQuery();
          
            String getRecruitmentIdQuery = "SELECT recruitment_id FROM faculty_recruitment WHERE onboarding_date IS NOT NULL";
            PreparedStatement pstmt1 = conn.prepareStatement(getRecruitmentIdQuery);
            ResultSet rst1 = pstmt1.executeQuery();
            
            String getDepartmentIdQuery = "SELECT department_name FROM department";
            PreparedStatement pstmt2 = conn.prepareStatement(getDepartmentIdQuery);
            ResultSet rst2 = pstmt2.executeQuery();
            
            String getPositionIdQuery = "SELECT position_name FROM position";
            PreparedStatement pstmt3 = conn.prepareStatement(getPositionIdQuery);
            ResultSet rst3 = pstmt3.executeQuery();
             
            String getTextQuery = "SELECT acad_activities, responsibilities FROM faculty_decision";
            PreparedStatement pstmt4 = conn.prepareStatement(getTextQuery);
            ResultSet rst4 = pstmt4.executeQuery();
            
            String getAYQuery = "SELECT acad_year FROM academic_year";
            PreparedStatement pstmt5 = conn.prepareStatement(getAYQuery);
            ResultSet rst5= pstmt5.executeQuery();
            
            String getAcademicYearsQuery = "SELECT DISTINCT acad_year FROM faculty_decision";
            PreparedStatement pstmt6 = conn.prepareStatement(getAcademicYearsQuery);
            ResultSet rst6 = pstmt6.executeQuery();
            
            String getIdQuery = "SELECT DISTINCT hiring_id FROM faculty_decision";
            PreparedStatement pstmt7 = conn.prepareStatement(getIdQuery);
            ResultSet rst7 = pstmt7.executeQuery();
      
            hiring_idlist.clear();
            recruitment_idlist.clear();
            department_namelist.clear();
            position_namelist.clear();
            year_list.clear();
            Dyear_list.clear();
            
            while (rst.next()) {
            hiring_id = rst.getInt("newID");
            }
            
           while (rst1.next()) {
            recruitment_id = rst1.getInt("recruitment_id");
            recruitment_idlist.add(recruitment_id);
            }

            while (rst2.next()) {
            department_name = rst2.getString("department_name"); // Use getString for a String column
            department_namelist.add(department_name);
            }


            while (rst3.next()) {
            position_name = rst3.getString("position_name");
            position_namelist.add(position_name);
            }
            
            while (rst4.next()) {
            acad_acts = rst4.getString("acad_activities");
            acad_actslist.add(acad_acts);
            responsibility = rst4.getString("responsibilities");
            resp_list.add(responsibility);
            }
            
            while (rst5.next()) {
            year = rst5.getString("acad_year");
            year_list.add(year);
            }
            
            while (rst6.next()) {
            Dyear = rst6.getString("acad_year");
            Dyear_list.add(Dyear);
            }
            
            while (rst7.next()) {
            mhiring_id = rst7.getInt("hiring_id");
            hiring_idlist.add(mhiring_id);
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
    
     // Method to insert decision information into the database
    public int insertDecision(int recruitmentId, String departmentName, String positionName, String acad_acts, String responsibility, String year) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getMaxIdQuery = "SELECT MAX(hiring_id) + 1 AS newID FROM faculty_decision";
            PreparedStatement pstmt1 = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt1.executeQuery();
            
            while (rst.next()) {
            hiring_id = rst.getInt("newID");
            }
            
            
            // Insert into hiring_decision table
            String insertDecisionQuery = "INSERT INTO faculty_decision (hiring_id, recruitment_id, department_name, position_name, acad_activities, responsibilities, acad_year) "
                    + "                     VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertDecisionQuery);
            pstmt.setInt(1, hiring_id);
            pstmt.setInt(2, recruitmentId);
            pstmt.setString(3, departmentName);
            pstmt.setString(4, positionName);
            pstmt.setString(5, acad_acts);
            pstmt.setString(6, responsibility);
            pstmt.setString(7, year);
            pstmt.executeUpdate();

            conn.commit();
            pstmt.close();
            conn.close();

            System.out.println("Decision inserted successfully");
            return 1;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
  
   public int modify() {
       
       modify_list.clear();
       view_list.clear();

        modify_list.add("all");
        modify_list.add("department_name");
        modify_list.add("position_name");
        modify_list.add("acad_activities");
        modify_list.add("responsibilities");
        modify_list.add("acad_year");
        
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

            String getTextQuery = "SELECT hiring_id, recruitment_id, department_name, position_name, acad_activities, responsibilities, acad_year "
                    + " FROM faculty_decision WHERE hiring_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            pstmt.setInt(1, h_id); 
            ResultSet rst = pstmt.executeQuery();
                        
            String getDepartmentIdQuery = "SELECT department_name FROM department";
            PreparedStatement pstmt2 = conn.prepareStatement(getDepartmentIdQuery);
            ResultSet rst2 = pstmt2.executeQuery();
            
            String getPositionIdQuery = "SELECT position_name FROM position";
            PreparedStatement pstmt3 = conn.prepareStatement(getPositionIdQuery);
            ResultSet rst3 = pstmt3.executeQuery();
             
            String getAYQuery = "SELECT acad_year FROM academic_year";
            PreparedStatement pstmt5 = conn.prepareStatement(getAYQuery);
            ResultSet rst5= pstmt5.executeQuery();
            
            String getAcademicYearsQuery = "SELECT DISTINCT acad_year FROM faculty_decision";
            PreparedStatement pstmt6 = conn.prepareStatement(getAcademicYearsQuery);
            ResultSet rst6 = pstmt6.executeQuery();
          
            
            hiring_idlist.clear();
            recruitment_idlist.clear();
            department_namelist.clear();
            position_namelist.clear();
            year_list.clear();
            Dyear_list.clear();
            
            while (rst.next()) {
                recruitment_id = rst.getInt("recruitment_id"); 
                department_name = rst.getString("department_name");
                department_namelist.add(department_name);
                position_name = rst.getString("position_name");
                position_namelist.add(position_name);
                acad_acts = rst.getString("acad_activities");
                responsibility = rst.getString("responsibilities");
                resp_list.add(responsibility);
                year = rst.getString("acad_year");
                year_list.add(year);
                
            }
            
            while (rst2.next()) {
            department_name = rst2.getString("department_name"); // Use getString for a String column
            department_namelist.add(department_name);
            }


            while (rst3.next()) {
            position_name = rst3.getString("position_name");
            position_namelist.add(position_name);
            }
            
            
            while (rst5.next()) {
            year = rst5.getString("acad_year");
            year_list.add(year);
            }
            
            while (rst6.next()) {
            Dyear = rst6.getString("acad_year");
            Dyear_list.add(Dyear);
            }
            
            return 1;
  } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
 }
 
 public int modify_all(int h_id, String dept, String pos, String acad, String resp, String year  ){
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);
       
        String updateRecruitmentIdQuery = "UPDATE faculty_decision SET department_name = ?, position_name = ?, acad_activities = ?, "
                + "responsibilities = ?, acad_year = ? WHERE hiring_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateRecruitmentIdQuery);
        pstmt.setString(1,dept);
        pstmt.setString(2,pos);
        pstmt.setString(3,acad);
        pstmt.setString(4,resp);
        pstmt.setString(5,year);
        pstmt.setInt(6, h_id); 
        
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
 
 public int delete (int h_id){
     try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);
        
        String deleteQuery = "DELETE FROM faculty_decision WHERE hiring_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
        pstmt.setInt(1, h_id); 
        

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

 public int view_decision() {
        try{
          
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getTextQuery = "SELECT hiring_id, recruitment_id, department_name, position_name, acad_activities, responsibilities, acad_year FROM faculty_decision";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            ResultSet rst = pstmt.executeQuery();
            
            vhiring_idlist.clear();
            vrecruit_idlist.clear();
            vdept_namelist.clear();
            vpos_namelist.clear();
            vacad_actlist.clear();
            vresp_list.clear();
            vacad_yearlist.clear();
            
            while (rst.next()) {
                vhiring_id = rst.getInt("hiring_id"); 
                vhiring_idlist.add(vhiring_id);
                vrecruitment_id = rst.getInt("recruitment_id"); 
                vrecruit_idlist.add(vrecruitment_id);
                vdepartment_name = rst.getString("department_name");
                vdept_namelist.add(vdepartment_name);
                vposition_name = rst.getString("position_name");
                vpos_namelist.add(vposition_name);
                vacad_acts = rst.getString("acad_activities");
                vacad_actlist.add(vacad_acts);
                vresponsibility = rst.getString("responsibilities");
                vresp_list.add(vresponsibility);
                vyear = rst.getString("acad_year");
                vacad_yearlist.add(vyear);
                
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
    
 public int view_decision_sID(int h_id) {
        try{
            // This is where we will put codes that will interact with databases
            //1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getTextQuery = "SELECT hiring_id, recruitment_id, department_name, position_name, acad_activities, responsibilities, acad_year "
                    + " FROM faculty_decision WHERE hiring_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            pstmt.setInt(1, h_id); 
            ResultSet rst = pstmt.executeQuery();
            
            vhiring_idlist.clear();
            vrecruit_idlist.clear();
            vdept_namelist.clear();
            vpos_namelist.clear();
            vacad_actlist.clear();
            vresp_list.clear();
            vacad_yearlist.clear();
            
            while (rst.next()) {
                vhiring_id = rst.getInt("hiring_id"); 
                vhiring_idlist.add(vhiring_id);
                vrecruitment_id = rst.getInt("recruitment_id"); 
                vrecruit_idlist.add(vrecruitment_id);
                vdepartment_name = rst.getString("department_name");
                vdept_namelist.add(vdepartment_name);
                vposition_name = rst.getString("position_name");
                vpos_namelist.add(vposition_name);
                vacad_acts = rst.getString("acad_activities");
                vacad_actlist.add(vacad_acts);
                vresponsibility = rst.getString("responsibilities");
                vresp_list.add(vresponsibility);
                vyear = rst.getString("acad_year");
                vacad_yearlist.add(vyear);
                
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
 
 public void generateFacultyReportByYearRange(String startYear, String endYear) {
    rhiring_idlist.clear();
    rfirst_namelist.clear();
    rlast_namelist.clear();
    rgender_list.clear();
    rposition_namelist.clear();
    rapplication_datelist.clear();
    rqualifications_list.clear();
    rexperiences_list.clear();
    rmobile_number_list.clear();
    ryear_list.clear();
    racad_act_list.clear();
    rresponsibility_list.clear();
    rrstatus_list.clear();

    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

        String query =
                "SELECT fd.hiring_id, fd.acad_year, fd.acad_activities, fd.responsibilities, fr.recruitment_status, a.last_name, a.first_name, a.gender, fd.position_name, a.application_date, a.qualifications, a.mobile_number, a.experiences " +
                        "FROM faculty_decision fd JOIN faculty_recruitment fr " +
                        "ON fd.recruitment_id = fr.recruitment_id " +
                        "JOIN applicant a " +
                        "ON a.applicant_id = fr.applicant_id " +
                        "WHERE fd.acad_year BETWEEN ? AND ?";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, startYear);
            pstmt.setString(2, endYear);

            // Execute query
            try (ResultSet rst = pstmt.executeQuery()) {
                // Populate lists with fetched data
                while (rst.next()) {
                    int rhiring_id = rst.getInt("hiring_id");
                    rhiring_idlist.add(rhiring_id);
                    String ryear = rst.getString("acad_year");
                    ryear_list.add(ryear);
                    String racad_act = rst.getString("acad_activities");
                    racad_act_list.add(racad_act);
                    String rresposibility = rst.getString("responsibilities");
                    rresponsibility_list.add(rresposibility);
                    String rrstatus = rst.getString("recruitment_status");
                    rrstatus_list.add(rrstatus);
                    String rlast_name = rst.getString("last_name");
                    rlast_namelist.add(rlast_name);
                    String rfirst_name = rst.getString("first_name");
                    rfirst_namelist.add(rfirst_name);
                    String rgender = rst.getString("gender");
                    rgender_list.add(rgender);
                    String rposition_name = rst.getString("position_name");
                    rposition_namelist.add(rposition_name);
                    String rapplication_date = rst.getString("application_date");
                    rapplication_datelist.add(rapplication_date);
                    String rqualifications = rst.getString("qualifications");
                    rqualifications_list.add(rqualifications);
                    String rexperiences = rst.getString("experiences");
                    rexperiences_list.add(rexperiences);
                    String rmobile_number = rst.getString("mobile_number");
                    rmobile_number_list.add(rmobile_number);
                }
            }
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public int generateFacultyReportByYearRangeTotal(String startYear, String endYear) {
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

        String query =
                "SELECT COUNT(fd.hiring_id) AS total_records " +
                "FROM faculty_decision fd JOIN faculty_recruitment fr " +
                "ON fd.recruitment_id = fr.recruitment_id " +
                "JOIN applicant a " +
                "ON a.applicant_id = fr.applicant_id " +
                "WHERE fd.acad_year BETWEEN ? AND ?";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, startYear);
            pstmt.setString(2, endYear);

            try (ResultSet rst = pstmt.executeQuery()) {
                if (rst.next()) {
                    total = rst.getInt("total_records");
                }
            }
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return total;
}

    public static void main (String args[]) {
        
        faculty_decision F = new faculty_decision();
        
        F.register_decision();
        
        for (String year : F.Dyear_list) {
            System.out.println(year);
        }
        
       
      
    }
    
    
}
