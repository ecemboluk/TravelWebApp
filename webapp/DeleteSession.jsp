<%--
  Kullanıcı Siler
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.toyota.project.controller.UserController" %>
<%@ page import="java.util.List" %>
<%@ page import="com.toyota.project.data.User" %>
<head>
    <title></title>
</head>
<body>
<%
    String indx= request.getParameter("id");
    int index=Integer.parseInt(indx);
    UserController usr=new UserController();
    List<User> userList=usr.Get();
    String username=userList.get(index).getUsername();
    usr.Delete(username);
    response.sendRedirect("UserList.jsp");

%>
</body>
</html>
