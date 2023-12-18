/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facultymgt;

/**
 *
 * @author ccslearner
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class application {

    // fields for application
    public int applicant_id;
    public String last_name;
    public String first_name;
    public String gender;
    public String position_name;
    public String application_date;
    public String qualifications;
    public String date_of_birth;
    public String mobile_number;
    public String experiences;
    public int recom_faculty_id;
    
    public int vapplicant_id;
    public String vlast_name;
    public String vfirst_name;
    public String vgender;
    public String vposition_name;
    public String vapplication_date;
    public String vqualifications;
    public String vdate_of_birth;
    public String vmobile_number;
    public String vexperiences;
    public int vrecom_faculty_id;
  
    // lists to store data
    public ArrayList<Integer> applicant_idList = new ArrayList<>();
    public ArrayList<String> lastNameList = new ArrayList<>();
    public ArrayList<String> firstNameList = new ArrayList<>();
    public ArrayList<String> genderList = new ArrayList<>();
    public ArrayList<String> positionNameList = new ArrayList<>();
    public ArrayList<String> applicationDateList = new ArrayList<>();
    public ArrayList<String> qualificationsList = new ArrayList<>();
    public ArrayList<String> dateOfBirthList = new ArrayList<>();
    public ArrayList<String> mobileNumberList = new ArrayList<>();
    public ArrayList<String> experiencesList = new ArrayList<>();
    public ArrayList<Integer> recomFacultyIdList = new ArrayList<>();
    
    public ArrayList<Integer> vapplicant_idList = new ArrayList<>();
    public ArrayList<String> vlast_nameList = new ArrayList<>();
    public ArrayList<String> vfirst_nameList = new ArrayList<>();
    public ArrayList<String> vgender_List = new ArrayList<>();
    public ArrayList<String> vposition_nameList = new ArrayList<>();
    public ArrayList<String> vapplication_dateList = new ArrayList<>();
    public ArrayList<String> vqualificationsList = new ArrayList<>();
    public ArrayList<String> vdate_of_birthList = new ArrayList<>();
    public ArrayList<String> vmobile_numberList = new ArrayList<>();
    public ArrayList<String> vexperiencesList = new ArrayList<>();
    public ArrayList<Integer> vrecom_faculty_idList = new ArrayList<>();
    
      // lists to store data
    public ArrayList<Integer> dapplicant_idList = new ArrayList<>();
    public ArrayList<String> dlastNameList = new ArrayList<>();
    public ArrayList<String> dfirstNameList = new ArrayList<>();
    public ArrayList<String> dgenderList = new ArrayList<>();
    public ArrayList<String> dpositionNameList = new ArrayList<>();
    public ArrayList<String> dapplicationDateList = new ArrayList<>();
    public ArrayList<String> dqualificationsList = new ArrayList<>();
    public ArrayList<String> ddateOfBirthList = new ArrayList<>();
    public ArrayList<String> dmobileNumberList = new ArrayList<>();
    public ArrayList<String> dexperiencesList = new ArrayList<>();
    public ArrayList<Integer> drecomFacultyIdList = new ArrayList<>();
    
    
    public ArrayList<String> modify_list = new ArrayList<>();
    public ArrayList<String> view_list = new ArrayList<>();
          

    public application(){}

    public int register_application() {
        
        try{
            // This is where we will put codes that will interact with databases
            //1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);

              // Fetch the new Applicant ID
            String getMaxIdQuery = "SELECT MAX(applicant_id) + 1 AS newID FROM applicant";
            PreparedStatement pstmt = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt.executeQuery();

            String getLastNamesQuery = "SELECT last_name FROM applicant";
            PreparedStatement pstmt1 = conn.prepareStatement(getLastNamesQuery);
            ResultSet rst1 = pstmt1.executeQuery();

            String getFirstNamesQuery = "SELECT first_name FROM applicant";
            PreparedStatement pstmt2 = conn.prepareStatement(getFirstNamesQuery);
            ResultSet rst2 = pstmt2.executeQuery();

            String getGenderQuery = "SELECT gender FROM applicant";
            PreparedStatement pstmt3 = conn.prepareStatement(getGenderQuery);
            ResultSet rst3 = pstmt3.executeQuery();

            String getPositionNameQuery = "SELECT position_name FROM position";
            PreparedStatement pstmt4 = conn.prepareStatement(getPositionNameQuery);
            ResultSet rst4 = pstmt4.executeQuery();

            String getApplicationDateQuery = "SELECT application_date FROM applicant";
            PreparedStatement pstmt5 = conn.prepareStatement(getApplicationDateQuery);
            ResultSet rst5 = pstmt5.executeQuery();

            String getQualificationsQuery = "SELECT qualifications FROM applicant";
            PreparedStatement pstmt6 = conn.prepareStatement(getQualificationsQuery);
            ResultSet rst6 = pstmt6.executeQuery();

            String getDateOfBirthQuery = "SELECT date_of_birth FROM applicant";
            PreparedStatement pstmt7 = conn.prepareStatement(getDateOfBirthQuery);
            ResultSet rst7 = pstmt7.executeQuery();

            String getMobileNumberQuery = "SELECT mobile_number FROM applicant";
            PreparedStatement pstmt8 = conn.prepareStatement(getMobileNumberQuery);
            ResultSet rst8 = pstmt8.executeQuery();

            String getExperiencesQuery = "SELECT experiences FROM applicant";
            PreparedStatement pstmt9 = conn.prepareStatement(getExperiencesQuery);
            ResultSet rst9 = pstmt9.executeQuery();

            String getRecomFacultyIdQuery = "SELECT recom_faculty_id FROM applicant";
            PreparedStatement pstmt10 = conn.prepareStatement(getRecomFacultyIdQuery);
            ResultSet rst10 = pstmt10.executeQuery();
            
            applicant_idList.clear();
            lastNameList.clear();
            firstNameList.clear();
            genderList.clear();
            positionNameList.clear();
            applicationDateList.clear();
            qualificationsList.clear();
            dateOfBirthList.clear();
            mobileNumberList.clear();
            experiencesList.clear();
            recomFacultyIdList.clear();
            
            while (rst.next()) {
                applicant_id = rst.getInt("newID");
            }

            while (rst1.next()) {
                last_name = rst1.getString("last_name");
                lastNameList.add(last_name);
            }
            
            // Fetch first_name
            while (rst2.next()) {
                first_name = rst2.getString("first_name");
                firstNameList.add(first_name);
            }
            
            // Fetch gender
            genderList.add("Female");
            genderList.add("Male");
            
            // Fetch position_name
            while (rst4.next()) {
                position_name = rst4.getString("position_name");
                positionNameList.add(position_name);
            }
            
   
           
            
            applicationDateList.add(application_date);
            
            // Fetch qualifications
            while (rst6.next()) {
                qualifications = rst6.getString("qualifications");
                qualificationsList.add(qualifications);
            }
            
            // Fetch date_of_birth
            dateOfBirthList.add(date_of_birth);
            
            // Fetch mobile_number
            while (rst8.next()) {
                mobile_number = rst8.getString("mobile_number");
                mobileNumberList.add(mobile_number);
            }
            
            // Fetch experiences
            while (rst9.next()) {
                experiences = rst9.getString("experiences");
                experiencesList.add(experiences);
            }
            
            // Fetch recom_faculty_id
            while (rst10.next()) {
                recom_faculty_id = rst10.getInt("recom_faculty_id");
                recomFacultyIdList.add(recom_faculty_id);
            }

            conn.commit();
            pstmt.close();
            conn.close();

            System.out.println("Successful");
            return 1;

            
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0;
    }
}

public int insertApplication(String lastName, String firstName, String gender, String positionName, String applicationDate, String qualifications, String dateOfBirth, String mobileNumber, String experiences, int recomFacultyId) {
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);

        // Fetch the new Applicant ID
        String getMaxIdQuery = "SELECT MAX(applicant_id) + 1 AS newID FROM applicant";
        PreparedStatement pstmt1 = conn.prepareStatement(getMaxIdQuery);
        ResultSet rst = pstmt1.executeQuery();

        while(rst.next()){
            applicant_id = rst.getInt("newID");
        }
       
        // Insert into applicant table
        String insertApplicationQuery = "INSERT INTO applicant (applicant_id, last_name, first_name, gender, position_name, application_date, qualifications, date_of_birth, mobile_number, experiences, recom_faculty_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(insertApplicationQuery);
        pstmt.setInt(1, applicant_id);
        pstmt.setString(2, lastName);
        pstmt.setString(3, firstName);
        pstmt.setString(4, gender);
        pstmt.setString(5, positionName);
        pstmt.setString(6, applicationDate);
        pstmt.setString(7, qualifications);
        pstmt.setString(8, dateOfBirth);
        pstmt.setString(9, mobileNumber);
        pstmt.setString(10, experiences);
        pstmt.setInt(11, recomFacultyId);

        pstmt.executeUpdate();

        conn.commit();
        pstmt.close();
        conn.close();

        System.out.println("Application inserted successfully");
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
    modify_list.add("position_name");
    modify_list.add("application_date");
    modify_list.add("qualifications");
    modify_list.add("date_of_birth");
    modify_list.add("mobile_number");
    modify_list.add("experiences");
    modify_list.add("recom_faculty_id");

    view_list.add("all");
    view_list.add("specific id");

    return 1;
}

public int modify_get(int applicantId) {
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);

        String getTextQuery = "SELECT applicant_id, last_name, first_name, gender, position_name, application_date, qualifications, date_of_birth, mobile_number, experiences, recom_faculty_id "
                + " FROM applicant WHERE applicant_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
        pstmt.setInt(1, applicantId);
        ResultSet rst = pstmt.executeQuery();
        
        String getLastNameQuery = "SELECT last_name FROM applicant";
        PreparedStatement pstmt1 = conn.prepareStatement(getLastNameQuery);
        ResultSet rst1 = pstmt1.executeQuery();
        
        String getFirstNameQuery = "SELECT first_name FROM applicant";
        PreparedStatement pstmt2 = conn.prepareStatement(getFirstNameQuery);
        ResultSet rst2 = pstmt2.executeQuery();
        
        String getGenderQuery = "SELECT gender FROM applicant";
        PreparedStatement pstmt3 = conn.prepareStatement(getGenderQuery);
        ResultSet rst3 = pstmt3.executeQuery();
        
        String getPositionNameQuery = "SELECT position_name FROM applicant";
        PreparedStatement pstmt4 = conn.prepareStatement(getPositionNameQuery);
        ResultSet rst4 = pstmt4.executeQuery();
        
        String getApplicationDate = "SELECT application_date FROM applicant";
        PreparedStatement pstmt5 = conn.prepareStatement(getApplicationDate);
        ResultSet rst5 = pstmt5.executeQuery();
        
        String getQualifications= "SELECT qualifications FROM applicant";
        PreparedStatement pstmt6 = conn.prepareStatement(getQualifications);
        ResultSet rst6 = pstmt6.executeQuery();
        
         String getDateOfBirthQuery = "SELECT date_of_birth FROM applicant";
        PreparedStatement pstmt7 = conn.prepareStatement(getDateOfBirthQuery);
        ResultSet rst7 = pstmt7.executeQuery();
        
        String getMobileNumberQuery = "SELECT mobile_number FROM applicant";
        PreparedStatement pstmt8 = conn.prepareStatement(getMobileNumberQuery);
        ResultSet rst8 = pstmt8.executeQuery();
        
        String getExperiencesQuery = "SELECT experiences FROM applicant";
        PreparedStatement pstmt9 = conn.prepareStatement(getExperiencesQuery);
        ResultSet rst9 = pstmt9.executeQuery();
        
        String getRecomFacultyIdQuery = "SELECT recom_faculty_id FROM applicant";
        PreparedStatement pstmt10 = conn.prepareStatement(getRecomFacultyIdQuery);
        ResultSet rst10 = pstmt10.executeQuery();
        
        applicant_idList.clear();
        lastNameList.clear();
        firstNameList.clear();
        genderList.clear();
        positionNameList.clear();
        applicationDateList.clear();
        qualificationsList.clear();
        dateOfBirthList.clear();
        mobileNumberList.clear();
        experiencesList.clear();
        recomFacultyIdList.clear();

        while (rst.next()) {
            applicant_id = rst.getInt("applicant_id");
            last_name = rst.getString("last_name");
            first_name = rst.getString("first_name");
            gender = rst.getString("gender");
            position_name = rst.getString("position_name");
            application_date = rst.getString("application_date");
            qualifications = rst.getString("qualifications");
            date_of_birth = rst.getString("date_of_birth");
            mobile_number = rst.getString("mobile_number");
            experiences = rst.getString("experiences");
            recom_faculty_id = rst.getInt("recom_faculty_id");

           
        }
        
         while (rst1.next()) {
            last_name = rst1.getString("last_name");
            lastNameList.add(last_name);
        }

        while (rst2.next()) {
            first_name = rst2.getString("first_name");
            firstNameList.add(first_name);
        }

        while (rst3.next()) {
            gender = rst3.getString("gender");
            genderList.add(gender);
        }

        while (rst4.next()) {
            position_name = rst4.getString("position_name");
            positionNameList.add(position_name);
        }

        while (rst5.next()) {
            application_date = rst5.getString("application_date");
            applicationDateList.add(application_date);
        }

        while (rst6.next()) {
            qualifications = rst6.getString("qualifications");
            qualificationsList.add(qualifications);
        }

        while (rst7.next()) {
            date_of_birth = rst7.getString("date_of_birth");
            dateOfBirthList.add(date_of_birth);
        }

        while (rst8.next()) {
            mobile_number = rst8.getString("mobile_number");
            mobileNumberList.add(mobile_number);
        }

        while (rst9.next()) {
            experiences = rst9.getString("experiences");
            experiencesList.add(experiences);
        }

        while (rst10.next()) {
            recom_faculty_id = rst10.getInt("recom_faculty_id");
            recomFacultyIdList.add(recom_faculty_id);
        }

        

        return 1;
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0;
    }
}


    public int modify_all(int applicantId, String lastName, String firstName, String gender, String positionName, String applicationDate, String qualifications, String dateOfBirth, String mobileNumber, String experiences) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
    
            String updateApplicationQuery = "UPDATE applicant SET last_name = ?, first_name = ?, gender = ?, position_name = ?, application_date = ?, qualifications = ?, date_of_birth = ?, "
                    + "mobile_number = ?, experiences = ? WHERE applicant_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(updateApplicationQuery);
            pstmt.setString(1, lastName);
            pstmt.setString(2, firstName);
            pstmt.setString(3, gender);
            pstmt.setString(4, positionName);
            pstmt.setString(5, applicationDate);
            pstmt.setString(6, qualifications);
            pstmt.setString(7, dateOfBirth);
            pstmt.setString(8, mobileNumber);
            pstmt.setString(9, experiences);
          
            pstmt.setInt(10, applicantId);
    
            int rowsAffected = pstmt.executeUpdate();
    
            conn.commit();
    
            if (rowsAffected > 0) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int deleteApplication(int applicantId) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
    
            String deleteQuery = "DELETE FROM applicant WHERE applicant_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setInt(1, applicantId);
    
            int rowsAffected = pstmt.executeUpdate();
    
            conn.commit();
    
            if (rowsAffected > 0) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int viewApplication() {
        try {
            // This is where we will put codes that will interact with databases
            // 1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
    
            String getTextQuery = "SELECT applicant_id, last_name, first_name, gender, position_name, application_date, qualifications, date_of_birth, mobile_number, experiences, recom_faculty_id FROM applicant";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            ResultSet rst = pstmt.executeQuery();
    
            applicant_idList.clear();
            lastNameList.clear();
            firstNameList.clear();
            genderList.clear();
            positionNameList.clear();
            applicationDateList.clear();
            qualificationsList.clear();
            dateOfBirthList.clear();
            mobileNumberList.clear();
            experiencesList.clear();
            recomFacultyIdList.clear();
    
            while (rst.next()) {
                applicant_id = rst.getInt("applicant_id");
                applicant_idList.add(applicant_id);
                last_name = rst.getString("last_name");
                lastNameList.add(last_name);
                first_name = rst.getString("first_name");
                firstNameList.add(first_name);
                gender = rst.getString("gender");
                genderList.add(gender);
                position_name = rst.getString("position_name");
                positionNameList.add(position_name);
                application_date = rst.getString("application_date");
                applicationDateList.add(application_date);
                qualifications = rst.getString("qualifications");
                qualificationsList.add(qualifications);
                date_of_birth = rst.getString("date_of_birth");
                dateOfBirthList.add(date_of_birth);
                mobile_number = rst.getString("mobile_number");
                mobileNumberList.add(mobile_number);
                experiences = rst.getString("experiences");
                experiencesList.add(experiences);
                recom_faculty_id = rst.getInt("recom_faculty_id");
                recomFacultyIdList.add(recom_faculty_id);
            }
    
            conn.commit();
            pstmt.close();
            conn.close();
    
            System.out.println("Successful");
            return 1;
    
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    
    }

    public int viewApplicationByID(int a_id) {
        try {
            // This is where we will put codes that will interact with databases
            // 1.0 connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
    
            String getTextQuery = "SELECT applicant_id, last_name, first_name, gender, position_name, application_date, qualifications, date_of_birth, mobile_number, experiences, recom_faculty_id FROM applicant WHERE applicant_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
            pstmt.setInt(1, a_id);
            
            
            ResultSet rst = pstmt.executeQuery();
            
            
            dapplicant_idList.clear();
            dlastNameList.clear();
            dfirstNameList.clear();
            dgenderList.clear();
            dpositionNameList.clear();
            dapplicationDateList.clear();
            dqualificationsList.clear();
            ddateOfBirthList.clear();
            dmobileNumberList.clear();
            dexperiencesList.clear();
            drecomFacultyIdList.clear();
    
            while (rst.next()) {
                applicant_id = rst.getInt("applicant_id");
                dapplicant_idList.add(applicant_id);
                last_name = rst.getString("last_name");
                dlastNameList.add(last_name);
                first_name = rst.getString("first_name");
                dfirstNameList.add(first_name);
                gender = rst.getString("gender");
                dgenderList.add(gender);
                position_name = rst.getString("position_name");
                dpositionNameList.add(position_name);
                application_date = rst.getString("application_date");
                dapplicationDateList.add(application_date);
                qualifications = rst.getString("qualifications");
                dqualificationsList.add(qualifications);
                date_of_birth = rst.getString("date_of_birth");
                ddateOfBirthList.add(date_of_birth);
                mobile_number = rst.getString("mobile_number");
                dmobileNumberList.add(mobile_number);
                experiences = rst.getString("experiences");
                dexperiencesList.add(experiences);
                recom_faculty_id = rst.getInt("recom_faculty_id");
                drecomFacultyIdList.add(recom_faculty_id);
            }
    
            conn.commit();
            pstmt.close();
            conn.close();
    
            System.out.println("Successful");
            return 1;
    
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    
    }
    
    public static void main(String args[]) {
    
        application L = new application();
    
        L.register_application();
       
    }
}
       
    
    
    
    







