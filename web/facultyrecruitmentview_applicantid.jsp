<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="recruitmentpackage.viewrecruit"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Applicant ID Filter</title>
</head>
<body>
    <h1>View Menu For all Applicant IDs</h1>
    <%
        viewrecruit facultyReportGenerator = new viewrecruit();
        facultyReportGenerator.generateFacultyViewApplicantId();

            // Get data from the report generator
            List<Integer> recruitmentIdList = facultyReportGenerator.recruitmentIdList;
            List<Integer> applicantIdList = facultyReportGenerator.applicantIdList;
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
                    <td><%= applicantIdList.get(i) %></td>
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