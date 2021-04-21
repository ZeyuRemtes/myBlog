package com.blog.controller;

import com.blog.pojo.User;
import com.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * @version 1.0
 * @author: Remtes
 * @date: 2020/11/16 13:41
 */
@Controller
public class LoginShowController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String logins(Model model) {
        return "login";
    }

    @GetMapping("/regist")
    public String regists(Model model) {
        return "regist";
    }


    @PostMapping("/regist")
    public String regist(@RequestParam String username,
                         @RequestParam String password,
                         @RequestParam String nickname,
                         @RequestParam String email,
                        HttpSession session,
                        RedirectAttributes attributes){
        User user = userService.checkUser(username, password);

        if(user != null){
            attributes.addFlashAttribute("msg", "已注册用户请勿重复注册");
            return "redirect:/login";
        }else {
            userService.addUser(username, password, email,nickname);
            attributes.addFlashAttribute("msg", "注册成功");
            return "redirect:/login";
        }
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        RedirectAttributes attributes){
        User user = userService.checkUser(username, password);
        if(user != null){
            user.setPassword(null);
            if (session.getAttribute("user")!=null&&user.equals(session.getAttribute("user"))){
                attributes.addFlashAttribute("msg", "已经登录请勿重复登录");
                return "redirect:/login";
            }
            else {
                session.setAttribute("user", user);
            }
            attributes.addFlashAttribute("msg", "登陆成功");
            return "loginsuccess";
        }else {
            attributes.addFlashAttribute("msg", "用户名或密码错误");
            return "redirect:/login";
        }
    }
}
