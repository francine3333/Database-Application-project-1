

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="registerapplication_processing.jsp" method="post">
            <jsp:useBean id="J" class="facultymgt.application" scope="session"/>
            <h2>Application Registration</h2>  
            <% 
                J.register_application();
            %>
                    
            Applicant ID: <%= J.applicant_id %><br>

            Last Name: <input type="text" id="last_name" name="last_name"><br>

            First Name: <input type="text" id="first_name" name="first_name"><br>

            Gender: <select id="gender" name="gender">
                <% 
                    for (int i = 0; i < J.genderList.size(); i++) {  
                %>
                     <option value="<%= J.genderList.get(i) %>"><%= J.genderList.get(i) %></option>
                <% } 
                %>
            </select><br>

             Position Name: <select id="position_name" name="position_name">
                <% 
                    for (int i = 0; i < J.positionNameList.size(); i++) {  
                %>
                    <option value="<%= J.positionNameList.get(i) %>"><%= J.positionNameList.get(i) %></option>

                <% } 
                %>
            </select><br>
          
            Application date:<input type="date" id="applicationDateList" name="application_date"
                                     
                      <% if (!J.applicationDateList.isEmpty()) { %>
                          value="<%= J.applicationDateList.get(0) %>"
                      <% } %> ><br>


            Qualifications: <input type="text" id="qualifications" name="qualifications"><br>

            Date of birth: <input type="date" id="date_of_birth" name="date_of_birth" 
                      <% if (!J.dateOfBirthList.isEmpty()) { %>
                          value="<%= J.dateOfBirthList.get(0) %>"
                      <% } %> ><br>

            Mobile Number: <input type="text" id="mobile_number" name="mobile_number"><br>

            Experiences: <input type="text" id="experiences" name="experiences"><br>

            Recommended Faculty ID: 
    <select id="recom_faculty_id" name="recom_faculty_id">
        <%
            for (int i = 0; i < J.recomFacultyIdList.size(); i++) {
        %>
            <option value="<%= J.recomFacultyIdList.get(i) %>"><%= J.recomFacultyIdList.get(i) %></option>
        <%
            }
        %>
    </select><br>

            <input type="submit" value="Submit">
     
    </body>
</html>
