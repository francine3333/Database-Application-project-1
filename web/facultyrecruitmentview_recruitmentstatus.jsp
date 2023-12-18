<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="recruitmentpackage.viewrecruit"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Recruitment Status Filter</title>
</head>
<body>
    <h1>View Menu For all Recruit Status</h1>
    <%-- Retrieve and Display Faculty Report --%>
    <%
        // Instantiate viewrecruit
        viewrecruit facultyReportGenerator = new viewrecruit();
        facultyReportGenerator.generateFacultyViewRecruitmentStatus();

            // Get data from the report generator
            List<Integer> recruitmentIdList = facultyReportGenerator.recruitmentIdList;
            List<String> recruitmentStatusList = facultyReportGenerator.recruitmentStatusList;
        %>

        <table border="1">
            <tr>
                <th>Recruitment ID</th>
                <th>Interview Date</th>
            </tr>

            <%
                for (int i = 0; i < recruitmentIdList.size(); i++) {
            %>
                <tr>
                    <td><%= recruitmentIdList.get(i) %></td>
                    <td><%= recruitmentStatusList.get(i) %></td>
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