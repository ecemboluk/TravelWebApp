<!--- Gezi Kaydeder --->
<%@ page import="com.toyota.project.controller.TravelsController" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: ecem
  Date: 19.03.2017
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String username=session.getAttribute("username").toString();
    String placeTravel=request.getParameter("seyehatyeri");
    String purposeGoing=request.getParameter("gidisamaci");
    String projectCode=request.getParameter("projekodu");
    String travelStart=request.getParameter("baslangic");
    String travelFinish=request.getParameter("bitis");
    TravelsController travelController=new TravelsController();
    travelController.saveTravel(username,placeTravel,purposeGoing,projectCode,travelStart,travelFinish);
    response.sendRedirect("FindTravelSession.jsp");
%>
</body>
</html>
