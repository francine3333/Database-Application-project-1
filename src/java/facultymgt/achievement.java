package facultymgt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;

public class achievement {
    
    // Fields for faculty_achievements table
    public int achievement_id;
    public int faculty_id;
    public String achievement_description;
    public String contribution;
    public String project_name;
    public int machievement_id;

    public int dachievement;
    public int dfaculty;
    public String dachievement_description;
    public String dcontribution;
    public String dproject_name;

    // Lists to store data
    public ArrayList<Integer> achievement_idList = new ArrayList<>();
    public ArrayList<Integer> faculty_idList = new ArrayList<>();
    public ArrayList<String> achievement_descriptionList = new ArrayList<>();
    public ArrayList<String> contributionList = new ArrayList<>();
    public ArrayList<String> project_nameList = new ArrayList<>();

    public ArrayList<Integer> dachievement_idList = new ArrayList<>();
    public ArrayList<Integer> dfaculty_idList = new ArrayList<>();
    public ArrayList<String> dachievement_descriptionList = new ArrayList<>();
    public ArrayList<String> dcontributionList = new ArrayList<>();
    public ArrayList<String> dproject_nameList = new ArrayList<>();
    
    public ArrayList<String> modify_list = new ArrayList<>();
    public ArrayList<String> view_list = new ArrayList<>();
    
    public achievement() {}

    // Method to register achievements
    public int registerAchievements() {
        try {
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);

            // SQL query to retrieve data from faculty_achievements
            // 1. To get the maximum achievement_id + 1 from the faculty_achievements table
        String getMaxAchievementIdQuery = "SELECT MAX(achievement_id) + 1 AS newID FROM faculty_achievements";
        PreparedStatement pstmt = conn.prepareStatement(getMaxAchievementIdQuery);
        ResultSet rst1 = pstmt.executeQuery();
        
        // 2. To get the faculty IDs from the faculty_achievements table
        String getFacultyIdsQuery = "SELECT DISTINCT faculty_id FROM faculty_achievements";
        PreparedStatement pstmt2 = conn.prepareStatement(getFacultyIdsQuery);
        ResultSet rst2 = pstmt2.executeQuery();
        
        // 3. To get the achievement descriptions and contributions for a specific faculty_id
        String getAchievementDetailsQuery = "SELECT achievement_description, contribution FROM faculty_achievements";
        PreparedStatement pstmt3 = conn.prepareStatement(getAchievementDetailsQuery);
        ResultSet rst3 = pstmt3.executeQuery();

        // 4. To get the project names for a specific faculty_id
        String getProjectNamesQuery = "SELECT DISTINCT project_name FROM faculty_achievements ";
        PreparedStatement pstmt4 = conn.prepareStatement(getProjectNamesQuery);
        ResultSet rst4 = pstmt4.executeQuery();
        
        // 5. To get distinct contributions for a specific faculty_id
        String getContributionsQuery = "SELECT DISTINCT contribution FROM faculty_achievements ";
        PreparedStatement pstmt5 = conn.prepareStatement(getContributionsQuery);
        ResultSet rst5 = pstmt5.executeQuery();
        
        String getIDQuery = "SELECT achievement_id FROM faculty_achievements ";
        PreparedStatement pstmt6 = conn.prepareStatement(getIDQuery);
        ResultSet rst6 = pstmt6.executeQuery();
        
            // Clear lists before fetching new data
            achievement_idList.clear();
            faculty_idList.clear();
            achievement_descriptionList.clear();
            contributionList.clear();
            project_nameList.clear();
            
            while(rst1.next()){
                
                achievement_id = rst1.getInt("newID");
            }
            
            while(rst2.next()){
                faculty_id = rst2.getInt("faculty_id");
                faculty_idList.add(faculty_id);
            }
            
            while(rst3.next()){
                achievement_description = rst3.getString("achievement_description");
                achievement_descriptionList.add(achievement_description);
                
            }
            
            while(rst4.next()){
                contribution = rst4.getString("contribution");
                contributionList.add(contribution);
;            }
            
            while(rst5.next()){
                project_name = rst5.getString("project_name");
                project_nameList.add(project_name);
            }
            
            while (rst6.next()) {
            machievement_id = rst6.getInt("achievement_id");
            achievement_idList.add(machievement_id);  // Correct the variable name here
            }

       
            // Commit and close resources
            conn.commit();
            pstmt.close();
            conn.close();

            System.out.println("Achievements fetched successfully");
            return 1;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int getID(){
        
          try {
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
            
            String getIDQuery = "SELECT achievement_id FROM faculty_achievements ";
            PreparedStatement pstmt6 = conn.prepareStatement(getIDQuery);
            ResultSet rst6 = pstmt6.executeQuery();
            
            achievement_idList.clear();
            
            while (rst6.next()) {
            machievement_id = rst6.getInt("achievement_id");
            achievement_idList.add(machievement_id);  // Correct the variable name here
            
              }
            conn.commit();
            pstmt6.close();
            conn.close();
            

            System.out.println("Achievements fetched successfully");
            return 1;
            
          
            
            
          }
            catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }

    // Method to insert achievement information into the database
    public int insertAchievement(int facultyId, String achievementDescription, String contribution, String projectName) {
        try {
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);

            // SQL query to get the new achievement_id
            String getMaxIdQuery = "SELECT MAX(achievement_id) + 1 AS newID FROM faculty_achievements";
            PreparedStatement pstmt1 = conn.prepareStatement(getMaxIdQuery);
            ResultSet rst = pstmt1.executeQuery();
            
            while (rst.next()) {
                achievement_id = rst.getInt("newID");
            }

            // Insert into faculty_achievements table
            String insertAchievementQuery = "INSERT INTO faculty_achievements (achievement_id, faculty_id, achievement_description, contribution, project_name) "
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertAchievementQuery);
            pstmt.setInt(1, achievement_id);
            pstmt.setInt(2, facultyId);
            pstmt.setString(3, achievementDescription);
            pstmt.setString(4, contribution);
            pstmt.setString(5, projectName);
            pstmt.executeUpdate();

            // Commit and close resources
            conn.commit();
            pstmt.close();
            conn.close();

            System.out.println("Achievement inserted successfully");
            return 1;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

     public int modify_ach() {
       
       modify_list.clear();
       view_list.clear();
       
        modify_list.add("all");
        modify_list.add("faculty_id");
        modify_list.add("achievement_description");
        modify_list.add("contribution");
        modify_list.add("project_name");
        
        view_list.add("all");
        view_list.add("specific id");
        
       return 1;
      
     }
     
    public int modify_get2(int achieveId){
    try{
        Connection conn;
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);

        String getTextQuery = "SELECT achievement_id, faculty_id, achievement_description, contribution, project_name "
                + " FROM faculty_achievements WHERE achievement_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(getTextQuery);
        pstmt.setInt(1, achievement_id); 
        ResultSet rst = pstmt.executeQuery();
                    
        String getFacultyIdsQuery = "SELECT DISTINCT faculty_id FROM faculty_achievements";
        PreparedStatement pstmt2 = conn.prepareStatement(getFacultyIdsQuery);
        ResultSet rst2 = pstmt2.executeQuery();
        
        String getAchievementDetailsQuery = "SELECT DISTINCT achievement_description FROM faculty_achievements";
        PreparedStatement pstmt3 = conn.prepareStatement(getAchievementDetailsQuery);
        ResultSet rst3 = pstmt3.executeQuery();

        String getContributionsQuery = "SELECT DISTINCT contribution FROM faculty_achievements";
        PreparedStatement pstmt4 = conn.prepareStatement(getContributionsQuery);
        ResultSet rst4 = pstmt4.executeQuery();

        String getProjectNamesQuery = "SELECT DISTINCT project_name FROM faculty_achievements";
        PreparedStatement pstmt5 = conn.prepareStatement(getProjectNamesQuery);
        ResultSet rst5 = pstmt5.executeQuery();

        // Clear lists before fetching new data
        achievement_idList.clear();
        faculty_idList.clear();
        achievement_descriptionList.clear();
        contributionList.clear();
        project_nameList.clear();
        
        while (rst.next()) {
            faculty_id = rst.getInt("faculty_id");
            faculty_idList.add(faculty_id);
            achievement_description = rst.getString("achievement_description");
            achievement_descriptionList.add(achievement_description);
            contribution = rst.getString("contribution");
            contributionList.add(contribution);
            project_name = rst.getString("project_name");
            project_nameList.add(project_name);
        }
        
        while (rst2.next()) {
            faculty_id = rst2.getInt("faculty_id");
            faculty_idList.add(faculty_id);
        }

        while (rst3.next()) {
            achievement_description = rst3.getString("achievement_description");
            achievement_descriptionList.add(achievement_description);
        }
        
        while (rst4.next()) {
            contribution = rst4.getString("contribution");
            contributionList.add(contribution);
        }

        while (rst5.next()) {
            project_name = rst5.getString("project_name");
            project_nameList.add(project_name);
        }

        // Commit and close resources
        conn.commit();
        pstmt.close();
        conn.close();

        return 1;
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0;
    }
}
  
    public int modifyAll(int achieveID, String newDescription, String newContribution, String newProjectName) {
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);

        String updateQuery = "UPDATE faculty_achievements SET achievement_description = ?, contribution = ?, project_name = ? WHERE achievement_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, newDescription);
        pstmt.setString(2, newContribution);
        pstmt.setString(3, newProjectName);
        pstmt.setInt(4, achieveID);

        int rowsAffected = pstmt.executeUpdate();

        conn.commit();
        pstmt.close();
        conn.close();

        if (rowsAffected > 0) {
            return 1;
        } else {
            return 0;
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0;
    }
}

    public int delete(int achieveID) {
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        System.out.println("Connection Successful");
        conn.setAutoCommit(false);
        
        String deleteAchievementQuery = "DELETE FROM faculty_achievements WHERE achievement_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(deleteAchievementQuery);
        pstmt.setInt(1, achieveID);
        
      int rowsAffected = pstmt.executeUpdate(); 
        
        conn.commit(); 
        
        if(rowsAffected > 0) {
            return 1; 
        } else {
            return 0; 
        }

    } catch (Exception e) {
        System.out.println(e.getMessage());
        return 0;
    }
}

    public int viewAchievement() {
        try {
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);

            // SQL query to retrieve data from faculty_achievements
            String getAchievementQuery = "SELECT achievement_id, faculty_id, achievement_description, contribution, project_name FROM faculty_achievements";
            PreparedStatement pstmt = conn.prepareStatement(getAchievementQuery);
            ResultSet rst = pstmt.executeQuery();

            // Clear lists before fetching new data
            dachievement_idList.clear();
            dfaculty_idList.clear();
            dachievement_descriptionList.clear();
            dcontributionList.clear();
            dproject_nameList.clear();

            while (rst.next()) {
                // Retrieve data from the result set
                dachievement = rst.getInt("achievement_id");
                dachievement_idList.add(dachievement);
                dfaculty = rst.getInt("faculty_id");
                dfaculty_idList.add(dfaculty);
                dachievement_description = rst.getString("achievement_description");
                dachievement_descriptionList.add(dachievement_description);
                dcontribution = rst.getString("contribution");
                dcontributionList.add(dcontribution);
                dproject_name = rst.getString("project_name");
                dproject_nameList.add(dproject_name);
            }

            // Commit and close resources
            conn.commit();
            pstmt.close();
            conn.close();

            System.out.println("Achievements fetched successfully");
            return 1;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int viewAchievementByID(int achievement_id) {
        try {
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBAPP?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            conn.setAutoCommit(false);
    
            // SQL query to retrieve data from faculty_achievements based on achievement_id
            String getAchievementByIDQuery = "SELECT achievement_id, faculty_id, achievement_description, contribution, project_name FROM faculty_achievements WHERE achievement_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(getAchievementByIDQuery);
            pstmt.setInt(1, achievement_id);
            ResultSet rst = pstmt.executeQuery();
    
            // Clear lists before fetching new data
            dachievement_idList.clear();
            dfaculty_idList.clear();
            dachievement_descriptionList.clear();
            dcontributionList.clear();
            dproject_nameList.clear();
    
            while (rst.next()) {
                // Retrieve data from the result set
                dachievement = rst.getInt("achievement_id");
                dachievement_idList.add(dachievement);
                dfaculty= rst.getInt("faculty_id");
                dfaculty_idList.add(dfaculty);
                dachievement_description = rst.getString("achievement_description");
                dachievement_descriptionList.add(dachievement_description);
                dcontribution = rst.getString("contribution");
                dcontributionList.add(dcontribution);
                dproject_name = rst.getString("project_name");
                dproject_nameList.add(dproject_name);

                   
            }
    
            // Commit and close resources
            conn.commit();
            pstmt.close();
            conn.close();
    
            System.out.println("Achievement fetched successfully");
            return 1;
    
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public static void main(String[] args) {
        achievement facultyAchievement = new achievement();

        // Fetch and print achievements
        facultyAchievement.registerAchievements();
        for (String description : facultyAchievement.achievement_descriptionList) {
            System.out.println(description);
        }

        // Example of inserting a new achievement
        /*facultyAchievement.insertAchievement(10007, "Example Achievement", "Example Contribution", "Example Project");
        facultyAchievement.registerAchievements(); // Fetch and print updated achievements*/
    }
}