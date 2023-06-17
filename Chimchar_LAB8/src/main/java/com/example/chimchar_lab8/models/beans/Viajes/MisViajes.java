package com.example.chimchar_lab8.models.beans.Viajes;

import com.example.chimchar_lab8.models.beans.Usuarios.Usuarios;

public class MisViajes {

    private int id_mis_viajes;
    private String fecha_reserva;
    private String fecha_viaje;
    private String ciudad_origen;
    private String ciudad_destino;
    private EmpresaSeguro empresaSeguro;
    private Usuarios usuarios;
    private double costo_total;

    public int getId_mis_viajes() {
        return id_mis_viajes;
    }

    public void setId_mis_viajes(int id_mis_viajes) {
        this.id_mis_viajes = id_mis_viajes;
    }

    public String getFecha_reserva() {
        return fecha_reserva;
    }

    public void setFecha_reserva(String fecha_reserva) {
        this.fecha_reserva = fecha_reserva;
    }

    public String getFecha_viaje() {
        return fecha_viaje;
    }

    public void setFecha_viaje(String fecha_viaje) {
        this.fecha_viaje = fecha_viaje;
    }

    public String getCiudad_origen() {
        return ciudad_origen;
    }

    public void setCiudad_origen(String ciudad_origen) {
        this.ciudad_origen = ciudad_origen;
    }

    public String getCiudad_destino() {
        return ciudad_destino;
    }

    public void setCiudad_destino(String ciudad_destino) {
        this.ciudad_destino = ciudad_destino;
    }

    public EmpresaSeguro getEmpresaSeguro() {
        return empresaSeguro;
    }

    public void setEmpresaSeguro(EmpresaSeguro empresaSeguro) {
        this.empresaSeguro = empresaSeguro;
    }

    public Usuarios getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(Usuarios usuarios) {
        this.usuarios = usuarios;
    }

    public double getCosto_total() {
        return costo_total;
    }

    public void setCosto_total(double costo_total) {
        this.costo_total = costo_total;
    }


}
