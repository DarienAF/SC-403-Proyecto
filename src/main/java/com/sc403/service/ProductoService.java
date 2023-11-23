package com.sc403.service;

import com.sc403.domain.Producto;
import java.util.List;

public interface ProductoService {
    
    //Se obtiene un array List con todas las productos de la tabla
    public List<Producto> getProductos(boolean activo);
    
    //Se obtiene una Producto segun el Id pasado por parametro
    public Producto getProducto(Producto producto);
            
    //Se actualiza una producto o se inserta una nueva... (Si no hay id es un insert)
    public void save(Producto producto);
    
    //Se elimina una producto segun el id pasado
    
    public void delete(Producto producto);
    
     //METODO PARA OBTENER UN LISTADO DE PRODUCTOS FILTRADO
    //POR PRECIO, ORDENADO POR DESCRIPCION
    
    public List<Producto> consultaQuery(
            double precioInf, double precioSup);
    
         //METODO PARA OBTENER UN LISTADO DE PRODUCTOS FILTRADO
    //POR PRECIO, ORDENADO POR DESCRIPCION
    
    public List<Producto> consultaJPQL(
            double precioInf, double precioSup);
    
     //METODO PARA OBTENER UN LISTADO DE PRODUCTOS FILTRADO
    //POR PRECIO, ORDENADO POR DESCRIPCION
    
    public List<Producto> consultaSQL(
            double precioInf, double precioSup);
}
