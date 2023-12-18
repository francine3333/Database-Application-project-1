<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Faculty Recruitment Decision</title>
</head>
<body>
    <form action="facultyrecruitment_delete_processing.jsp" method="post">
        <jsp:useBean id="RDEL" class="recruitmentpackage.deleterecruit" scope="session"/>
        <h1>Recruitment Deleting Menu</h1>
        <%
            RDEL.faculty_delete();
            int selectedRecruitmentId = Integer.parseInt(request.getParameter("recruitment_id"));
            RDEL.getRecruitmentDetails(selectedRecruitmentId);
        %>  
        Recruitment ID: 
        <input type="text" id="recruitment_id" name="recruitment_id" value="<%= selectedRecruitmentId %>" readonly><br>
        Applicant ID: <input type="text" id="applicant_id" name="applicant_id" value="<%= RDEL.applicant_id %>" readonly><br>
        Interview Date: <input type="date" id="interview_date" name="interview_date" value="<%= RDEL.interview_date %>" readonly><br>
        Recruitment Status: <input type="text" id="recruitment_status" name="recruitment_status" value="<%= RDEL.recruitment_status %>" readonly><br>
        Onboarding Date: <input type="date" id="onboarding_date" name="onboarding_date" value="<%= RDEL.onboarding_date %>" readonly><br>  
        <input type="submit" value="Submit">
    </form>
</body>
</html>