package recruitmentpackage;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class deleterecruit {
    
    public int recruitment_id;
    public int applicant_id;
    public String interview_date;
    public String recruitment_status;
    public String onboarding_date;

    public List<Integer> recruitment_idlist = new ArrayList<>();
    public List<Integer> applicant_idlist = new ArrayList<>();
    public List<String> interview_datelist = new ArrayList<>();
    public List<String> recruitment_statuslist = new ArrayList<>();
    public List<String> onboarding_datelist = new ArrayList<>();

    public void faculty_delete() {
    // Clear existing data
    recruitment_idlist.clear();
    applicant_idlist.clear();
    interview_datelist.clear();
    recruitment_statuslist.clear();
    onboarding_datelist.clear();

    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?user=root&password=12345678");

        String query = "SELECT recruitment_id, applicant_id, interview_date, recruitment_status, onboarding_date FROM faculty_recruitment";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    recruitment_idlist.add(rs.getInt("recruitment_id"));
                    applicant_idlist.add(rs.getInt("applicant_id"));
                    interview_datelist.add(rs.getString("interview_date"));
                    recruitment_statuslist.add(rs.getString("recruitment_status"));
                    onboarding_datelist.add(rs.getString("onboarding_date"));
                }
            }
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
    
    
    public void getRecruitmentDetails(int recruitment_id) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?user=root&password=12345678");

            String query = "SELECT applicant_id, interview_date, recruitment_status, onboarding_date FROM faculty_recruitment WHERE recruitment_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setInt(1, recruitment_id);
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        this.applicant_id = rs.getInt("applicant_id");
                        this.interview_date = rs.getString("interview_date");
                        this.recruitment_status = rs.getString("recruitment_status");
                        this.onboarding_date = rs.getString("onboarding_date");
                    }
                }
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public int deleteRecruitment(int recruitment_id) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?user=root&password=12345678");

            String deleteQuery = "DELETE FROM faculty_recruitment WHERE recruitment_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(deleteQuery)) {
                pstmt.setInt(1, recruitment_id);
                return pstmt.executeUpdate();
            } catch (Exception e) {
                System.out.println("SQL Exception: " + e.getMessage());
                return 0;
            }
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            return 0;
        }
    }
    
    
    
    public void getRecruitmentIDList() {
        recruitment_idlist.clear();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String query = "SELECT recruitment_id FROM faculty_recruitment";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        recruitment_idlist.add(rs.getInt("recruitment_id"));
                    }
                }
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}