<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<body>
<h2>Hello World!</h2>
<!-- Declarative scriplets -->
<%!
int a=10;
int b=30;

int add(){
    return a+b;
}
%>


<!-- scriplets -->
<%
a=40;
b=50;
int result = add();
System.out.println(result);

//out.println(result);

%>

<%
    for(int i=1;i<=10;i++){
%>
<br>
<%
    out.println(i );
  }

%>



<!-- expression scriplets -->
<br/>
<b><%=result%></b>
</body>
</html>
