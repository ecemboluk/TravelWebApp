<!-- İsme göre arama yapar--->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.toyota.project.controller.UserController" %>
<%@ page import="com.toyota.project.data.User" %>
<%@ page import="com.toyota.project.data.Travels" %>
<%@ page import="com.toyota.project.controller.TravelsController" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<!--- Admin seyehatleri görüntüler --->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kullanici Sayfasi</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="css/stil.css"/>
    <link rel="stylesheet" href="css/datepicker.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/datepicker.js"></script>
</head>
<body>
<%
    String name=session.getAttribute("name").toString();
    String surname=session.getAttribute("surname").toString();
    String username=session.getAttribute("username").toString();
%>
<div id="nameSurname"><%=name%> <%=surname%></div>
<div id="header">
    <img id="Logo" src="img/logo.jpg" alt="LOGO" title="toyota" width=8%>
</div>
</div>
<br>
<br>
<br>
<div id="userlistpanel" class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Kullanıcılar</div>
    <div id="id1"></div>
    <!-- Table -->
    <table class="table">
        <th>Bölüm</th>
        <th>Müdürü</th>
        <th>Seyehat Eden</th>
        <th>Seyehat Başlangıcı</th>
        <th>Seyehat Sonu</th>
        <th>Seyehat Yeri</th>
        <th>Gidiş Amacı</th>
        <th>Proje Kodu</th>
        <th>İşlemler</th>
        <%
            String userName=request.getParameter("userName");
            UserController usr=new UserController();
            TravelsController travelsController=new TravelsController();
            List<Travels> travelsList=travelsController.Get(userName);
            int counter=0;
            for(Travels travels:travelsList){
                User user=usr.findByUsername(travelsList.get(counter).getUsername());
        %>
        <tr>
            <td><%=user.getDepartmen()%></td>
            <td><%=user.getDepartmenManager()%></td>
            <td><%=user.getName()%> <%=user.getSurname()%></td>
            <td><%=travels.getStart()%></td>
            <td><%=travels.getFinish()%></td>
            <td><%=travels.getTravelPlace()%></td>
            <td><%=travels.getPurpose()%></td>
            <td><%=travels.getProjectCode()%></td>
            <td><input id="block" type="image" src="img/block.png" value="submit"/>
                <input type="image" src="img/uadd.png" />
            </td>
            <%
                    counter++;
                }
            %>

        </tr>
    </table>
</div>
<form action="AdminPage.jsp" id="userL">
    <input type="submit"  class="btn btn-primary active" value="Ana Sayfa">
</form>
</body>
</html>