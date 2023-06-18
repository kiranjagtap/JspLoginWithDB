<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                                 "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>
<h2>Login Form</h2>
<p><font color="red">${errorMessage}</font></p>
<form action="welcome.jsp" method="post">
<label for="username">Enter Username</label>
<br><br>
<input type="text" name="username">
<br><br>
<label for="password">Enter Password</label>
<br><br>
<input type="password" name="password">
<br><br>
<input type="submit">
<br>
<br>
<br>

<b>
</b>
</body>
</html>