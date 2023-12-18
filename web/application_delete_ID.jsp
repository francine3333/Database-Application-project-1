<%-- 
    Document   : application_delete_ID
    Created on : 11 21, 23, 7:49:13 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application delete ID</title>
    </head>
    <body>
           <form action="application_delete_process.jsp" method="post">
        <jsp:useBean id="J" class="facultymgt.application" scope="session"/>
        
         <% 
        int a_id = Integer.parseInt(request.getParameter("a_id"));
        J.viewApplicationByID(a_id);
    %>
    <input type="hidden" name="a_id" value="<%= a_id %>">
    <h2>Faculty Application Delete</h2>  
    <table border="1">
        <tr>
            <th>applicant ID</th>
            <th>Last name</th>
            <th>First name</th>
            <th>Gender</th>
            <th>Position name</th>
            <th>Application date</th>
            <th>Qualifications</th>
            <th>Date of birth</th>
            <th>Mobile number</th>
            <th>Experiences</th>
            <th>Recom faculty id</th>
        </tr>
        <% for (int i = 0; i < J.dapplicant_idList.size(); i++) { %>
            <tr> 
                <td><%= J.dapplicant_idList.get(i) %></td>
                <td><%= J.dlastNameList.get(i) %></td>
                <td><%= J.dfirstNameList.get(i) %></td>`
                <td><%= J.dgenderList.get(i) %></td>
                <td><%= J.dpositionNameList.get(i) %></td>
                <td><%= J.dapplicationDateList.get(i) %></td>
                <td><%= J.dqualificationsList.get(i) %></td>
                <td><%= J.ddateOfBirthList.get(i) %></td>
                <td><%= J.dmobileNumberList.get(i) %></td>
                <td><%= J.dexperiencesList.get(i) %></td>
                <td><%= J.drecomFacultyIdList.get(i) %></td>
               
            </tr>
        <% } %>
      <% if (J.dapplicant_idList.isEmpty()) { %>
            <tr>
                <td colspan="7">No data available for the selected academic year.</td>
            </tr>
        <% } %>
    </table>
    

    <br><input type="submit" value="Delete">
</form>
    </body>
</html>
