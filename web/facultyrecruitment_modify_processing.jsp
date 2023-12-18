<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, recruitmentpackage.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Recruitment Process</title>
    </head>
    <body>
        <form action="faculty_admin.html" method="post">
            <jsp:useBean id="RMOD" class="recruitmentpackage.modify" scope="session"/>
            <%
                int recruitmentId = Integer.parseInt(request.getParameter("recruitment_id"));
                int applicantId = Integer.parseInt(request.getParameter("applicant_id"));
                String interviewDate = request.getParameter("interview_date");
                String recruitmentStatus = request.getParameter("recruitment_status");
                String onboardingDate = request.getParameter("onboarding_date");
                
                RMOD.recruitment_id = recruitmentId;
                RMOD.applicant_id = applicantId;
                RMOD.interview_date = interviewDate;
                RMOD.recruitment_status = recruitmentStatus;
                RMOD.onboarding_date = onboardingDate;
                
                int status = RMOD.updateRecruitment(recruitmentId, applicantId, interviewDate, recruitmentStatus, onboardingDate);

                if (status == 1) {  
            %>  
                <h1>Modifying Faculty Decision Successful!</h1><br>
            <% } else { 
            %>
                <h1>Modifying Faculty Decision Failed!</h1>
            <% } 
            %>

            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>