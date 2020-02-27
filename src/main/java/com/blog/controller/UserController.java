package com.blog.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
//    注册页面的跳转
    @RequestMapping(value = "/sing_up")
    public String sing_up() {
        return "user/userRegist";
    }

//    用户登录页面的跳转
    @RequestMapping(value = "/sing_in")
    public String sing_() {
        return "user/userLogin";
    }

}
