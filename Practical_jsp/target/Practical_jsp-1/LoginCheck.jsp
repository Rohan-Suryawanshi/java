<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Result</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null && username.equals(password)) {
    %>
            <h2>Login Successfully</h2>
            <p>Welcome, <%= username %>!</p>
            <a href="Login.html">Back to Login Page</a>
    <%
        } else {
    %>
            <h2>Login Failed</h2>
            <p>Invalid username or password.</p>
            <a href="Error.html">Back to Error Page</a>
    <%
        }
    %>
</body>
</html>
