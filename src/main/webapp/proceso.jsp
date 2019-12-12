<%-- 
    Document   : extraerinfo
    Created on : 07/10/2019, 14:18:47
    Author     : Matias Blanco
--%>



<%@page import="com.mycompany.prueba.Metodos"%>
<%@page import="com.mycompany.prueba.Concesionaria"%>
<%@page import="com.mycompany.prueba.Auto"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<!DOCTYPE html>
<%
    List<Auto> result = Metodos.obtenerAutos();
    
%>
<table align="center" border="1" width="30%">
    <tr>
        <th>AUTO ID</th>
        <th>AUTO MARCA</th>
        <th>AUTO MODELO</th>
        <th>AUTO FOTO</th>
        <th>CONCESIONARIA</th>
        <th>DIRECCIÓN</th>
    </tr>
    <%   
        for (Auto a : result) {
            Concesionaria conce = a.getConcesionario();
    %>
    <tr>
        <td width="100">
            <%=a.getId()%>
        </td>
        <td width="100">
            <%=a.getMarca()%>
        </td>
        <td width="100">
            <%=a.getModelo()%>
        </td>
        <td width="100">
            <img src="<%=a.getImagen()%>" width="75" height="75">
        </td>
        <td>
            <%=conce.getCo_nombre()%>
        </td>
        <td>
            <%=conce.getCo_direccion()%>
        </td>
    </tr>
    <%

        }

    %>
</table>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de Inicio</title>
        <link rel="stylesheet" href="css/prueba.css" type="text/css"><link>
    </head>
    <body>

        <TABLE align="center" border="1" width="85%">
            <TR>
                <TD>
                    <div class="div01">
                        <a href="./agregarauto.jsp">INGRESO DE NUEVO AUTO</a>
                    </div>

                </TD> 
            </TR>
            <TR>
                <TD> 
                    <div class="div01">
                        <a href="./buscarauto.jsp">BUSQUEDA DE AUTOS </a>
                    </div>
                </TD> 
            </TR>
            <TR>
                <TD> 
                    <div class="div01">
                        <p>BORRAR AUTOS POR ID</p>
                    </div>
                    
                </TD> 
            </TR>
            <TR>
                <td>
                    <div class="div01">
                        <p>MODIFICAR AUTO</p>
                    </div>
                    <Form action="./modificarauto.jsp" method="post">
                        Operación: <SELECT NAME="OPERACION" >
                            <option value="0">Seleccione...</option>
                            <%                                    for (Auto b : result) {
                                    out.print("<option value= '" + b.getId()
                                            + "'> " + b.getMarca() + "-"
                                            + b.getModelo() + "</option>");
                                }

                            %>
                        </select>
                        <INPUT type="submit" value="Modificar">
                    </Form>
                </td>
            </TR>
        </table>
    </body>
</html>
