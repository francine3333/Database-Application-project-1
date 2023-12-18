<%@ page import="java.sql.*, java.io.*" %>

<%
    int recruitmentId = Integer.parseInt(request.getParameter("recruitment_id"));
    int status = 0;  

    String deletionMessage = ""; 

    if (recruitmentId > 0) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?user=root&password=12345678")) {
            conn.setAutoCommit(false); 

            String deleteDecisionQuery = "DELETE FROM faculty_decision WHERE recruitment_id = ?";
            try (PreparedStatement decisionPstmt = conn.prepareStatement(deleteDecisionQuery)) {
                decisionPstmt.setInt(1, recruitmentId);
                decisionPstmt.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error deleting from faculty_decision: " + e.getMessage());
                conn.rollback(); 
            }

            String deleteQuery = "DELETE FROM faculty_recruitment WHERE recruitment_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(deleteQuery)) {
                pstmt.setInt(1, recruitmentId);
                status = pstmt.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error deleting from faculty_recruitment: " + e.getMessage());
                conn.rollback(); 
            }

            conn.commit(); 
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
            status = 0;
        }
        
        if (status == 1) {
            deletionMessage = "Deleted Recruitment ID: " + recruitmentId;
        } else {
            deletionMessage = "Failed to delete Recruitment ID: " + recruitmentId;
        }
    }
%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Faculty Recruitment Decision</title>
</head>
<body>
    <h1><%= deletionMessage %></h1><br>

    <form action="faculty_admin.html" method="post">
        <input type="submit" value="Return to Menu">
    </form>
</body>
</html>
