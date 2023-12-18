<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="recruitmentpackage.viewrecruit"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Faculty Recruitment Table</title>
</head>
<body>
    <h1>View Menu For all Recruits</h1>
    <%
        viewrecruit facultyReportGenerator = new viewrecruit();
        facultyReportGenerator.generateFacultyView();

            List<Integer> recruitmentIdList = facultyReportGenerator.recruitmentIdList;
            List<Integer> applicantIdList = facultyReportGenerator.applicantIdList;
            List<String> interviewDateList = facultyReportGenerator.interviewDateList;
            List<String> recruitmentStatusList = facultyReportGenerator.recruitmentStatusList;
            List<String> onboardingDateList = facultyReportGenerator.onboardingDateList;
        %>

        <table border="1">
            <tr>
                <th>Recruitment ID</th>
                <th>Applicant ID</th>
                <th>Interview Date</th>
                <th>Recruitment Status</th>
                <th>Onboarding Date</th>
            </tr>

            <%
                for (int i = 0; i < recruitmentIdList.size(); i++) {
            %>
                <tr>
                    <td><%= recruitmentIdList.get(i) %></td>
                    <td><%= applicantIdList.get(i) %></td>
                    <td><%= interviewDateList.get(i) %></td>
                    <td><%= recruitmentStatusList.get(i) %></td>
                    <td><%= onboardingDateList.get(i) %></td>
                </tr>
            <%
                }

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