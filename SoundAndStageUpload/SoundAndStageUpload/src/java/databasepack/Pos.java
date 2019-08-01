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
@Table(name = "POS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pos.findAll", query = "SELECT p FROM Pos p"),
    @NamedQuery(name = "Pos.findById", query = "SELECT p FROM Pos p WHERE p.id = :id"),
    @NamedQuery(name = "Pos.findBySiteLocation", query = "SELECT p FROM Pos p WHERE p.siteLocation = :siteLocation"),
    @NamedQuery(name = "Pos.findByStartTime", query = "SELECT p FROM Pos p WHERE p.startTime = :startTime"),
    @NamedQuery(name = "Pos.findByEndTime", query = "SELECT p FROM Pos p WHERE p.endTime = :endTime"),
    @NamedQuery(name = "Pos.findByPrice", query = "SELECT p FROM Pos p WHERE p.price = :price"),
    @NamedQuery(name = "Pos.findBySnackList", query = "SELECT p FROM Pos p WHERE p.snackList = :snackList"),
    @NamedQuery(name = "Pos.findByPlanCode", query = "SELECT p FROM Pos p WHERE p.planCode = :planCode")})
public class Pos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 20)
    @Column(name = "SITE_LOCATION")
    private String siteLocation;
    @Size(max = 20)
    @Column(name = "START_TIME")
    private String startTime;
    @Size(max = 20)
    @Column(name = "END_TIME")
    private String endTime;
    @Size(max = 20)
    @Column(name = "PRICE")
    private String price;
    @Size(max = 20)
    @Column(name = "SNACK_LIST")
    private String snackList;
    @Size(max = 20)
    @Column(name = "PLAN_CODE")
    private String planCode;

    public Pos() {
    }

    public Pos(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSiteLocation() {
        return siteLocation;
    }

    public void setSiteLocation(String siteLocation) {
        this.siteLocation = siteLocation;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSnackList() {
        return snackList;
    }

    public void setSnackList(String snackList) {
        this.snackList = snackList;
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
        if (!(object instanceof Pos)) {
            return false;
        }
        Pos other = (Pos) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "databasepack.Pos[ id=" + id + " ]";
    }
    
}
