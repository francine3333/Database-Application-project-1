<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="recruitmentpackage.viewrecruit"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Onboarding Date Filter </title>
</head>
<body>
    <h1>View Menu For all Recruit Onboarding Date</h1>
    <%-- Retrieve and Display Faculty Report --%>
    <%
        // Instantiate viewrecruit
        viewrecruit facultyReportGenerator = new viewrecruit();
        facultyReportGenerator.generateFacultyViewOnboardingDate();

            // Get data from the report generator
            List<Integer> recruitmentIdList = facultyReportGenerator.recruitmentIdList;
            List<String> onboardingDateList = facultyReportGenerator.onboardingDateList;
        %>

        <table border="1">
            <tr>
                <th>Recruitment ID</th>
                <th>Applicant ID</th>
            </tr>

            <%
                for (int i = 0; i < recruitmentIdList.size(); i++) {
            %>
                <tr>
                    <td><%= recruitmentIdList.get(i) %></td>
                    <td><%= onboardingDateList.get(i) %></td>
                </tr>
            <%
                }

                // Check if no data is available
                if (recruitmentIdList.isEmpty()) {
            %>
                <tr>
                    <td colspan="2">No data available.</td>
                </tr>
            <%
                }
            %>
        </table>
    </body>
</html>