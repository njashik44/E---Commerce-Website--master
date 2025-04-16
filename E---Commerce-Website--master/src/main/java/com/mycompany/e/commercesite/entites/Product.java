
package com.mycompany.e.commercesite.entites;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int pId;
    private String pName;
    
    @Column(length = 3000, name = "user_pic")
    private String pDescp;
    private String pPhoto;
    private int pPrice;
    private int pDiscount;
    private int pQuantity;
    
    @ManyToOne
    private Category category;
   
    
       // 1. Default Constructor
    public Product() {
        // Default constructor required by JPA/Hibernate
    }

    // 2. Parameterized Constructor (without ID)
    public Product(String pName, String pDescp, String pPhoto, int pPrice, int pDiscount, int pQuantity, Category category) {
        this.pName = pName;
        this.pDescp = pDescp;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.category = category;
    }


    // Getters and Setters
    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDescp() {
        return pDescp;
    }

    public void setpDescp(String pDescp) {
        this.pDescp = pDescp;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }
    
     
   public Category getCategory() {
       return category;
   }

    public void setCategory(Category category) {
       this.category = category;
   }
    
    @Override
public String toString() {
    return "Product{" +
           "pId=" + pId +
           ", pName='" + pName + '\'' +
           ", pDescp='" + pDescp + '\'' +
           ", pPhoto='" + pPhoto + '\'' +
           ", pPrice=" + pPrice +
           ", pDiscount=" + pDiscount +
           ", pQuantity=" + pQuantity +
           ", category=" + (category != null ? category.getCategoryTitle() : "null") +
           '}';
}

public int getPriceAfterApplyingDiscount(){
    int d=(int)((this.getpDiscount()/100.0)*this.getpPrice());
    return this.getpPrice() - d;
}
}
