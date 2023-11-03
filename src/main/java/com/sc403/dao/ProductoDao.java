package com.sc403.dao;

import com.sc403.domain.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoDao extends 
        JpaRepository<Producto, Long>{
    
}
