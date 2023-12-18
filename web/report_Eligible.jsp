<%-- 
    Document   : registerdecision
    Created on : 11 14, 23, 10:34:57 PM
    Author     : ccslearner
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Advancement Report</title>
    </head>
    <body>
        <form action="reporteligible_process.jsp" method="post">
            <h1>Accepted Faculty Report by Academic Year</h1>
            Academic Year Start: <select id="acad_year_start" name="acad_year_start">
                <%
                    try {
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT acad_year FROM academic_year");
                        while (rs.next()) {
                            String acadYear = rs.getString("acad_year");
                %>
                                <option value="<%= acadYear %>"><%= acadYear %></option>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </select><br>
            Academic Year End: <select id="acad_year_end" name="acad_year_end">
                <%
                    try {
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT acad_year FROM academic_year");
                        while (rs.next()) {
                            String acadYear = rs.getString("acad_year");
                %>
                                <option value="<%= acadYear %>"><%= acadYear %></option>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </select><br>
            <input type="submit" value="Generate Report">
            <br><br><input type="button" value="Return Main Menu" onclick="window.location.href='faculty_admin.html'">
        </form>
    </body>
</html>