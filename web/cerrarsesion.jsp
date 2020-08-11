<%-- 
    Document   : cerrarsesion
    Created on : 11/08/2020, 10:29:41 AM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<% HttpSession sesion = request.getSession();
    sesion.invalidate(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar sesion</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <jsp:forward page="index.hmtl" />
    </body>
</html>
