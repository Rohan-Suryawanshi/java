<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Multiple Choice Test</title>
</head>
<body>
    <h1>Online Multiple Choice Test</h1>
    <form method="post">
        <% 
           
            String url = "jdbc:postgresql://localhost:5432/msg"; 
            String username = "postgres"; 
            String password = "root"; 
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            
           
            String sql = "SELECT * FROM questions ORDER BY RANDOM() LIMIT 1";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
           
            int score = 0;
            int questionCount = 0;
            
           
            while (resultSet.next()) {
                questionCount++;
                String question = resultSet.getString("questiontext");
                String correctAnswer = resultSet.getString("correctanswer");
                String choice1 = resultSet.getString("choice1");
                String choice2 = resultSet.getString("choice2");
                String choice3 = resultSet.getString("choice3");
                
               
                out.println("<p><b>Question " + questionCount + ":</b> " + question + "</p>");
                
                
                out.println("<input type='radio' name='question" + questionCount + "' value='" + choice1 + "'>" + choice1 + "<br>");
                out.println("<input type='radio' name='question" + questionCount + "' value='" + choice2 + "'>" + choice2 + "<br>");
                out.println("<input type='radio' name='question" + questionCount + "' value='" + choice3 + "'>" + choice3 + "<br>");
                
                
                String selectedAnswer = request.getParameter("question" + questionCount);
                if (selectedAnswer != null && selectedAnswer.equals(correctAnswer)) {
                    score++;
                }
            }
            
           
            resultSet.close();
            statement.close();
            connection.close();
        %>
        <br>
        <input type="submit" value="Next">
    </form>
    
    <%-- Display the score when the form is submitted --%>
    <% 
        if (request.getMethod().equals("POST")) {
            out.println("<h2>Total Score: " + score + "/" + questionCount + "</h2>");
        }
    %>
</body>
</html>
