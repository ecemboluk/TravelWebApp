<!--- Kullanıcı Siler--->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.toyota.project.controller.TravelsController" %>
<html>
<head>
</head>
<body>
<%
    String indx= request.getParameter("id");
    int index=Integer.parseInt(indx);
    TravelsController userTravelController=new TravelsController();
    userTravelController.Delete(index);
    response.sendRedirect("AdminPage.jsp");
%>
</body>
</html>
