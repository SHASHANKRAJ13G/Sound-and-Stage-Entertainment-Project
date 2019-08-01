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
@Table(name = "SHOWS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Shows.findAll", query = "SELECT s FROM Shows s"),
    @NamedQuery(name = "Shows.findById", query = "SELECT s FROM Shows s WHERE s.id = :id"),
    @NamedQuery(name = "Shows.findByMovieName", query = "SELECT s FROM Shows s WHERE s.movieName = :movieName"),
    @NamedQuery(name = "Shows.findByStartTime", query = "SELECT s FROM Shows s WHERE s.startTime = :startTime"),
    @NamedQuery(name = "Shows.findByEndTime", query = "SELECT s FROM Shows s WHERE s.endTime = :endTime"),
    @NamedQuery(name = "Shows.findByHallCode", query = "SELECT s FROM Shows s WHERE s.hallCode = :hallCode"),
    @NamedQuery(name = "Shows.findByPrice", query = "SELECT s FROM Shows s WHERE s.price = :price")})
public class Shows implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 20)
    @Column(name = "MOVIE_NAME")
    private String movieName;
    @Size(max = 20)
    @Column(name = "START_TIME")
    private String startTime;
    @Size(max = 20)
    @Column(name = "END_TIME")
    private String endTime;
    @Size(max = 20)
    @Column(name = "HALL_CODE")
    private String hallCode;
    @Size(max = 20)
    @Column(name = "PRICE")
    private String price;

    public Shows() {
    }

    public Shows(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
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

    public String getHallCode() {
        return hallCode;
    }

    public void setHallCode(String hallCode) {
        this.hallCode = hallCode;
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
        if (!(object instanceof Shows)) {
            return false;
        }
        Shows other = (Shows) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "databasepack.Shows[ id=" + id + " ]";
    }
    
}
