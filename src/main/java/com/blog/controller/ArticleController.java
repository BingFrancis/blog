package com.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArticleController {
    //    用户登录页面的跳转
    @RequestMapping(value = "/write")
    public String write() {
        return "article/write";
    }
}
