<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Number to Words Converter</title>
</head>
<body>
    <h2>Number to Words Converter</h2>
    <form action="prog20.jsp" method="post">
        Enter a number: <input type="text" name="number" required><br><br>
        <input type="submit" value="Convert">
    </form>
    <%!
        String convertNumberToWords(int number) {
            // Define an array of words for digits
            String[] wordsArray = {"Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};
            
            // Convert the number to words
            StringBuilder wordsBuilder = new StringBuilder();
            while (number > 0) {
                int digit = number % 10;
                wordsBuilder.append(wordsArray[digit] + " ");
                number /= 10;
            }
            return wordsBuilder.toString().trim();
        }
    %>
    <%
        // Check if form is submitted and number is provided
        if (request.getMethod().equals("POST") && request.getParameter("number") != null) {
            // Get the number from the form
            int number = Integer.parseInt(request.getParameter("number"));
            
            // Convert the number to words
            String words = convertNumberToWords(number);
    %>
            <!-- Display the number in words in red color -->
            <p style="color:red;"><%= words %></p>
    <%
        }
    %>
</body>
</html>