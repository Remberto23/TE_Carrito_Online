
package com.emergentes.modelo;

public class Usuario {
    private int idUsuario;
    private int ci;
    private String nombre;
    private String apellidos;
    private String cargo;
    private String email;
    private String password;

    public Usuario(int idUsuario, int ci, String nombre, String apellidos, String cargo, String email, String password) {
        this.idUsuario = idUsuario;
        this.ci = ci;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.cargo = cargo;
        this.email = email;
        this.password = password;
    }

    public Usuario() {
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", ci=" + ci + ", nombre=" + nombre + ", apellidos=" + apellidos + ", cargo=" + cargo + ", email=" + email + ", password=" + password + '}';
    }
    
}