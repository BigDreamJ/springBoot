package com.j.blog.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.http.ResponseEntity;

@Setter
@Getter
public class User{
    private int id;
    private String user_name;
    private String user_password;

}
