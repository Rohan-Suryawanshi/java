
package com.practical_jsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class slip19 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Retrieving username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Establishing database connection
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/msg", "postgres", "root");
            
            // Creating prepared statement to search for username and password
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            // Executing the query
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                // If username and password found in the database
                out.println("<html><body>");
                out.println("<h2>Login Successful</h2>");
                out.println("<p>Welcome, " + username + "!</p>");
                out.println("</body></html>");
            } else {
                // If username and/or password not found in the database
                out.println("<html><body>");
                out.println("<h2>Login Failed</h2>");
                out.println("<p>Invalid username or password.</p>");
                out.println("</body></html>");
            }
        } catch (SQLException e) {
            
        } catch (ClassNotFoundException ex) {
           
        } finally {
            
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
     
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
