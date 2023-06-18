<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<body>
<%
     String user = (String) session.getAttribute("user");
     out.println(user);
    if(null != user){
%>
        <h2>Welcome ${user}</h2>
        <a href="/category">Click here to go for Category</a>
<%
    }else{
%>

<%!
String mysqlDbUrl = null;
String mysqlDbdriver = null;
String dbUsername = null;
String dbPassword = null;

String username = null;
String password = null;
%>
<%
        mysqlDbUrl = pageContext.getServletContext().getInitParameter("db.mysql.url");
        mysqlDbdriver = pageContext.getServletContext().getInitParameter("db.mysql.driver");
        dbUsername = pageContext.getServletContext().getInitParameter("db.mysql.username");
        dbPassword = pageContext.getServletContext().getInitParameter("db.mysql.password");

        username = (String) request.getParameter("username");
        password = (String) request.getParameter("password");

        Connection conn = null;
        try{

            // 1. Load the Drivers
            Class.forName(mysqlDbdriver).newInstance();

            // 2. Establish the Connection with DB using URL, username, password
            conn = DriverManager.getConnection(mysqlDbUrl, dbUsername, dbPassword);

            // 3. Prepare the statements
                PreparedStatement preparedStatement =
                conn.prepareStatement("SELECT * FROM user_login WHERE username=? and password=?");
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);

            String authPassword = null;
            // 4. execute the statement
            ResultSet rs = preparedStatement.executeQuery();
                //5. Extract data from result sets
                if (rs.next()) {
                    //      circle = new batch.four.Circle(1, rs.getString("name"));
                    authPassword = rs.getString("password");
                }
                //  6. Close the connection.
                rs.close();

                if(null != authPassword && authPassword.equals(password)){
                    session.setAttribute("user",username);
                    request.setAttribute("user", username);
                    request.getRequestDispatcher("welcome.jsp").forward(request,response);
                }else{
                request.getRequestDispatcher("index.jsp").forward(request,response);
                }

            } catch (Exception e) {
                        throw new RuntimeException(e);
            } finally {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
            }

%>
<%
}
%>
</body>
</html>