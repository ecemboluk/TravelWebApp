<%@ page import="com.toyota.project.controller.UserController" %>
<%@ page import="com.toyota.project.data.User" %>
<%@ page import="java.util.List" %>
<!--- Admin gezi kaydeder --->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Admin seyehat girer -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seyehat Detayı</title>
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
    String id=request.getParameter("id");
    int index=Integer.parseInt(id);
    UserController usr = new UserController();
    List<User> userList=usr.Get();

%>
%>
<div id="nameSurname"><%=name%> <%=surname%></div>
<div id="header">
    <img id="Logo" src="img/logo.jpg" alt="LOGO" title="toyota" width=8%>
</div>
<div id="gezipanel" class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Seyehat Detayı</h3>
  </div>
  <div class="panel-body">
    <form name=login action="UserSession.jsp" method="post">
    <div id="f_title">Kullanici</div>
    <input id="f_box" type="text" class="form-control" name="user" value="<%=userList.get(index).getUsername()%>"/>
    <br>
    <div id="f_title">Seyehat Yeri</div>
    <input id="f_box" type="text" class="form-control" name="seyehat"/>    
    <br>
    <div id="f_title">Gidiş Amacı</div>
    <input id="f_box" type="text" class="form-control" />
     <br>
    <div id="f_title">Proje Kodu</div>
    <input id="f_box" type="text" class="form-control" />
    <br>
    <div id="f_title">Tahmini Seyehat Maliyeti</div>
    <input id="f_box" type="text" class="form-control" /> 
     <br>
        <div id="dateA" class="col-xs-4">
            <div class="input-group">
                <div class="input-group-addon">
                    Seyehat Gidiş Tarihi:
                    <i class="fa fa-calendar">
                    </i></div>
                <input class="form-control" name="baslangic" placeholder="GG-AA-YYYY" type="text"/>
            </div></div>
        <br>
        <br>
        <div id="dateA" class="col-xs-4">
            <div class="input-group">
                <div class="input-group-addon">
                    Seyehat Dönüş Tarihi:
                    <i class="fa fa-calendar">
                    </i></div>
                <input class="form-control" name="bitis" placeholder="GG-AA-YYYY" type="text"/>
            </div></div>
     <br>
        <br>
        <br>
    </form>
      <form action="AdminPage.jsp" id="cancel">
          <input type="submit" class="btn btn-primary active" value="İptal"/>
      </form>
      <form action="TravelSession.jsp" id="save" >
          <input type="submit" class="btn btn-primary active" value="Kaydet" /></form>
  </div>
</div>
</body>
</html>