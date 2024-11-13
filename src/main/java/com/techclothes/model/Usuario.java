package com.techclothes.model;

public class Usuario {
    private int id;
    private String nombre;
    private String email;
    private String contraseña;
    private String direccionEnvio;
    private String telefono;
    private int rolId;

    // Constructor vacío
    public Usuario() { }

    // Constructor con todos los campos
    public Usuario(int id, String nombre, String email, String contraseña, String direccionEnvio, String telefono, int rolId) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.contraseña = contraseña;
        this.direccionEnvio = direccionEnvio;
        this.telefono = telefono;
        this.rolId = rolId;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getContraseña() { return contraseña; }
    public void setContraseña(String contraseña) { this.contraseña = contraseña; }

    public String getDireccionEnvio() { return direccionEnvio; }
    public void setDireccionEnvio(String direccionEnvio) { this.direccionEnvio = direccionEnvio; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public int getRolId() { return rolId; }
    public void setRolId(int rolId) { this.rolId = rolId; }
}

