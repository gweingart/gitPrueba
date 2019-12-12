package com.mycompany.prueba;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Matias Blanco
 */
@Entity
@Table(name = "alu_autos")
public class Auto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="alu_id")
    private Integer id;
    @Column(name="alu_marca")
    private String marca; 
    @Column(name="alu_modelo")
    private String modelo;
    @Column(name="imagen")
    private String imagen;
    @OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JoinColumn(name="id_conce")
    private Concesionaria concesionario;

   public Auto(){
       this.imagen = "";
       this.marca = "";
       this.modelo = "";
   }
   
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    
    /**
     *
     */
    @Override
    public String toString(){
        return this.getMarca() + " - " +  this.getModelo();
    }  

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    public Concesionaria getConcesionario() {
        return concesionario;
    }

    public void setConcesionario(Concesionaria concesionario) {
        this.concesionario = concesionario;
    }
    
    public boolean vacio(){
        if((this.getImagen().equals("") && this.getMarca().equals("") && 
                this.getModelo().equals("")) || (this.getImagen().isEmpty() && 
                this.getMarca().isEmpty() && this.getModelo().isEmpty())){
            return true;       
        }
        return false;
    }
}