package com.nore.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

/**
 * @Author:nore
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User {
    private Integer id;
    private String username;
    private String password;
    private String mail;
    private String salt;
    private Date registerTime;

    public User(String username, String password, String mail, String salt, Date registerTime) {
        this.username = username;
        this.password = password;
        this.mail = mail;
        this.salt = salt;
        this.registerTime = registerTime;
    }
}
