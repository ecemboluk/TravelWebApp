<!---Admin herkesi görüntüler--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<%@ page import="com.toyota.project.controller.UserController" %>
<%@ page import="com.toyota.project.data.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//TR" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="TR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kullanýcýlar</title>
<meta charset="UTF-8"/>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="css/stil.css"/>
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<%
    String name=session.getAttribute("name").toString();
    String surname=session.getAttribute("surname").toString();
%>
<div id="nameSurname"><%=name%> <%=surname%></div>
<div id="header">
    <img id="Logo" src="img/logo.jpg" alt="LOGO" title="toyota" width=8%>
</div>
<form action="Admin.jsp" id="admin2">
    <input id="add" type="image" src="img/add.png" value="submit">
</form>
<br>

<div id="userlistpanel" class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Kullanýcý Listesi</div>

  <!-- Table -->
  <table class="table">
    <th>Kullanýcý Adý</th>
    <th>Adý</th>
    <th>Soyadý</th>
      <th>Sicil No</th>
    <th>Bölümü</th>
    <th>Bölüm Müdürü</th>
    <th>Rolü</th>
      <th>Bilgilendirme Servisi</th>
    <th>Seyehat Bilgilendirme</th>
    <th>Ýþlemler</th>
      <%

          UserController usr=new UserController();
          List<User> userList=usr.Get();
          int counter=0;
          for(User user:userList){
      %>
       <tr>
           <td id=<%=counter%>><%=user.getUsername()%></td>
           <td><%=user.getName()%></td>
           <td><%=user.getSurname()%></td>
           <td><%=user.getScNumber()%></td>
           <td><%=user.getDepartmen()%></td>
           <td><%=user.getDepartmenManager()%></td>
           <td><%=user.getRole()%></td>
           <td><%=user.getInformationservice()%></td>
           <td><%=user.getTravelsystem()%></td>
           <td>
               <a href="DeleteSession.jsp?id=<%=counter%>"> <input id="block" type="image" src="img/block.png" value="submit"/></a>
               <a href="Update.jsp?id=<%=counter%>"> <input type="image" src="img/uadd.png" /></a>
      <%
         counter++;
          }
      %>
           </td>
       </tr>
    </table>
    <!-- Modal -->
</div>
</body>
</html>