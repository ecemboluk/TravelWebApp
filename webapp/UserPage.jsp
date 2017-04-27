<!--- Kullanıcı seyehatlerini görüntüler --->
<%@ page import="com.toyota.project.controller.TravelsController" %>
<%@ page import="com.toyota.project.data.Travels" %>
<%@ page import="java.util.List" %>
<%@ page import="com.toyota.project.data.User" %>
<%@ page import="com.toyota.project.controller.UserController" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kullanici Sayfasi</title>
<meta charset="UTF-8"/>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" />
	<link rel="stylesheet" href="css/stil.css"/>
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="js/jquery.js"></script>
    <script src="js/datepicker.js"></script>
    <script>
        $(document).ready(function(){
            var date_input=$('input[name="baslangic"]'); //our date input has the name "date"
            var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd-mm-yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })

            var date_input1=$('input[name="bitis"]');
            var container1=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
            date_input1.datepicker({
                format: 'dd-mm-yyyy',
                container1: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
        $(function(){

            $("#search").click(function(){	$("#u1").modal('show');	})
        })
    </script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
</head>
<body>
<%
    String username=session.getAttribute("username").toString();
    String name=session.getAttribute("name").toString();
    String surname=session.getAttribute("surname").toString();
%>
<div id="nameSurname"><%=name%> <%=surname%></div>
<div id="header">
    <img id="Logo" src="img/logo.jpg" alt="LOGO" title="toyota" width=8%>
</div>
<div id="userpage">
    <form action="FindTravelSession.jsp" method="post" id="dateU">
    <div id="date" class="col-xs-4">
        <div class="input-group">
            <div class="input-group-addon">
                Başlangıç Tarihini Girin:
                <i class="fa fa-calendar">
                </i></div>
            <input class="form-control" name="baslangic" placeholder="GG-AA-YYYY" type="text"/>
        </div></div>
    <div id="date" class="col-xs-4">
        <div class="input-group">
            <div class="input-group-addon">
                Bitiş tarihini girin:
                <i class="fa fa-calendar">
                </i></div>
            <input class="form-control" name="bitis" placeholder="GG-AA-YYYY" type="text"/>
        </div></div>
    <input type="image" id="search" value="submit" src="img/search.png" />
    </form>
         <form action="UserTravel.jsp"><input type="image" id="traveladd" value="submit" src="img/add.png"/></form>
         <div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Seyehatler</div>
  <!-- Table -->
  <table class="table">
    <th>Bölümü</th>
    <th>Müdürü</th>
    <th>Seyehat Başlangıcı</th>
    <th>Seyehat Sonu</th>
    <th>Seyehat Yeri</th>
    <th>Gidiş Amacı</th>
    <th>Proje Kodu</th>
    <th>İşlemler</th>
      <%
          UserController userController=new UserController();
          TravelsController travelsController=new TravelsController();
          User user=userController.findByUsername(username);
          List<Travels> travels=travelsController.Get(username);
          int counter = 0;
          for(Travels travels1: travels){
      %>
      <tr>
          <td id="<%=counter%>"><%=user.getDepartmen()%></td>
          <td><%=user.getDepartmenManager()%></td>
          <td><%=travels1.getStart()%></td>
          <td><%=travels1.getFinish()%></td>
          <td><%=travels1.getTravelPlace()%></td>
          <td><%=travels1.getPurpose()%></td>
          <td><%=travels1.getProjectCode()%></td>
          <td>
              <a href="TravelDeleteSession.jsp?id=<%=counter%>"><input id="block" type="image" src="img/block.png" value="submit"/></a>
              <input type="image" src="img/uadd.png" />
              <%

                      counter++;
                  }
              %>
          </td>
      </tr>
  </table>
</div>
</div>
</body>
</html>