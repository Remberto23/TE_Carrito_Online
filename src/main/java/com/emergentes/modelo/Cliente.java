
package com.emergentes.modelo;

public class Cliente {
    private int idCliente;
    private int ci;
    private String nombres;
    private String direccion;
    private String email;
    private String password;

    public Cliente() {
    }

    public Cliente(int idCliente, int ci, String nombres, String direccion, String email, String password) {
        this.idCliente = idCliente;
        this.ci = ci;
        this.nombres = nombres;
        this.direccion = direccion;
        this.email = email;
        this.password = password;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
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
        return "Cliente{" + "idCliente=" + idCliente + ", ci=" + ci + ", nombres=" + nombres + ", direccion=" + direccion + ", email=" + email + ", password=" + password + '}';
    }
    
}
