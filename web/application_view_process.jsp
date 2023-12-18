<%-- 
    Document   : application_view_process
    Created on : 11 21, 23, 8:17:46 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application View Process</title>
    </head>
    <body>
        
    <jsp:useBean id="J" class="facultymgt.application" scope="session"/>
    
    <%
        String selected = request.getParameter("view_list");
        J.viewApplication();
    %>

    <% if ("all".equals(selected)) { %>     
    <h2>View Faculty Application</h2>  
        <table border="1">
            <tr>
                <th>Applicant ID</th>
                <th>Last name</th>
                <th>First name</th>
                <th>Gender</th>
                <th>Position name</th>
                <th>Application date</th>
                <th>Qualifications</th>
                <th>Date of birth</th>
                <th>Mobile number</th>
                <th>Experiences</th>
                <th>Recom faculty ID</th>
                
            </tr>
            <% for (int i = 0; i < J.applicant_idList.size(); i++) { %>
                <tr>
                    <td><%= J.applicant_idList.get(i) %></td>
                    <td><%= J.lastNameList.get(i) %></td>
                    <td><%= J.firstNameList.get(i) %></td>
                    <td><%= J.genderList.get(i) %></td>
                    <td><%= J.positionNameList.get(i) %></td>
                    <td><%= J.applicationDateList.get(i) %></td>
                    <td><%= J.qualificationsList.get(i) %></td>
                    <td><%= J.dateOfBirthList.get(i) %></td>
                    <td><%= J.mobileNumberList.get(i) %></td>
                    <td><%= J.experiencesList.get(i) %></td>
                     <td><%= J.recomFacultyIdList.get(i) %></td>
                </tr>
            <% } %>
            <% if (J.applicant_idList.isEmpty()) { %>
                <tr>
                    <td colspan="7">No data available for the selected Application</td>
                </tr>
            <% } %>
            <tr>
                <td colspan="7">
                    <input type="button" value="Return to Application Menu" onclick="window.location.href='L_application_decision.jsp'">
                </td>
            </tr>
        </table>
    <% } else if ("specific id".equals(selected)) { %> 
    <h2>Select Applicant ID</h2>  
        <form action="application_view_process_rID.jsp" method="post">
        Applicant ID: 
        <select id="h_id" name="h_id">
            <% for (int i = 0; i < J.applicant_idList.size(); i++) { %>
                <option value="<%= J.applicant_idList.get(i) %>"><%= J.applicant_idList.get(i) %></option>
            <% } %>
        </select>
        <br>
        <input type="submit" value="Submit">
        </form>
    <% } else { %>
        <input type="button" value="Return to Application Menu" onclick="window.location.href='L_application_decision.jsp'">
    <% } %>
        
        
        
    </body>
</html>
