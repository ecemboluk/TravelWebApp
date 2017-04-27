<%--
  Kullanıcı günceller.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.toyota.project.controller.UserController" %>
<%@ page import="com.toyota.project.data.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//TR" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kullanıcı Bilgileri</title>
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
    String username=session.getAttribute("username").toString();
    String id=request.getParameter("id");
    int index=Integer.parseInt(id);
    UserController usr=new UserController();
    List<User> userList=usr.Get();

%>
<div id="nameSurname"><%=name%> <%=surname%></div>
<div id="header">
    <img id="Logo" src="img/logo.jpg" alt="LOGO" title="toyota" width=8%>
</div>
<div id="adminpanel1">
    <div id="gezipanel" class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Kullanıcı Bilgileri</h3>
        </div>
        <div id="adminP" class="panel-body">
            <form name="login" action="UpdateSession.jsp" method="post">
                <div id="f_title">Kullanici Adı</div>
                <input id="f_box" type="text" class="form-control" name="username" value="<%=userList.get(index).getUsername()%>"/>
                <br>
                <div id="f_title">Adı</div>
                <input id="f_box" type="text" class="form-control" name="name" value="<%=userList.get(index).getName()%>"/>
                <br>
                <div id="f_title">Soyadı</div>
                <input id="f_box" type="text" class="form-control" name="surname" value="<%=userList.get(index).getSurname()%>"/>
                <br>
                <div id="f_title">Sicil Numarası</div>
                <input id="f_box" type="text" class="form-control" name="scrnumber" value="<%=userList.get(index).getScNumber()%>"/>
                <br>
                <div id="f_title">Şifre</div>
                <input id="f_box" type="text" class="form-control"  name="pass" value="<%=userList.get(index).getPass()%>"/>
                <br>
                <div id="f_title">Bölümü</div>
                <input id="f_box" type="text" class="form-control" name="departmen" value="<%=userList.get(index).getDepartmen()%>" />
                <br>
                <div id="f_title">Bölüm Müdürü</div>
                <input id="f_box" type="text" class="form-control" name="departmenManager" value="<%=userList.get(index).getDepartmenManager()%>"/>
                <br>
                <div id="f_title">Rolü</div>
                <div id="role">
                    <select name="role">
                        <option>Rol Seçin</option>
                        <option>Normal Kullanıcı</option>
                        <option>Admin</option>
                    </select>
                </div>
                <br>
                <div class="panel panel-default">
                    <div class="panel-body">
                        Bilgilendirme Servisi
                        <br>
                        Açık <input type="radio">
                        <br>
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                Seyehat Sistemi
                                <br>
                                <br>
                                <select id="haftalik" name="travelweek">
                                    <option><%=userList.get(index).getTravelsystem()%></option>
                                    <option>Pazartesi</option>
                                    <option>Salı</option>
                                    <option>Çarşamba</option>
                                    <option>Perşembe</option>
                                    <option>Cuma</option>
                                    <option>Cumartesi</option>
                                    <option>Pazar</option>
                                </select>
                                <select id="aylik" name="travelmonth">
                                    <option>Aylık</option>
                                    <option>Haftalık</option>
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
