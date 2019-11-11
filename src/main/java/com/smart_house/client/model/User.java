package com.smart_house.client.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Transient
    private String confirmPassword;

    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "id_user"),
            inverseJoinColumns = @JoinColumn(name = "id_role"))
    private Set<Role> roles;

    @Column(name = "fio")
    private String fio;
    @Column(name = "telephone")
    private String telephone;
    @Column(name = "birth")
    private String dateOfBirth;
    @Column(name = "sex")
    private String sex;
    @Column(name = "city")
    private String city;
    @Column(name = "email")
    private String email;
    @Column(name = "status")
    private String status;
    @Column(name = "createDate")
    private String AccountCreationDate;
    @Column(name = "photo")
    private String photo;
    @Column(name = "secret")
    private String secret;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "user_items", joinColumns = @JoinColumn(name = "id_user"),
            inverseJoinColumns = @JoinColumn(name = "id_item"))
    private Set<Item> ownItems;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAccountCreationDate() {
        return AccountCreationDate;
    }

    public void setAccountCreationDate(String accountCreationDate) {
        AccountCreationDate = accountCreationDate;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public Set<Item> getOwnItems() {
        return ownItems;
    }

    public void setOwnItems(Set<Item> ownItems) {
        this.ownItems = ownItems;
    }
}
