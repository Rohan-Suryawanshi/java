<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Voter Eligibility Check</title>
</head>
<body>
    <h2>Voter Eligibility Check</h2>
    <form action="slip25.jsp" method="post">
        Enter your name: <input type="text" name="name" required><br><br>
        Enter your age: <input type="number" name="age" required><br><br>
        <input type="submit" value="Check Eligibility">
    </form>
    
    <%-- Java code to check eligibility --%>
    <%
        // Retrieve name and age from the form
        
    %>
    
    <%-- Display eligibility result --%>
    <%
        if (request.getMethod().equals("POST")) {
           
            String name = request.getParameter("name");
             int age = Integer.parseInt(request.getParameter("age"));
        
        // Check eligibility
                 boolean eligible = age >= 18;
                  if (eligible) {
    %>
                <h3><%= name %> is eligible to vote!</h3>
    <%
            } else {
    %>
                <h3><%= name %> is not eligible to vote.</h3>
                <p>You must be 18 years or older to vote.</p>
    <%
            }
        }
    %>
</body>
</html>
