package com.blog.service.impl;

import com.blog.dao.UserDao;
import com.blog.pojo.User;
import com.blog.service.UserService;
import com.blog.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User checkUser(String username, String password) {
        User user = userDao.queryByUsernameAndPassword(username, MD5Utils.code(password));
        return user;
    }

    @Override
    public int addUser(String username, String password,String email,String nickname) {
        User user = new User();
        user.setUpdateTime(new Date());
        user.setCreateTime(new Date());
        user.setUsername(username);
        user.setNickname(nickname);
        user.setPassword(MD5Utils.code(password));
        user.setAvatar("https://picsum.photos/100/100");
        user.setEmail(email);

        userDao.addByUser(user);
        return 1;
    }
}
