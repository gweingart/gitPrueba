<%-- 
    Document   : agregarauto
    Created on : 07/10/2019, 15:16:49
    Author     : Matias Blanco
--%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.prueba.Concesionaria"%>
<%@page import="com.mycompany.prueba.Metodos"%>
<%@page import="com.mycompany.prueba.Auto"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html>
<%
    String resultado = "";
    String nombre = "";
    String modelo = "";
    String imagen = "";
    int concesionarios = 0;
    List<Concesionaria> conce = Metodos.obtenerConcesionarios();
    if (!(request.getParameter("nombre") == null
                && request.getParameter("modelo") == null
                && request.getParameter("imagen") == null)
                && request.getParameter("concecionarios") == null) {
            nombre = request.getParameter("nombre");
            modelo = request.getParameter("modelo");
            imagen = request.getParameter("imagen");
            concesionarios = Integer.parseInt(request.getParameter("concesionarios"));
//            session.setAttribute("concesionarios", concesionarios);
//            session.setAttribute("nombre", nombre);
//            session.setAttribute("modelo", modelo);
//            session.setAttribute("imagen", imagen);
            Concesionaria con = Metodos.buscarConcesionario(concesionarios);
            Auto auto = new Auto();
            auto.setConcesionario(con);
            auto.setImagen(imagen);
            auto.setMarca(nombre);
            auto.setModelo(modelo);
            System.out.println(auto.getConcesionario());
            System.out.println(auto.getMarca() + "- " + auto.getModelo());
            if (Metodos.agregarAuto(auto)) {
                resultado = "Se agregó con éxito el auto " + nombre + " - " + modelo;
            } else {
                resultado = "Ocurrio un error";
            };
        } else {

        }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Nuevo Auto</title>
    </head>
    <body>
        <FORM action="./agregarauto.jsp" method="post">
            Auto: 
            <INPUT type="text" name="nombre" size="20" maxlength="30"/> 
            Moedelo: 
            <INPUT type="text" name="modelo" size="20" maxlength="30"/>
            Link de la imagen: 
            <INPUT type="text" name="imagen" size="20" maxlength="500"/>
            Operación: <SELECT NAME="concesionarios" >
                <option value="0">Seleccione...</option>
<%
    for (Concesionaria conc : conce) {
        out.print("<option value= '" + conc.getCod_id()
                + "'> " + conc.getCo_nombre()
                + "</option>");
    }

%>
            </select>
            <INPUT type="submit" value="Agregar">
        </FORM>
        <p> <%=resultado%></p>        
        <a href="./proceso.jsp"> Volver </a>
    </body>
</html>
