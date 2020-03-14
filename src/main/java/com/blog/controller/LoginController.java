package com.blog.controller;

import com.blog.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
    private final static Logger log = Logger.getLogger(LoginController.class);
    @Autowired
    private UserService userService;
    //验证图片验证码
    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse resp){
//        String inputCode = request.getParameter("inputCode").toUpperCase();
//        if(inputCode.length() == 0){
//            return "null";
//        }
//        String code = (String)request.getSession(false).getAttribute("code");//获取session中的图片验证码
//        if(inputCode.equals(code)){
//            return "true";
//        }
        return "true";
    }
}
