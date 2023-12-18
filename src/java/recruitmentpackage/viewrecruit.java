package recruitmentpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class viewrecruit {
    
    public int recruitment_id;
    public int applicant_id;
    public String interview_date;
    public String recruitment_status;
    public String onboarding_date;

    public List<Integer> recruitmentIdList = new ArrayList<>();
    public List<Integer> applicantIdList = new ArrayList<>();
    public List<String> interviewDateList = new ArrayList<>();
    public List<String> recruitmentStatusList = new ArrayList<>();
    public List<String> onboardingDateList = new ArrayList<>();

    public void generateFacultyView() {
        recruitmentIdList.clear();
        applicantIdList.clear();
        interviewDateList.clear();
        recruitmentStatusList.clear();
        onboardingDateList.clear();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String query = "SELECT r.recruitment_id, r.applicant_id, r.interview_date, r.recruitment_status, r.onboarding_date " +
                           "FROM faculty_recruitment r ";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        recruitmentIdList.add(rs.getInt("recruitment_id"));
                        applicantIdList.add(rs.getInt("applicant_id"));
                        interviewDateList.add(rs.getString("interview_date"));
                        recruitmentStatusList.add(rs.getString("recruitment_status"));
                        onboardingDateList.add(rs.getString("onboarding_date"));
                    }
                }
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void getRecruitmentIDList() {
        recruitmentIdList.clear();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String query = "SELECT recruitment_id FROM faculty_recruitment";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        recruitmentIdList.add(rs.getInt("recruitment_id"));
                    }
                }
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void generateFacultyViewApplicantId() {
        recruitmentIdList.clear();
        applicantIdList.clear();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String query = "SELECT r.recruitment_id, r.applicant_id " +
                           "FROM faculty_recruitment r ";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        recruitmentIdList.add(rs.getInt("recruitment_id"));
                        applicantIdList.add(rs.getInt("applicant_id"));
                    }
                }
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void generateFacultyViewInterviewDate() {
        recruitmentIdList.clear();
        interviewDateList.clear();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String query = "SELECT r.recruitment_id, r.interview_date " +
                           "FROM faculty_recruitment r ";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        recruitmentIdList.add(rs.getInt("recruitment_id"));
                        interviewDateList.add(rs.getString("interview_date"));
                    }
                }
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void generateFacultyViewRecruitmentStatus() {
        recruitmentIdList.clear();
        recruitmentStatusList.clear();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String query = "SELECT r.recruitment_id, r.recruitment_status " +
                           "FROM faculty_recruitment r ";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        recruitmentIdList.add(rs.getInt("recruitment_id"));
                        recruitmentStatusList.add(rs.getString("recruitment_status"));
                    }
                }
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void generateFacultyViewOnboardingDate() {
        recruitmentIdList.clear();
        onboardingDateList.clear();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String query = "SELECT r.recruitment_id, r.onboarding_date " +
                           "FROM faculty_recruitment r ";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        recruitmentIdList.add(rs.getInt("recruitment_id"));
                        onboardingDateList.add(rs.getString("onboarding_date"));
                    }
                }
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void getRecruitmentID() {
    recruitmentIdList.clear();


    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?user=root&password=12345678");

        String query = "SELECT recruitment_id";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    recruitmentIdList.add(rs.getInt("recruitment_id"));
                }
            }
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
    
    public List<Integer> getRecruitmentIdList() {
        return recruitmentIdList;
    }

    public List<Integer> getApplicantIdList() {
        return applicantIdList;
    }

    public List<String> getInterviewDateList() {
        return interviewDateList;
    }

    public List<String> getRecruitmentStatusList() {
        return recruitmentStatusList;
    }

    public List<String> getOnboardingDateList() {
        return onboardingDateList;
    }
}