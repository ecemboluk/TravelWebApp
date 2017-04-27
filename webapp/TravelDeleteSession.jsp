<!--- Gezi Siler --->
<%@ page import="com.toyota.project.controller.TravelsController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String username=session.getAttribute("username").toString();
    String indx= request.getParameter("id");
    int index=Integer.parseInt(indx);
    TravelsController userTravelController=new TravelsController();
    userTravelController.Delete(username,index);
    response.sendRedirect("UserPage.jsp");
%>
</body>
</html>
