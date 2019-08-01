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
@Table(name = "HALLS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Halls.findAll", query = "SELECT h FROM Halls h"),
    @NamedQuery(name = "Halls.findById", query = "SELECT h FROM Halls h WHERE h.id = :id"),
    @NamedQuery(name = "Halls.findByHallCode", query = "SELECT h FROM Halls h WHERE h.hallCode = :hallCode"),
    @NamedQuery(name = "Halls.findByHallPlan", query = "SELECT h FROM Halls h WHERE h.hallPlan = :hallPlan"),
    @NamedQuery(name = "Halls.findBySiteName", query = "SELECT h FROM Halls h WHERE h.siteName = :siteName")})
public class Halls implements Serializable {
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
    @Column(name = "HALL_PLAN")
    private String hallPlan;
    @Size(max = 20)
    @Column(name = "SITE_NAME")
    private String siteName;

    public Halls() {
    }

    public Halls(Integer id) {
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

    public String getHallPlan() {
        return hallPlan;
    }

    public void setHallPlan(String hallPlan) {
        this.hallPlan = hallPlan;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
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
        if (!(object instanceof Halls)) {
            return false;
        }
        Halls other = (Halls) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "databasepack.Halls[ id=" + id + " ]";
    }
    
}
