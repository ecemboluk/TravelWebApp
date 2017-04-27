<!--- Admin seyehatleri görüntüler --->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.toyota.project.controller.UserController" %>
<%@ page import="com.toyota.project.data.User" %>
<%@ page import="com.toyota.project.data.Travels" %>
<%@ page import="com.toyota.project.controller.TravelsController" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
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
<form action="AdminPageSession.jsp" id="adminpage">
    <select name="userName">
        <option>Kullanıcı Seçin</option>
    <%
        UserController usrC=new UserController();
        List<User> us=usrC.Get();
        for(User usr:us){
    %>
        <option><%=usr.getUsername()%></option>
        <%
            }
        %>
    </select>

<input type="submit" class="btn btn-primary btn-sm" value="Ara">
</form>
<form action="AdminDateSession.jsp" id="admindate">
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
<input type="image" id="search1" value="submit" src="img/search.png" /></form>
<form action="AdminTravel.jsp" id="admin">
    <input id="add1" type="image" src="img/add.png" value="submit">
</form>
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
          UserController usr=new UserController();
          TravelsController travelsController=new TravelsController();
          List<Travels> travelsList=travelsController.Get();
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
          <td>
              <a href="AdminDeleteSession.jsp?id=<%=counter%>"><input id="block" type="image" src="img/block.png" value="submit"/></a>
              <input type="image" src="img/uadd.png" />
          </td>
          <%
                  counter++;
              }
          %>
      </tr>
  </table>
</div>
<form action="UserList.jsp" id="userL">
    <input type="submit" class="btn btn-primary active" value="Kullanıcılar">
</form>
</body>
</html>