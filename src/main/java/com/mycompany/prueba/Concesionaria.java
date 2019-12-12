/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.prueba;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 *
 * @author Matias Blanco
 */
@Entity
@Table(name = "concesionarios")
public class Concesionaria {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="co_id")
    private int cod_id;
    @Column(name="co_nombre")
    private String co_nombre;
    @Column(name="co_direccion")
    private String co_direccion;

    public Concesionaria(){
        
    }
    public int getCod_id() {
        return cod_id;
    }

    public void setCod_id(int cod_id) {
        this.cod_id = cod_id;
    }

    public String getCo_nombre() {
        return co_nombre;
    }

    public void setCo_nombre(String co_nombre) {
        this.co_nombre = co_nombre;
    }

    public String getCo_direccion() {
        return co_direccion;
    }

    public void setCo_direccion(String co_direccion) {
        this.co_direccion = co_direccion;
    }
    
}
