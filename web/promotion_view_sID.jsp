<%-- 
    Document   : promotion_view_sID
    Created on : 11 21, 23, 1:16:49 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Faculty Promotion</title>
    </head>
    <body>
         <jsp:useBean id="P" class="facultymgt.faculty_promotion" scope="session"/>
         
        <% 
        int h_id = Integer.parseInt(request.getParameter("h_id"));
        P.view_promotion_sID(h_id);
    %>
    
  
     <h2>View Faculty Promotion</h2>  
        <table border="1">
            <tr>
                <th>Evaluation ID</th>
                <th>Faculty ID</th>
                <th>Achievement ID</th>
                <th>Qualifications</th>
                <th>Promotion Status</th>
                <th>Transaction Date</th>
       
            </tr>
            <% for (int i = 0; i < P.vevaluation_idlist.size(); i++) { %>
                <tr>
                    <td><%= P.vevaluation_idlist.get(i) %></td>
                   <td><%= P.vfaculty_idlist.get(i) %></td>
                   <td><%= P.vachievement_idlist.get(i) %></td>
                   <td><%= P.vqualificationslist.get(i) %></td>
                   <td><%= P.vpromotion_statuslist.get(i) %></td>
                   <td><%= P.vtransaction_datelist.get(i) %></td>
                </tr>
            <% } %>
            <% if (P.vevaluation_idlist.isEmpty()) { %>
                <tr>
                    <td colspan="6">No data available for the selected academic year.</td>
                </tr>
            <% } %>
            <tr>
                <td colspan="6">
                    <input type="button" value="Return to Promotion Menu" onclick="window.location.href='promotion_menu.jsp'">
                </td>
            </tr>
        </table>
    </body>
</html>
