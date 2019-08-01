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
@Table(name = "LAYOUTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Layouts.findAll", query = "SELECT l FROM Layouts l"),
    @NamedQuery(name = "Layouts.findById", query = "SELECT l FROM Layouts l WHERE l.id = :id"),
    @NamedQuery(name = "Layouts.findByPlanCode", query = "SELECT l FROM Layouts l WHERE l.planCode = :planCode"),
    @NamedQuery(name = "Layouts.findByDesignMatrix", query = "SELECT l FROM Layouts l WHERE l.designMatrix = :designMatrix")})
public class Layouts implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 20)
    @Column(name = "PLAN_CODE")
    private String planCode;
    @Size(max = 20)
    @Column(name = "DESIGN_MATRIX")
    private String designMatrix;

    public Layouts() {
    }

    public Layouts(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPlanCode() {
        return planCode;
    }

    public void setPlanCode(String planCode) {
        this.planCode = planCode;
    }

    public String getDesignMatrix() {
        return designMatrix;
    }

    public void setDesignMatrix(String designMatrix) {
        this.designMatrix = designMatrix;
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
        if (!(object instanceof Layouts)) {
            return false;
        }
        Layouts other = (Layouts) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "databasepack.Layouts[ id=" + id + " ]";
    }
    
}
