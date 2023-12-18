<%-- 
    Document   : registerpromotion_processing
    Created on : 11 18, 23, 2:01:52 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <ahead>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Faculty Process</title> <!-- Corrected closing tag for the title -->
    </head>
    <body>
        <form action="promotion_menu.jsp" method="post">
            <jsp:useBean id="P" class="facultymgt.faculty_promotion" scope="session"/>
            <%
                int facultyId = Integer.parseInt(request.getParameter("faculty_id"));
                int achievementId = Integer.parseInt(request.getParameter("achievement_id"));
                String qualifications = request.getParameter("qualifications");
                String promotionStatus = request.getParameter("promotion_status");
                String transactionDate = request.getParameter("transaction_date");

                P.faculty_id = facultyId;
                P.achievement_id = achievementId;
                P.qualifications = qualifications;
                P.promotion_status = promotionStatus;
                P.transaction_date = transactionDate;
               
            if ( qualifications == null || qualifications.isEmpty() || promotionStatus == null || promotionStatus.isEmpty() || transactionDate == null || transactionDate.isEmpty()) {
        %>
            <h1>Registering Faculty Promotion Failed!</h1>
        <%
            } else {
                int status = P.insertPromotion(facultyId, achievementId, qualifications, promotionStatus, transactionDate);

                if (status == 1) {
        %>
            <h1>Registering Faculty Promotion Successful!</h1><br>
        <% 
                } else { 
        %>
            <h1>Registering Faculty Promotion Failed!</h1>
        <% 
                }
            }
        %>

        <input type="submit" value="Return to Menu">
    </form>
</body>
</html>