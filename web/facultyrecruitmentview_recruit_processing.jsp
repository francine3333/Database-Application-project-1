<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="recruitmentpackage.viewrecruit"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Faculty Recruitment Information</title>
</head>
<body>
    <h1>View Menu For Specific Recruits</h1>
    <%
        String selectedRecruitmentId = request.getParameter("recruitment_id");

        if (selectedRecruitmentId != null && !selectedRecruitmentId.isEmpty()) {
            int selectedId = Integer.parseInt(selectedRecruitmentId);

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
            int index = recruitmentIdList.indexOf(selectedId);
            if (index != -1) {
        %>
        <tr>
            <td><%= recruitmentIdList.get(index) %></td>
            <td><%= applicantIdList.get(index) %></td>
            <td><%= interviewDateList.get(index) %></td>
            <td><%= recruitmentStatusList.get(index) %></td>
            <td><%= onboardingDateList.get(index) %></td>
        </tr>
        <%
            } else {
        %>
        <tr>
            <td colspan="5">No data available for the selected recruitment ID.</td>
        </tr>
        <%
            }
        %>
    </table>

    <%
        } else {
    %>
    <p>No recruitment ID selected.</p>
    <%
        }
    %>

</body>
</html>