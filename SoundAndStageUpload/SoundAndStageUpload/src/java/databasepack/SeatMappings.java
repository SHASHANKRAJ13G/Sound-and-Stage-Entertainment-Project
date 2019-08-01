/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databasepack;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Vasudev
 */
@Entity
@Table(name = "SEAT_MAPPINGS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SeatMappings.findAll", query = "SELECT s FROM SeatMappings s"),
    @NamedQuery(name = "SeatMappings.findById", query = "SELECT s FROM SeatMappings s WHERE s.id = :id"),
    @NamedQuery(name = "SeatMappings.findByHallCode", query = "SELECT s FROM SeatMappings s WHERE s.hallCode = :hallCode"),
    @NamedQuery(name = "SeatMappings.findByPlanCode", query = "SELECT s FROM SeatMappings s WHERE s.planCode = :planCode")})
public class SeatMappings implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 20)
    @Column(name = "HALL_CODE")
    private String hallCode;
    @Size(max = 20)
    @Column(name = "PLAN_CODE")
    private String planCode;

    public SeatMappings() {
    }

    public SeatMappings(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHallCode() {
        return hallCode;
    }

    public void setHallCode(String hallCode) {
        this.hallCode = hallCode;
    }

    public String getPlanCode() {
        return planCode;
    }

    public void setPlanCode(String planCode) {
        this.planCode = planCode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SeatMappings)) {
            return false;
        }
        SeatMappings other = (SeatMappings) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "databasepack.SeatMappings[ id=" + id + " ]";
    }
    
}