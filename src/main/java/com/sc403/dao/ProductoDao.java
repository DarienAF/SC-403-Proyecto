package com.sc403.dao;

import com.sc403.domain.Producto;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductoDao extends 
        JpaRepository<Producto, Long>{
    //QUERY
    //METODO PARA OBTENER UN LISTADO DE PRODUCTOS FILTRADO
    //POR PRECIO, ORDENADO POR DESCRIPCION
    
    public List<Producto> findByPrecioBetweenOrderByDescripcion(
            double precioInf, double precioSup);
      
    //JPQL
     //METODO PARA OBTENER UN LISTADO DE PRODUCTOS FILTRADO
    //POR PRECIO, ORDENADO POR DESCRIPCION
    @Query(value="Select a from Producto a where a.precio between :precioInf and :precioSup order by a.descripcion asc")
    public List<Producto> consultaJPQL(
            double precioInf, double precioSup);
   
    //SQL
    //METODO PARA OBTENER UN LISTADO DE PRODUCTOS FILTRADO
    //POR PRECIO, ORDENADO POR DESCRIPCION
    @Query(nativeQuery=true,value="Select * from producto a where a.precio between :precioInf and :precioSup order by a.descripcion asc")
    public List<Producto> consultaSQL(
            double precioInf, double precioSup);
}
