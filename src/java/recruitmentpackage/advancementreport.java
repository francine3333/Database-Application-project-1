package recruitmentpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class advancementreport {
    
    public List<Integer> facultyIdList = new ArrayList<>();
    public List<String> lastNameList = new ArrayList<>();
    public List<String> firstNameList = new ArrayList<>();
    public List<String> genderList = new ArrayList<>();
    public List<String> departmentNameList = new ArrayList<>();
    public List<String> positionNameList = new ArrayList<>();
    public List<String> mobileNumberList = new ArrayList<>();
    public List<String> achievementDescriptionList = new ArrayList<>();
    public List<String> contributionList = new ArrayList<>();
    public List<String> projectNameList = new ArrayList<>();
    public List<String> qualificationsList = new ArrayList<>();
    public List<String> promotionStatusList = new ArrayList<>();
    public List<String> acadYearList = new ArrayList<>();
    
    public void generateFacultyReportByYearRange(String startYear, String endYear) {
        facultyIdList.clear();
        lastNameList.clear();
        firstNameList.clear();
        genderList.clear();
        departmentNameList.clear();
        positionNameList.clear();
        mobileNumberList.clear();
        achievementDescriptionList.clear();
        contributionList.clear();
        projectNameList.clear();
        qualificationsList.clear();
        promotionStatusList.clear();        
        acadYearList.clear();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            String query = 
                      "SELECT f.faculty_id, f.last_name, f.first_name, f.gender, f.department_name, f.position_name, "
                    + "f.mobile_number, f.acad_year, a.achievement_description, a.contribution, a.project_name, "
                    + "p.qualifications, p.promotion_status "
                    + "FROM faculty_profile f "
                    + "JOIN faculty_achievements a ON f.faculty_id = a.faculty_id "
                    + "JOIN promotion p ON f.faculty_id = p.faculty_id "
                    + "WHERE f.acad_year BETWEEN ? AND ?";

            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, startYear);
                pstmt.setString(2, endYear);

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        facultyIdList.add(rs.getInt("faculty_id"));
                        lastNameList.add(rs.getString("last_name"));
                        firstNameList.add(rs.getString("first_name"));
                        genderList.add(rs.getString("gender"));
                        departmentNameList.add(rs.getString("department_name"));
                        positionNameList.add(rs.getString("position_name"));
                        mobileNumberList.add(rs.getString("mobile_number"));
                        achievementDescriptionList.add(rs.getString("achievement_description"));
                        contributionList.add(rs.getString("contribution"));
                        projectNameList.add(rs.getString("project_name"));
                        qualificationsList.add(rs.getString("qualifications")); 
                        promotionStatusList.add(rs.getString("qualifications"));    
                        acadYearList.add(rs.getString("acad_year"));
                    }
                }
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Integer> getFacultyIdList() {
        return facultyIdList;
    }
    
    public List<String> getLastNameList() {
        return lastNameList;
    }

    public List<String> getFirstNameList() {
        return firstNameList;
    }

    public List<String> getGenderList() {
        return genderList;
    }

    public List<String> getDepartmentNameList() {
        return departmentNameList;
    }

    public List<String> getPositionNameList() {
        return positionNameList;
    }

    public List<String> getMobileNumberList() {
        return mobileNumberList;
    }

    public List<String> getAchievementDescriptionList() {
        return achievementDescriptionList;
    }

    public List<String> getContributionList() {
        return contributionList;
    }

    public List<String> getProjectNameList() {
        return projectNameList;
    }

    public List<String> getQualificationsList() {
        return qualificationsList;
    }

    public List<String> getPromotionStatusList() {
        return promotionStatusList;
    }
    
    public List<String> getAcadYearList() {
        return acadYearList;
    }
}