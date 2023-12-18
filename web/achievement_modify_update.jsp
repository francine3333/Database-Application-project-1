<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Faculty Achievement</title>
</head>
<body>
    <form action="achievement_modify_process.jsp" method="post">
    <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>
    
    <% 
        int h_id = Integer.parseInt(request.getParameter("h_id"));
        L.modify_get2(h_id); 
        L.viewAchievementByID(h_id);
    %>
    
    <h2>Choose to modify</h2>
    
    <table border="1">
        <tr>
            <th>Achievement ID</th>
            <th>Faculty ID</th>
            <th>Achievement Description</th>
            <th>Contribution</th>
            <th>Project Name</th>
        </tr>
      <% 
    int iValue = 0; // Declare outside the loop
    String iAchieve = ""; // Initialize variables
    String iCont = "";
    String iAporj = "";
    
    for (int i = 0; i < L.dachievement_idList.size(); i++) {
        iValue = L.dfaculty_idList.get(i); // Assign value inside the loop
        iAchieve = L.dachievement_descriptionList.get(i);
        iCont = L.dcontributionList.get(i);
        iAporj = L.dproject_nameList.get(i);
%>
<tr>
    <td><%= L.dachievement_idList.get(i) %></td>
    <td><%= iValue %></td>
    <td><%= iAchieve %></td>
    <td><%= iCont %></td>
    <td><%= iAporj %></td>
</tr>
<% } %>
<% if (L.dachievement_idList.isEmpty()) { %>
<tr>
    <td colspan="5">No data available for the selected achievement ID.</td>
</tr>
<% } %>
</table>

    <input type="hidden" name="h_id" value="<%= h_id %>">
    Achievement ID: <%= h_id %><br>
    Faculty ID: <%= iValue %><br>

    Achievement Description: <input type="text" id="achievement_description" name="achievement_description" value="<%= iAchieve %>"><br>
    Contribution: <input type="text" id="contribution" name="contribution" value="<%= iCont %>"><br>
    Project name: <input type="text" id="project_name" name="project_name" value="<%= iAporj %>"><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>