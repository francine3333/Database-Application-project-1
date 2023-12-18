package recruitmentpackage;
import java.sql.*;
import java.util.*;
import java.sql.DriverManager;

public class recruitment {
    // Fields of Applicant
    public int recruitment_id;
    public int applicant_id;
    public String interview_date;
    public String recruitment_status;
    public String onboarding_date;
    
    public ArrayList<Integer> recruitment_idlist = new ArrayList<> ();
    public ArrayList<Integer> applicant_idlist = new ArrayList<> ();
    public ArrayList<String> interview_datelist = new ArrayList<> ();
    public ArrayList<String> recruitment_statuslist = new ArrayList<> ();
    public ArrayList<String> onboarding_datelist = new ArrayList<> ();
    
    
    public recruitment() {}

    public int faculty_recruitment() {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);       
            
            String getMaxIdQuery = "SELECT MAX(recruitment_id) + 1 AS newID FROM faculty_recruitment";
            PreparedStatement pstmt = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt.executeQuery();

            String getApplicantIdQuery = "SELECT applicant_id FROM applicant";
            PreparedStatement pstmt1 = conn.prepareStatement(getApplicantIdQuery);
            ResultSet rst1 = pstmt1.executeQuery();            
            
            String getInterviewDateQuery = "SELECT interview_date FROM faculty_recruitment";
            PreparedStatement pstmt2 = conn.prepareStatement(getInterviewDateQuery);
            ResultSet rst2 = pstmt2.executeQuery();
            
            String getRecruitmentStatusQuery = "SELECT recruitment_status FROM faculty_recruitment";
            PreparedStatement pstmt3 = conn.prepareStatement(getRecruitmentStatusQuery);
            ResultSet rst3 = pstmt3.executeQuery();
             
            String getOnboardingDateQuery = "SELECT onboarding_date FROM faculty_recruitment";
            PreparedStatement pstmt4 = conn.prepareStatement(getOnboardingDateQuery);
            ResultSet rst4 = pstmt4.executeQuery();
            
            recruitment_idlist.clear();
            applicant_idlist.clear();
            interview_datelist.clear();
            recruitment_statuslist.clear();    
            onboarding_datelist.clear();
                    
            while (rst.next()) {
            recruitment_id = rst.getInt("newID");
            }
            
            while (rst1.next()) {
                applicant_id = rst1.getInt("applicant_id");
                applicant_idlist.add(applicant_id);
            }
            
            while (rst2.next()) {
                interview_date = rst2.getString("interview_date");
                interview_datelist.add(interview_date);
            }

            while (rst3.next()) {
                recruitment_status = rst3.getString("recruitment_status");
                recruitment_statuslist.add(recruitment_status);
            }
            
            while (rst4.next()) {
                onboarding_date = rst4.getString("onboarding_date");
                onboarding_datelist.add("onboarding_date");
            }            
           
            conn.commit();
            pstmt.close();
            conn.close();   
            
        System.out.println("Succesful");
        return 1;
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int insertRecruitment(int applicant_id, String interview_date, String recruitment_status, String onboarding_date) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?user=root&password=12345678");
            System.out.println("Connection Successful!");
            conn.setAutoCommit(false);

            String getMaxIdQuery = "SELECT MAX(recruitment_id) + 1 AS newID FROM faculty_recruitment";
            PreparedStatement pstmt1 = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt1.executeQuery();

            while (rst.next()) {
                recruitment_id = rst.getInt("newID");
            }

            String insertQuery = "INSERT INTO faculty_recruitment(recruitment_id, applicant_id, interview_date, recruitment_status, onboarding_date)" + " VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
                pstmt.setInt(1, recruitment_id);
                pstmt.setInt(2, applicant_id);
                pstmt.setString(3, interview_date);
                pstmt.setString(4, recruitment_status);

                if (onboarding_date == null || onboarding_date.isEmpty()) {
                    pstmt.setNull(5, java.sql.Types.DATE);
                } else {
                    pstmt.setString(5, onboarding_date);
                }

                return pstmt.executeUpdate();
            } catch (SQLException e) {
                System.out.println("SQL Exception: " + e.getMessage());
                return 0;
            } finally {
                System.out.println("Recruitment values inserted successfully");
                conn.commit();
                conn.close();
            }
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            return 0;
        }
    }
        
    public static void main(String[] args) {
        recruitment R = new recruitment();        
        R.faculty_recruitment();
        
    }
}
