package com.blog.service;

import com.blog.pojo.User;

public interface UserService {

    public User checkUser(String username, String password);

    public int addUser(String username, String password, String email,String nickname);
}
