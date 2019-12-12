<%-- 
    Document   : mostrarTodos
    Created on : 07/10/2019, 15:38:30
    Author     : Matias Blanco
--%>
<%@page import="com.mycompany.prueba.Auto"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%
        String id =  request.getParameter("id");
        session.setAttribute("id",id);
        
        int iid = Integer.parseInt(id);
        SessionFactory sessionFact = new Configuration().configure().buildSessionFactory();

        Session sec = sessionFact.openSession();
        // 
        
        Auto auto = sec.get(Auto.class, iid);
        String nombre = auto.getMarca();
        String modelo = auto.getModelo();
        String imagen = auto.getImagen();
        String ids  = auto.getId() + "";
        sec.delete(auto);
        
            

       try {
               Transaction tx = sec.beginTransaction();
               tx.commit();
           } catch (Exception exp) {
           }

       sec.close();
        
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <Form action="./borrar.jsp" method="post">
                        <INPUT type="text" name="id" size="20" maxlength="30"/>
                        <INPUT type="submit" value="Borrar">
                    </Form>
        <h1>El auto Borrado es: <%=nombre%>  - Modelo: <%=modelo%> -id: <%=ids%>  </h1>
        <img src="<%=imagen%>">
        <a href="./proceso.jsp"> Volver </a>
    </body>
</html>
