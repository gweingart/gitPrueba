/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ar.com.i2t.entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author gweingart
 */
public class Hibernate {
   
    public static void main(String[] args) {
     EntityManagerFactory emf= Persistence.createEntityManagerFactory("persistence");
     EntityManager em= emf.createEntityManager();
     
     Concesionario conc = em.find(Concesionario.class, 1);
     
     em.close();
     
      
    }
}
