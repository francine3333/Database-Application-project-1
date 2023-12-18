package facultymgt;

import java.util.*;
import java.sql.DriverManager;
import java.sql.*;


public class faculty_profile {
    public int    faculty_id;
    public int    mfaculty_id;
    public String last_name;
    public String first_name;
    public String gender;
    public String department_name;
    public String position_name;
    public String date_of_birth;
    public String mobile_number;
    public String is_eligible;
    
    public int    vfaculty_id;
    public String vlast_name;
    public String vfirst_name;
    public String vgender;
    public String vdepartment_name;
    public String vposition_name;
    public String vdate_of_birth;
    public String vmobile_number;
    public String vis_eligible;
    
    public ArrayList<Integer> faculty_idlist = new ArrayList<> ();
    public ArrayList<String> last_namelist = new ArrayList<> ();
    public ArrayList<String> first_namelist = new ArrayList<> ();
    public ArrayList<String> genderlist = new ArrayList<> ();
    public ArrayList<String> department_namelist = new ArrayList<> ();
    public ArrayList<String> position_namelist = new ArrayList<> ();
    public ArrayList<String> date_of_birthlist = new ArrayList<> ();
    public ArrayList<String> mobile_numberlist = new ArrayList<> ();
    public ArrayList<String> is_eligiblelist = new ArrayList<> ();
    
    public ArrayList<Integer> vfaculty_idlist = new ArrayList<> ();
    public ArrayList<String> vlast_namelist = new ArrayList<> ();
    public ArrayList<String> vfirst_namelist = new ArrayList<> ();
    public ArrayList<String> vgenderlist = new ArrayList<> ();
    public ArrayList<String> vdepartment_namelist = new ArrayList<> ();
    public ArrayList<String> vposition_namelist = new ArrayList<> ();
    public ArrayList<String> vdate_of_birthlist = new ArrayList<> ();
    public ArrayList<String> vmobile_numberlist = new ArrayList<> ();
    public ArrayList<String> vis_eligiblelist = new ArrayList<> ();
    
    public ArrayList<String> modify_list = new ArrayList<>();
    public ArrayList<String> view_list = new ArrayList<>();

    public faculty_profile() {}
    
    public int register_profile() {
        
        try{
            // This is where we will put codes that will interact with databases
            //1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);

            
            //2.Sql Statements
            //2.1 To get the new Asset ID
           // Query to get the maximum faculty_id + 1 from the faculty_profile table
            String getMaxIdQuery = "SELECT MAX(faculty_id) + 1 AS newID FROM faculty_profile";
            PreparedStatement pstmt = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt.executeQuery();
	
	    //last name, first name
            String getTextQuery = "SELECT last_name, first_name, gender FROM faculty_profile";
            PreparedStatement pstmt1 = conn.prepareStatement(getTextQuery);
            ResultSet rst1 = pstmt1.executeQuery();

	    // department name
            String getDepartmentIdQuery = "SELECT department_name FROM department";
            PreparedStatement pstmt3 = conn.prepareStatement(getDepartmentIdQuery);
            ResultSet rst3 = pstmt3.executeQuery();
            
	    //position name
            String getPositionIdQuery = "SELECT position_name FROM position";
            PreparedStatement pstmt4 = conn.prepareStatement(getPositionIdQuery);
            ResultSet rst4 = pstmt4.executeQuery();
            
	    //date of birth, mobile number, is eligible
            String getText2Query = "SELECT date_of_birth, mobile_number, is_eligible FROM faculty_profile";
            PreparedStatement pstmt5 = conn.prepareStatement(getText2Query);
            ResultSet rst5 = pstmt5.executeQuery();
            
            String getDFacultyIdQuery = "SELECT faculty_id FROM faculty_profile";
            PreparedStatement pstmt6 = conn.prepareStatement(getDFacultyIdQuery);
            ResultSet rst6 = pstmt6.executeQuery();

            faculty_idlist.clear();
            date_of_birthlist.clear();
            mobile_numberlist.clear();
	    last_namelist.clear();
            first_namelist.clear();
            genderlist.clear();
            department_namelist.clear();
            position_namelist.clear();
            is_eligiblelist.clear();

            while (rst.next()) {
            faculty_id = rst.getInt("newID");
            }

            while (rst1.next()) {
            last_name = rst1.getString("last_name");
            first_name = rst1.getString("first_name");
            }
	    genderlist.add("Female");
            genderlist.add("Male");

            
            while (rst3.next()) {
            department_name = rst3.getString("department_name"); 
            department_namelist.add(department_name);
            }


            while (rst4.next()) {
            position_name = rst4.getString("position_name");
            position_namelist.add(position_name);
            }

            //date of birth, mobile number, is eligible
            date_of_birthlist.add(date_of_birth);
            while (rst5.next()) {
            mobile_number = rst5.getString("mobile_number");
            }
            
	    is_eligiblelist.add("Yes");
            is_eligiblelist.add("No");

            while (rst6.next()) {
            mfaculty_id = rst6.getInt("faculty_id");
            faculty_idlist.add(mfaculty_id);
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
    
     // Method to insert profile information into the database
    public int insertProfile(String last_name, String first_name, String gender, String department_name, String position_name, String date_of_birth, String mobile_number, String is_eligible) {
 	try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getMaxIdQuery = "SELECT MAX(faculty_id) + 1 AS newID FROM faculty_profile";
            PreparedStatement pstmt1 = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt1.executeQuery();
            
            while (rst.next()) {
            faculty_id = rst.getInt("newID");
            }
            
            
            // Insert into faculty_profile table
            String insertProfileQuery = "INSERT INTO faculty_profile (faculty_id, last_name, first_name, gender, department_name, position_name, date_of_birth, mobile_number, is_eligible) "
                    + "                     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertProfileQuery);
            pstmt.setInt(1, faculty_id);
            pstmt.setString(2, last_name);
            pstmt.setString(3, first_name);
            pstmt.setString(4, gender);
            pstmt.setString(5, department_name);
            pstmt.setString(6, position_name);
            pstmt.setString(7, date_of_birth);
            pstmt.setString(8, mobile_number);
            pstmt.setString(9, is_eligible);
            pstmt.executeUpdate();
            

            conn.commit();
            pstmt.close();
            conn.close();

            System.out.println("Profile inserted successfully");
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
        modify_list.add("last_name");
        modify_list.add("first_name");
        modify_list.add("gender");
        modify_list.add("department_name");
        modify_list.add("position_name");
        modify_list.add("date_of_birth");
        modify_list.add("mobile_number");
        modify_list.add("is_eligible");
        
        view_list.add("all");
        view_list.add("specific id");
        
       return 1;
       
      
   }

 public int modify_get(int f_id){
      try{
           
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);

            String getTextQuery = "SELECT faculty_id, last_name, first_name, gender, department_name, position_name, date_of_birth, mobile_number, is_eligible "
                    + " FROM faculty_profile WHERE faculty_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            pstmt.setInt(1, f_id); 
            ResultSet rst = pstmt.executeQuery();
            
            String getLastNameIdQuery = "SELECT last_name FROM faculty_profile";
            PreparedStatement pstmt2 = conn.prepareStatement(getLastNameIdQuery);
            ResultSet rst2 = pstmt2.executeQuery();
            
            String getFirstNameQuery = "SELECT first_name FROM faculty_profile";
            PreparedStatement pstmt3 = conn.prepareStatement(getFirstNameQuery);
            ResultSet rst3 = pstmt3.executeQuery();
            
            String getGenderQuery = "SELECT gender FROM faculty_profile";
            PreparedStatement pstmt4 = conn.prepareStatement(getGenderQuery);
            ResultSet rst4 = pstmt4.executeQuery();
                        
            String getDepartmentIdQuery = "SELECT department_name FROM department";
            PreparedStatement pstmt5 = conn.prepareStatement(getDepartmentIdQuery);
            ResultSet rst5 = pstmt5.executeQuery();
            
            String getPositionIdQuery = "SELECT position_name FROM position";
            PreparedStatement pstmt6 = conn.prepareStatement(getPositionIdQuery);
            ResultSet rst6 = pstmt6.executeQuery();
             
            String getDateOfBirthQuery = "SELECT date_of_birth FROM faculty_profile";
            PreparedStatement pstmt7 = conn.prepareStatement(getDateOfBirthQuery);
            ResultSet rst7= pstmt7.executeQuery();
            
            String getMobileNumberQuery = "SELECT mobile_number FROM faculty_profile";
            PreparedStatement pstmt8 = conn.prepareStatement(getMobileNumberQuery);
            ResultSet rst8 = pstmt8.executeQuery();
            
            String getEligibleQuery = "SELECT is_eligible FROM faculty_profile";
            PreparedStatement pstmt9 = conn.prepareStatement(getEligibleQuery);
            ResultSet rst9 = pstmt9.executeQuery();
          
            
            faculty_idlist.clear();
            last_namelist.clear();
            first_namelist.clear();
            genderlist.clear();
            department_namelist.clear();
            position_namelist.clear();
            date_of_birthlist.clear();
            mobile_numberlist.clear();
            is_eligiblelist.clear();
            
            while (rst.next()) {
                last_name = rst.getString("last_name"); 
                first_name = rst.getString("first_name"); 
                gender = rst.getString("gender");
                genderlist.add(gender);
                department_name = rst.getString("department_name");
                department_namelist.add(department_name);
                position_name = rst.getString("position_name");
                position_namelist.add(position_name);
                date_of_birth = rst.getString("date_of_birth");
                date_of_birthlist.add(date_of_birth);
                mobile_number = rst.getString("mobile_number");
                mobile_numberlist.add(mobile_number);
                is_eligible = rst.getString("is_eligible");
                is_eligiblelist.add(is_eligible);
                
            }
            

            genderlist.add("Female");
            genderlist.add("Male");
                        
            while (rst5.next()) {
            department_name = rst5.getString("department_name"); // Use getString for a String column
            department_namelist.add(department_name);
            }


            while (rst6.next()) {
            position_name = rst6.getString("position_name");
            position_namelist.add(position_name);
            }
            
            
            while (rst7.next()) {
            date_of_birth = rst7.getString("date_of_birth");
            date_of_birthlist.add(date_of_birth);
            }
            

            is_eligiblelist.add("Yes");
            is_eligiblelist.add("No");
            
            
            return 1;
  } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
 }
 
 public int modify_all(int f_id, String last_name, String first_name, String gender, String department_name, String position_name, String date_of_birth, String mobile_number, String is_eligible){
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);
       
        String updateFacultyIdQuery = "UPDATE faculty_profile SET  last_name = ?, first_name = ?, gender = ?, department_name = ?, position_name = ?, date_of_birth = ?, mobile_number = ?, is_eligible = ? WHERE faculty_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateFacultyIdQuery);
        pstmt.setString(1,last_name);
        pstmt.setString(2,first_name);
        pstmt.setString(3,gender);
        pstmt.setString(4,department_name);
        pstmt.setString(5,position_name);
        pstmt.setString(6,date_of_birth);
        pstmt.setString(7,mobile_number);
        pstmt.setString(8,is_eligible);
        pstmt.setInt(9, f_id); 
        
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
 
    public int delete (int f_id){
     try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);
        
        String deleteQuery = "DELETE FROM faculty_profile WHERE faculty_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
        pstmt.setInt(1, f_id); 
        
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

    public int view_profile() {
        try{
            // This is where we will put codes that will interact with databases
            //1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getTextQuery = "SELECT faculty_id, last_name, first_name, gender, department_name, position_name, date_of_birth, mobile_number, is_eligible FROM faculty_profile";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            ResultSet rst = pstmt.executeQuery();
            
            vfaculty_idlist.clear();
            vlast_namelist.clear();
            vfirst_namelist.clear();
            vgenderlist.clear();
            vdepartment_namelist.clear();
            vposition_namelist.clear();
            vdate_of_birthlist.clear();
            vmobile_numberlist.clear();
            vis_eligiblelist.clear();
            
            while (rst.next()) {
                vfaculty_id = rst.getInt("faculty_id"); 
                vfaculty_idlist.add(vfaculty_id);
                vlast_name = rst.getString("last_name"); 
                vlast_namelist.add(vlast_name);
                vfirst_name = rst.getString("first_name"); 
                vfirst_namelist.add(vfirst_name);
                vgender = rst.getString("gender"); 
                vgenderlist.add(vgender);
                vdepartment_name = rst.getString("department_name");
                vdepartment_namelist.add(vdepartment_name);
                vposition_name = rst.getString("position_name");
                vposition_namelist.add(vposition_name);
                vdate_of_birth = rst.getString("date_of_birth");
                vdate_of_birthlist.add(vdate_of_birth);
                vmobile_number = rst.getString("mobile_number");
                vmobile_numberlist.add(vmobile_number);
                vis_eligible = rst.getString("is_eligible");
                vis_eligiblelist.add(vis_eligible);
                
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
    
 public int view_profile_sID(int f_id) {
        try{
            // This is where we will put codes that will interact with databases
            //1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getTextQuery = "SELECT faculty_id, last_name, first_name, gender, department_name, position_name, "
                    + "date_of_birth, mobile_number, is_eligible FROM faculty_profile WHERE faculty_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            pstmt.setInt(1, f_id); 
            ResultSet rst = pstmt.executeQuery();
            
            vfaculty_idlist.clear();
            vlast_namelist.clear();
            vfirst_namelist.clear();
            vgenderlist.clear();
            vdepartment_namelist.clear();
            vposition_namelist.clear();
            vdate_of_birthlist.clear();
            vmobile_numberlist.clear();
            vis_eligiblelist.clear();
            
            while (rst.next()) {
                vfaculty_id = rst.getInt("faculty_id"); 
                vfaculty_idlist.add(vfaculty_id);
                vlast_name = rst.getString("last_name"); 
                vlast_namelist.add(vlast_name);
                vfirst_name = rst.getString("first_name"); 
                vfirst_namelist.add(vfirst_name);
                vgender = rst.getString("gender"); 
                vgenderlist.add(vgender);
                vdepartment_name = rst.getString("department_name");
                vdepartment_namelist.add(vdepartment_name);
                vposition_name = rst.getString("position_name");
                vposition_namelist.add(vposition_name);
                vdate_of_birth = rst.getString("date_of_birth");
                vdate_of_birthlist.add(vdate_of_birth);
                vmobile_number = rst.getString("mobile_number");
                vmobile_numberlist.add(vmobile_number);
                vis_eligible = rst.getString("is_eligible");
                vis_eligiblelist.add(vis_eligible);
                
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
 
    public static void main (String args[]) {
        
        faculty_profile S = new faculty_profile();
        
        S.register_profile();
        
    }
    
}


