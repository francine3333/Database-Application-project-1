<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Faculty Recruitment</title>
</head>
<body>
    <h1>Faculty Recruitment Deletion</h1>
    <form action="facultyrecruitment_delete_perform.jsp" method="post">
        <jsp:useBean id="RDEL" class="recruitmentpackage.deleterecruit" scope="session"/>
        
        <% 
        RDEL.getRecruitmentIDList();
        %>
        
        Select a Specific Recruitment ID to Delete 
        <select id="recruitment_id" name="recruitment_id">
            <%
                for (int i = 0; i < RDEL.recruitment_idlist.size(); i++) {
            %>
            <option value="<%= RDEL.recruitment_idlist.get(i) %>"><%= RDEL.recruitment_idlist.get(i) %></option>
            <% }
            %>
        </select><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>