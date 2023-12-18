<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="recruitmentpackage.advancementreport"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Advancements Report by Academic Year</title>
    </head>
    <body>
        <h1>Faculty Advancement Report</h1>
        <%
            String startYear = request.getParameter("acad_year_start");
            String endYear = request.getParameter("acad_year_end");

            if (startYear != null && endYear != null && !startYear.isEmpty() && !endYear.isEmpty()) {
                advancementreport facultyReportGenerator = new advancementreport();
                facultyReportGenerator.generateFacultyReportByYearRange(startYear, endYear);

                List<Integer> facultyIdList = facultyReportGenerator.getFacultyIdList();
                List<String> lastNameList = facultyReportGenerator.getLastNameList();
                List<String> firstNameList = facultyReportGenerator.getFirstNameList();
                List<String> genderList = facultyReportGenerator.getGenderList();
                List<String> departmentNameList = facultyReportGenerator.getDepartmentNameList();
                List<String> positionNameList = facultyReportGenerator.getPositionNameList();
                List<String> mobileNumberList = facultyReportGenerator.getMobileNumberList();
                List<String> achievementDescriptionList = facultyReportGenerator.getAchievementDescriptionList();
                List<String> contributionList = facultyReportGenerator.getContributionList();
                List<String> projectNameList = facultyReportGenerator.getProjectNameList();
                List<String> qualificationsList = facultyReportGenerator.getQualificationsList();
                List<String> promotionStatusList = facultyReportGenerator.getPromotionStatusList();                
                List<String> acadYearList = facultyReportGenerator.getAcadYearList();
                
                int totalFacultyCount = 0;
                    try {
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
                        String countQuery = "SELECT COUNT(DISTINCT faculty_id) AS total_count FROM faculty_profile WHERE acad_year BETWEEN ? AND ?";
                        try (PreparedStatement countStmt = conn.prepareStatement(countQuery)) {
                            countStmt.setString(1, startYear);
                            countStmt.setString(2, endYear);
                            try (ResultSet countResult = countStmt.executeQuery()) {
                                if (countResult.next()) {
                                    totalFacultyCount = countResult.getInt("total_count");
                                }
                            }
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                              
        %>
        <h3>Faculty Count: <%= totalFacultyCount%></h3>
        <table border="1">
            <tr>
                <th>Faculty ID</th>
                <th>Last Name</th>
                <th>First Name</th>
                <th>Gender</th>
                <th>Department</th>
                <th>Position</th>
                <th>Mobile Number</th>
                <th>Achievement Description</th>
                <th>Contribution</th>
                <th>Projects</th>
                <th>Qualifications</th>
                <th>Promotion Status</th>                
                <th>Academic Year</th>
            </tr>

            <%
                for (int i = 0; i < facultyIdList.size(); i++) {
            %>
                <tr>
                    <td><%= facultyIdList.get(i) %></td>
                    <td><%= lastNameList.get(i)%></td>
                    <td><%= firstNameList.get(i)%></td>
                    <td><%= genderList.get(i)%></td>
                    <td><%= departmentNameList.get(i)%></td>
                    <td><%= positionNameList.get(i)%></td>
                    <td><%= mobileNumberList.get(i)%></td>
                    <td><%= achievementDescriptionList.get(i)%></td>
                    <td><%= contributionList.get(i)%></td>
                    <td><%= projectNameList.get(i)%></td>
                    <td><%= qualificationsList.get(i)%></td>      
                    <td><%= promotionStatusList.get(i)%></td> 
                    <td><%= acadYearList.get(i) %></td>
                </tr>
            <%
                }
                // Check if no data is available
                if (facultyIdList.isEmpty()) {
            %>
                <tr>
                    <td colspan="2">No data available for the selected academic year.</td>
                </tr>
            <%
                }
            } else {
            %>
                <tr>
                    <td colspan="2">Please select academic years to generate the report.</td>
                </tr>
            <%
            }
            %>
        </table>
        <a href="report_advancements.jsp" class="back-button">Back</a>
    </body>
</html>