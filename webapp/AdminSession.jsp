<!--- Kullan�c� kaydeder --->
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
         pageEncoding="ISO-8859-9"%>
    <%@ page import="com.toyota.project.controller.UserController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//TR" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String contentType= "text/html;charset=UTF-8";
    response.setContentType(contentType);
    response.setCharacterEncoding("utf-8");
 String travelsystem = "";
 String informationsystem= "";
 String mW="";
 String username=request.getParameter("username");
 String name=request.getParameter("name");
 String surname=request.getParameter("surname");
 String scrnumber=request.getParameter("scrnumber");
 String pass=request.getParameter("pass");
 String departmen=request.getParameter("departmen");
 String departmenManager=request.getParameter("departmenManager");
 String role=request.getParameter("role");
 String travelsystemdays=request.getParameter("travelday");
 String travelsystemMW=request.getParameter("travelmonthweek");
 if(travelsystemMW=="Haftal�k" ){
     informationsystem="A��k";
     mW="Haftal�k";
 }
 else if(travelsystemMW=="Ayl�k"){
     informationsystem="A��k";
     mW="Ayl�k";
 }
 else if(travelsystemMW=="Periyot Se�in" && travelsystemdays=="G�n Se�in"){
     informationsystem="Kapal�";
     travelsystem="-";
 }
 if(travelsystemdays!="G�n Se�in"){
     informationsystem="A��k";
     travelsystem=mW+"-"+travelsystemdays;
 }

 UserController usr=new UserController();
usr.Save(username, name, surname, scrnumber, pass, role, departmen, departmenManager,informationsystem,travelsystem);
response.sendRedirect("UserList.jsp");
%>
</body>
</html>