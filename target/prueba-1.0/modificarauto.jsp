<%-- 
    Document   : modificarauto
    Created on : 08/10/2019, 16:29:02
    Author     : Matias Blanco
--%>

<%@page import="com.mycompany.prueba.Concesionaria"%>
<%@page import="com.mycompany.prueba.Metodos"%>
<%@page import="com.mycompany.prueba.Auto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int id = 0;
    String resultado = "";
    if(!(request.getParameter("OPERACION")== null)){
        id =  Integer.parseInt(request.getParameter("OPERACION"));
        session.setAttribute("OPERACION",id);
        
    }
    else{
        id = Integer.parseInt(request.getParameter("id"));
        session.setAttribute("id",id);
    }
        String modelo = request.getParameter("modelo");
        String nombre = request.getParameter("nombre");
        String imagen = request.getParameter("imagen");
        
        session.setAttribute("modelo",modelo);
        session.setAttribute("nombre",nombre);
        session.setAttribute("imagen",imagen);
        Auto auto = Metodos.buscarAuto(id);
        Concesionaria conce = auto.getConcesionario();
        if(!(modelo == null && nombre == null && imagen == null)){
            Auto autoAux = new Auto();
            autoAux.setId(id);
            autoAux.setConcesionario(conce);
            autoAux.setImagen(imagen);
            autoAux.setMarca(nombre);
            autoAux.setModelo(modelo);
            if(Metodos.actualizarAuto(autoAux)){
                resultado = "Actualizado el auto" + autoAux.getMarca() + " - " + autoAux.getModelo();
            }
            else{
                resultado = "No se pudo actualizar la información.";
            }
        }
        
    %>
    
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Modificar Auto</title>
        </head>
        <body>
            <h1>  </h1>
            <FORM action="./modificarauto.jsp" method="post">
                Auto: 
                <INPUT type="text" name="nombre" size="20" maxlength="30" value="<%=auto.getMarca()%>"/> 
                Moedelo: 
                <INPUT type="text" name="modelo" size="20" maxlength="30" value="<%=auto.getModelo()%>"/>
                Link de la imagen: 
                <INPUT type="text" name="imagen" size="20" maxlength="500" value="<%=auto.getImagen()%>"/>
                <input type="text" name="id" value="<%=id%>" maxlength="15" readonly/>
                <INPUT type="submit" value="Modificar">
                <p><%=resultado%></p>
                <a href="./proceso.jsp">Volver</a>
            </form>    
        </body>
    </html>
