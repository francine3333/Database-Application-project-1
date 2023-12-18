<%-- 
    Document   : reporteligible_process
    Created on : 11 16, 23, 1:26:35 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Faculty Report by Academic Year</title>
</head>
<body>
    <%-- Retrieve and Display Faculty Report based on the selected Academic Year --%>
    <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
    <h2>Accepted Faculty Report by Academic Year</h2>  
    
    <% 
        String startYear = request.getParameter("acad_year_start");
        String endYear = request.getParameter("acad_year_end");

        if (startYear != null && endYear != null && !startYear.isEmpty() && !endYear.isEmpty()) {
            F.generateFacultyReportByYearRange(startYear, endYear);
            F.generateFacultyReportByYearRangeTotal(startYear, endYear);
    %>
    <br>Total Hired Faculty: <%= F.total %><br><br>
    
    <table border="1">
        <tr>
            <th>Hiring ID</th>
            <th>Last Name</th>
            <th>First Name</th>
            <th>Gender</th>
            <th>Position</th>
            <th>Application Date</th>
            <th>Qualifications</th>
            <th>Experiences</th>
            <th>Academic Activities</th>
            <th>Responsibilities</th>
            <th>Mobile Number</th>
            <th>Status</th>
            <th>Academic Year</th>
        </tr>
        <% for (int i = 0; i < F.rhiring_idlist.size(); i++) { %>
            <tr>
                    <td><%= F.rhiring_idlist.get(i) %></td>
                    <td><%= F.rlast_namelist.get(i) %></td>
                    <td><%= F.rfirst_namelist.get(i) %></td>
                    <td><%= F.rgender_list.get(i) %></td>
                    <td><%= F.rposition_namelist.get(i) %></td>
                    <td><%= F.rapplication_datelist.get(i) %></td>
                    <td><%= F.rqualifications_list.get(i) %></td>
                    <td><%= F.rexperiences_list.get(i) %></td>
                    <td><%= F.racad_act_list.get(i) %></td>
                    <td><%= F.rresponsibility_list.get(i) %></td>
                    <td><%= F.rmobile_number_list.get(i) %></td>
                    <td><%= F.rrstatus_list.get(i) %></td>
                    <td><%= F.ryear_list.get(i) %></td>  
               </tr>
        <% } %>
        <% if (F.rhiring_idlist.isEmpty()) { %>
            <tr>
                <td colspan="13">No data available for the selected academic year.</td>
            </tr>
        <% } %>
    </table>
    <br>
    <input type="button" value="Return Eligible Process Menu" onclick="window.location.href='report_Eligible.jsp'">
    
    <% } else { %>
        <p>Please provide both start and end academic years.</p>
    <% } %>
</body>
</html>
