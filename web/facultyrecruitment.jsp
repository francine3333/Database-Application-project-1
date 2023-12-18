<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Recruitment Decision</title>
    </head>
    <body>
        <form action="facultyrecruitment_processing.jsp" method="post">
            <jsp:useBean id="REC" class="recruitmentpackage.recruitment" scope="session"/>
            <h1>Recruitment Process</h1>
            <%
                REC.faculty_recruitment();
            %>

            Recruitment ID: <%= REC.recruitment_id%><br>

            Applicant ID: <select id="applicant_id" name="applicant_id">
                <%
                    for (int i = 0; i < REC.applicant_idlist.size(); i++) {
                %>
                <option value="<%= REC.applicant_idlist.get(i)%>"><%= REC.applicant_idlist.get(i)%></option>

                <% }
                %>
            </select><br>
            
            Interview Date: <input type="date" id="interview_date" name="interview_date" 
                      <% if (!REC.interview_datelist.isEmpty()) { %>
                          value="<%= REC.interview_datelist.get(0) %>"
                      <% } %> ><br>

            Recruitment Status: <select id="recruitment_status" name="recruitment_status">
                <%
                if (REC.recruitment_statuslist != null && !REC.recruitment_statuslist.isEmpty()) {
                    %>
                    <option value="Accepted" <% if ("Accepted".equals(REC.recruitment_statuslist.get(0))) { %>selected<% } %>>Accepted</option>
                    <option value="Rejected" <% if ("Rejected".equals(REC.recruitment_statuslist.get(0))) { %>selected<% } %>>Rejected</option>
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
                        <% if (!REC.onboarding_datelist.isEmpty()) { %>
                            value="<%= REC.onboarding_datelist.get(0) %>"
                        <% } %> ><br>
                
            </select><br>
            <input type="submit" value="Submit">
    </body>
</html>
