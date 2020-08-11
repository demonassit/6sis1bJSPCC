<%-- 
    Document   : Mensaje
    Created on : 11/08/2020, 10:19:31 AM
    Author     : demon
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<% 

    //esto es java carga la pagina de errores y se redireccione al index
    String usuario = "";
    HttpSession sesion = request.getSession();
    
    if(session.getAttribute("usuario") == null ){
        //significa que no existe
%>

<jsp:forward page="index.html" >    
    <jsp:param name="error" value="Es obligatorio autenticarse con su usuario" /> 
</jsp:forward>

<%
    }else{
        usuario =(String)sesion.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Productos</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
