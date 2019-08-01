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
@Table(name = "SNACKS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Snacks.findAll", query = "SELECT s FROM Snacks s"),
    @NamedQuery(name = "Snacks.findById", query = "SELECT s FROM Snacks s WHERE s.id = :id"),
    @NamedQuery(name = "Snacks.findBySnackName", query = "SELECT s FROM Snacks s WHERE s.snackName = :snackName"),
    @NamedQuery(name = "Snacks.findByPrice", query = "SELECT s FROM Snacks s WHERE s.price = :price")})
public class Snacks implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 20)
    @Column(name = "SNACK_NAME")
    private String snackName;
    @Size(max = 20)
    @Column(name = "PRICE")
    private String price;

    public Snacks() {
    }

    public Snacks(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSnackName() {
        return snackName;
    }

    public void setSnackName(String snackName) {
        this.snackName = snackName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
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
        if (!(object instanceof Snacks)) {
            return false;
        }
        Snacks other = (Snacks) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "databasepack.Snacks[ id=" + id + " ]";
    }
    
}
