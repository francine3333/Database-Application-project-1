<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Faculty Recruitment</title>
</head>
<body>
    <h1>Filter for a Specific Recruitment ID</h1>
    <form action="facultyrecruitmentview_recruit_processing.jsp" method="post">
        <jsp:useBean id="R" class="recruitmentpackage.viewrecruit" scope="session"/>
        
        <% 
        R.getRecruitmentIDList();
        %>
        
        Specific Recruitment ID to Filter: 
        <select id="recruitment_id" name="recruitment_id">
            <%
                for (int i = 0; i < R.recruitmentIdList.size(); i++) {
            %>
            <option value="<%= R.recruitmentIdList.get(i) %>"><%= R.recruitmentIdList.get(i) %></option>
            <% }
            %>
        </select><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>