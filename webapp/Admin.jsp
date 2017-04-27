<!--- Kullanýcý Kayýt Sayfasý --->
<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//TR" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kullanýcý Bilgileri</title>
<meta charset="UTF-8"/>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" />
	<link rel="stylesheet" href="css/stil.css"/>
	<link rel="stylesheet" href="css/datepicker.css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="js/jquery.js"></script>
  <script type="text/javascript" src="js/events.js"></script>
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
<div id="adminpanel1">
<div id="gezipanel" class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Kullanýcý Bilgileri</h3>
  </div>
  <div id="adminP" class="panel-body">
    <form name="login" action="AdminSession.jsp" method="post">
    <div id="f_title">Kullanýcý Adý</div>
    <input id="f_box" type="text" class="form-control" name="username" /> 
    <br>
    <div id="f_title">Adý</div>
    <input id="f_box" type="text" class="form-control" name="name" /> 
    <br>
    <div id="f_title">Soyadý</div>
    <input id="f_box" type="text" class="form-control" name="surname" /> 
    <br>
    <div id="f_title">Sicil Numarasý</div>
    <input id="f_box" type="text" class="form-control" name="scrnumber"/>    
    <br>
    <div id="f_title">Þifre</div>
    <input id="f_box" type="text" class="form-control"  name="pass"/>
     <br>
    <div id="f_title">Bölümü</div>
    <input id="f_box" type="text" class="form-control" name="departmen" />
    <br>
    <div id="f_title">Bölüm Müdürü</div>
    <input id="f_box" type="text" class="form-control" name="departmenManager"/> 
     <br>
    <div id="f_title">Rolü</div>
      <div id="role">
        <select name="role">
          <option>Rol Seçin</option>
          <option>Normal Kullanýcý</option>
          <option>Admin</option>
        </select>
      </div>
      <br>
      <div class="panel panel-default">
        <div class="panel-body">
          Bilgilendirme Servisi
          <br>
          Açýk <input type="radio" >
          <br>
          <br>
          <div class="panel panel-default">
            <div class="panel-body">
              Seyehat Sistemi
              <br>
              <br>
          <select id="haftalik" name="travelday">
            <option>Gün Seçin</option>
            <option>Pazartesi</option>
            <option>Salý</option>
            <option>Çarþamba</option>
            <option>Perþembe</option>
            <option>Cuma</option>
            <option>Cumartesi</option>
            <option>Pazar</option>
          </select>
          <select id="aylik" name="travelmonthweek">
            <option>Periyot Seçin</option>
            <option>Aylýk</option>
            <option>Haftalýk</option>
          </select>
            </div>
          </div>
        </div>
      </div>
      <input id="kaydet" type="submit" class="btn btn-info btn-lg" value="Kaydet"/>
    </form>
  </div>
</div>
</div>
</body>
</html>