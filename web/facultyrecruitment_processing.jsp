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
        <jsp:useBean id="REC" class="recruitmentpackage.recruitment" scope="session"/>
        <%
            int applicantId = Integer.parseInt(request.getParameter("applicant_id"));
            String interviewDate = request.getParameter("interview_date");
            String recruitmentStatus = request.getParameter("recruitment_status");
            String onboardingDate = request.getParameter("onboarding_date");

            REC.applicant_id = applicantId;
            REC.interview_date = interviewDate;
            REC.recruitment_status = recruitmentStatus;
            REC.onboarding_date = onboardingDate;
            
            int status = REC.insertRecruitment(applicantId, interviewDate, recruitmentStatus, onboardingDate);

            if (status == 1) {  
            %>  
                <h1>Recruiting Faculty Decision Successful!</h1><br>
            <% } else { 
            %>
                <h1>Recruiting Faculty Decision Failed!</h1>
            <% } 
            %>

            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>
