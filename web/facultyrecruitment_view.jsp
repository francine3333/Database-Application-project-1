<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filter Options</title>
</head>
<body>
    <h1>Recruitment View Menu</h1>
    <form id="filterForm" method="post">
        Filter:
        <select id="filterOption" name="filterOption">
            <option value="All">All</option>
            <option value="SpecificRecruit">Recruitment ID</option>
            <option value="ApplicantId">Applicant Id</option>
            <option value="InterviewDate">Interview Date</option>
            <option value="RecruitmentStatus">Recruitment Status</option>
            <option value="OnboardingDate">Onboarding Date</option>
        </select><br>

        <input type="button" value="Select" onclick="submitForm()">
    </form>

    <script>
        function submitForm() {
            var selectedOption = document.getElementById("filterOption").value;
            var form = document.getElementById("filterForm");

            switch (selectedOption) {
                case "All":
                    form.action = "facultyrecruitmentview_all.jsp";
                    break;
                case "SpecificRecruit":
                    form.action = "facultyrecruitmentview_recruit.jsp";
                    break;
                case "ApplicantId":
                    form.action = "facultyrecruitmentview_applicantid.jsp";
                    break;
                case "InterviewDate":
                    form.action = "facultyrecruitmentview_interviewdate.jsp";
                    break;
                case "RecruitmentStatus":
                    form.action = "facultyrecruitmentview_recruitmentstatus.jsp";
                    break;
                case "OnboardingDate":
                    form.action = "facultyrecruitmentview_onboarding_date.jsp";
                    break;
                default:
                    // Default action
                    form.action = "facultyrecruitmentmodify_all.jsp";
            }

            // Submit the form
            form.submit();
        }
    </script>
</body>
</html>