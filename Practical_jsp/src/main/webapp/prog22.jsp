<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Greeting Page</title>
</head>
<body>
    <h2>Greeting Page</h2>
    <%
        // Retrieve the user's name from the request
        String username = request.getParameter("username");
        
        // Get the current time on the server
         Date currentTime = new Date();
        
        SimpleDateFormat sdf = new SimpleDateFormat("HH");
        int hour = Integer.parseInt(sdf.format(currentTime));
        
        // Generate the greeting message based on the time of day
        String greeting;
        if (hour >= 0 && hour < 12) {
            greeting = "Good morning";
        } else if (hour >= 12 && hour < 18) {
            greeting = "Good afternoon";
        } else {
            greeting = "Good evening";
        }
    %>
    <form action="" method="post">
        Enter your name: <input type="text" name="username" required><br><br>
        <input type="submit" value="Greet">
    </form>
    
    <%
        if (request.getMethod().equals("POST")) {
    %>
            <h2><%= greeting %>, <%= username %>!</h2>
    <%
        }
    %>
</body>
</html>
