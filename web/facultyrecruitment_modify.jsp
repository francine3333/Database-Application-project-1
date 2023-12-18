<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Faculty Recruitment</title>
</head>
<body>
    <h1>Filter for a Specific Recruitment ID</h1>
    <form action="facultyrecruitment_modify_perform.jsp" method="post">
        <jsp:useBean id="RMOD" class="recruitmentpackage.modify" scope="session"/>
        
        <% 
        RMOD.getRecruitmentIDList();
        %>
        
        Obtain Specific Recruitment ID to Modify 
        <select id="recruitment_id" name="recruitment_id">
            <%
                for (int i = 0; i < RMOD.recruitment_idlist.size(); i++) {
            %>
            <option value="<%= RMOD.recruitment_idlist.get(i) %>"><%= RMOD.recruitment_idlist.get(i) %></option>
            <% }
            %>
        </select><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>