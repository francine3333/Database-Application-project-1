<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Faculty Recruitment Decision</title>
</head>
<body>
    <form action="facultyrecruitment_modify_processing.jsp" method="post">
        <jsp:useBean id="RMOD" class="recruitmentpackage.modify" scope="session"/>
        <h1>Recruitment Modifying Menu</h1>        
        <% int selectedRecruitmentId = Integer.parseInt(request.getParameter("recruitment_id")); %>
        
    <%
        RMOD.faculty_modify(selectedRecruitmentId);
    %>
    <%
        RMOD.getApplicantIDList();
    %>

        

    <h2>Selected Values</h2>
    <table border="1">
        <tr>
            <th>Recruitment ID</th>
            <th>Applicant ID</th>
            <th>Interview Date</th>
            <th>Recruitment Status</th>
            <th>Onboarding Date</th>
        </tr>
        <%
            for (int i = 0; i < RMOD.recruitment_idlist.size(); i++) {
        %>
        <tr>
            <td><%= RMOD.recruitment_idlist.get(i) %></td>
            <td><%= RMOD.applicant_idlist.get(i) %></td>
            <td><%= RMOD.interview_datelist.get(i) %></td>
            <td><%= RMOD.recruitment_statuslist.get(i) %></td>
            <td><%= RMOD.onboarding_datelist.get(i) %></td>
        </tr>
        <%
            }
        %>
    </table>
    <br/>
        
        Recruitment ID: 
        <input type="text" id="recruitment_id" name="recruitment_id" value="<%= selectedRecruitmentId %>" readonly><br>

        Applicant ID: <select id="applicant_id" name="applicant_id">
            <%
            for (int i = 0; i < RMOD.applicant_idlist.size(); i++) {
            %>
            <option value="<%= RMOD.applicant_idlist.get(i) %>"><%= RMOD.applicant_idlist.get(i) %></option>
            <% }
            %>
        </select><br>
        
        Interview Date: <input type="date" id="interview_date" name="interview_date" 
                  <% if (!RMOD.interview_datelist.isEmpty()) { %>
                      value="<%= RMOD.interview_datelist.get(0) %>"
                  <% } %> ><br>

        Recruitment Status: <select id="recruitment_status" name="recruitment_status">
            <%
            if (RMOD.recruitment_statuslist != null && !RMOD.recruitment_statuslist.isEmpty()) {
                %>
                <option value="Accepted" <% if ("Accepted".equals(RMOD.recruitment_statuslist.get(0))) { %>selected<% } %>>Accepted</option>
                <option value="Rejected" <% if ("Rejected".equals(RMOD.recruitment_statuslist.get(0))) { %>selected<% } %>>Rejected</option>
                <%
            } else {
                %>
                <option value="Accepted">Accepted</option>
                <option value="Rejected">Rejected</option>
                <%
            }
            %>
        </select><br>
        
        Onboarding Date: <input type="date" id="onboarding_date" name="onboarding_date" 
                    <% if (!RMOD.onboarding_datelist.isEmpty()) { %>
                        value="<%= RMOD.onboarding_datelist.get(0) %>"
                    <% } %> ><br>
            
        <input type="submit" value="Submit">
    </form>
</body>
</html>
