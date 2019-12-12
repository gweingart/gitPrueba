/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.prueba;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Matias Blanco
 */
public class Metodos {

    private Metodos() {

    }

    public static boolean agregarAuto(Auto a1) {
        SessionFactory sessionFact = new Configuration().configure().buildSessionFactory();

        Session sec = sessionFact.openSession();
        // 
        //Auto auto = sec.get(Auto.class, 4);
        sec.save(a1);
        //session.getTransaction().commit();


        /* Auto auto = session.load(Auto.class, 1);
       session.delete(auto);
         */
        //session.getTransaction().commit();
        try {
            Transaction tx = sec.beginTransaction();
            tx.commit();
            sec.close();
            return true;
        } catch (Exception exp) {
        }
        sec.close();
        return false;
    }
      /*Este comentario es para probar el tema de de Git de guardar los cambios*/
    public static Auto buscarAuto(int iid) {
        SessionFactory sessionFact = new Configuration().configure().buildSessionFactory();

        Session sec = sessionFact.openSession();
        // 
        Auto auto = sec.get(Auto.class, iid);

        try {
            Transaction tx = sec.beginTransaction();
            tx.commit();
            //sec.close();
            if (auto.equals(null)) {
                return new Auto();
            } else {
                sec.close();
                return auto;
            }

        } catch (Exception exp) {

        }
        sec.close();
        return new Auto();
    }
    public static Concesionaria buscarConcesionario(int iid) {
        SessionFactory sessionFact = new Configuration().configure().buildSessionFactory();

        Session sec = sessionFact.openSession();
        // 
        Concesionaria conce = sec.get(Concesionaria.class, iid);

        try {
            Transaction tx = sec.beginTransaction();
            tx.commit();
            //sec.close();
            if (conce.equals(null)) {
                return new Concesionaria();
            } else {
                sec.close();
                return conce;
            }

        } catch (Exception exp) {

        }
        sec.close();
        return new Concesionaria();
    }

    public static boolean actualizarAuto(Auto auto) {
        try {
            SessionFactory sessionFact = new Configuration().configure().buildSessionFactory();

            Session sec = sessionFact.openSession();
            // 
            Transaction tx = sec.beginTransaction();

            sec.update(auto);

            tx.commit();

            sec.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public static List<Auto> obtenerAutos() {
        SessionFactory sessionFact = new Configuration().configure().buildSessionFactory();
        Session sec = sessionFact.openSession();
        String hql = "FROM Auto";
        List <Auto> resultado = sec.createQuery(hql).getResultList();
        sec.close();
        return resultado;
    }
    
    
    public static List<Concesionaria> obtenerConcesionarios() {
        SessionFactory sessionFact = new Configuration().configure().buildSessionFactory();
        Session sec = sessionFact.openSession();
        String hql = "FROM Concesionaria";
        List <Concesionaria> resultado = sec.createQuery(hql).getResultList();
        sec.close();
        return resultado;
    }

}
