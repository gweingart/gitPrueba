<%-- 
    Document   : buscarauto
    Created on : 07/10/2019, 15:23:39
    Author     : Matias Blanco
--%>

<%@page import="com.mycompany.prueba.Metodos"%>
<%@page import="com.mycompany.prueba.Auto"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html>
<%
    Integer iid = 0;
    Auto auto;
    String nombre = "";
    String modelo = "";
    String imagen = "";
    boolean vacio = true;
    boolean mostrar = false;
    if (!(request.getParameter("id") == null)) {
        mostrar = true;
        String id = request.getParameter("id");
        session.setAttribute("id", id);
        iid = Integer.parseInt(id);
        auto = Metodos.buscarAuto(iid);

        vacio = auto.vacio();
        System.out.println(auto);
        if (!vacio) {
            nombre = auto.getMarca();
            modelo = auto.getModelo();
            imagen = auto.getImagen();
        }
    }

        
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <Form action="./buscarauto.jsp" method="post">
            Ingrese el ID del Auto: 
            <INPUT type="text" name="id" size="20" maxlength="30"/>
            <INPUT type="submit" value="Buscar">
        </Form>
        <%if (mostrar) {
                if (!vacio) {
        %>
        <h1>El auto buscado es: <%=nombre%> modelo: <%=modelo%> </h1>
        <img src="<%=imagen%>"> 
        <%} else {
        %>
        <h1>No se encontró el auto buscado, revise los parámetros.</h1>
        <%}
            }%>
        <a href="./proceso.jsp"> Volver </a>
    </body>
</html>
