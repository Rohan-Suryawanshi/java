<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sum of First and Last Digit</title>
</head>
<body>
    <h2>Sum of First and Last Digit</h2>
    <form action="slip26.jsp" method="post">
        Enter a number: <input type="number" name="number" required><br><br>
        <input type="submit" value="Calculate">
    </form>
    
    <%-- Java code to calculate sum of first and last digits --%>
    <%
        if (request.getMethod().equals("POST")) {
            // Retrieve the number from the form
            int number = Integer.parseInt(request.getParameter("number"));
            
            // Calculate the sum of first and last digits
            int lastDigit = number % 10;
            int firstDigit = 0;
            while (number >= 10) {
                number /= 10;
                firstDigit = number;
            }
            int sum = firstDigit + lastDigit;
    %>
            <%-- Display the sum in red color with font size 18 --%>
            <p style="color:red; font-size:18px;">Sum of first and last digit: <%= sum %></p>
    <%
        }
    %>
</body>
</html>
