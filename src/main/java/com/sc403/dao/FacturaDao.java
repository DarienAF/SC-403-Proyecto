
package com.sc403.dao;

import com.sc403.domain.Factura;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FacturaDao extends JpaRepository <Factura,Long> {
     
}
