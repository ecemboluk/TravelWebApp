<!--- Login Sayfası--->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//TR" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8"/>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
	<link rel="stylesheet" href="css/stil.css"/>
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

	<title>Giriş</title>

	<style type="text/css">
	</style>
</head>
<body>
<div id="header">
<img id="Logo" src="img/logo.jpg" alt="LOGO" title="toyota" width=8%>
</div>	
<form id="panel" action="LoginSession.jsp">
	Seyehat Sistemi Giriş <br/><br/>
  <div class="input-group input-group-lg">
  
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    
    <input id="email" type="text" class="form-control" name="email" placeholder="Kullanıcı Adı..."/>
  </div>
  <br/> 
  <div class="input-group input-group-lg">
    <span class="input-group-addon "><i class="glyphicon glyphicon-lock"></i></span>
    <input id="password" type="password" class="form-control" name="password" placeholder="Şifre..."/>
  </div>
  <br/>
  <!--  <input type="submit" class="btn btn-info btn-lg" value="Ana Sayfa"/> -->
  <input type="submit" class="btn btn-info btn-lg" value="Giriş"/>
</form>
</body>

   
</html>