<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.toyota.project.data.User" %>
    <%@ page import="com.toyota.project.controller.UserController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String username=request.getParameter("email");
String pass=request.getParameter("password");
UserController usr=new UserController();
User user=usr.findByUsername(username);
session.setAttribute("name", user.getName());
session.setAttribute("surname", user.getSurname());
session.setAttribute("username",username);
int control=usr.Login(username,pass);
if(control==1){
	response.sendRedirect("UserPage.jsp");
    session.setAttribute( "username", username );
}
else if(control==-1){
  response.sendRedirect("AdminPage.jsp");
    session.setAttribute( "username", username );
}
else{
    response.sendRedirect("Login.jsp");
}
%>
</body>
</html>