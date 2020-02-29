package com.blog.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController {

    //验证图片验证码
    @RequestMapping(value = "/code")
    @ResponseBody
    public String checkCode(HttpServletRequest request, HttpServletResponse resp){
        String inputCode = request.getParameter("inputCode").toUpperCase();
        if(inputCode.length() == 0){
            return "null";
        }
        String code = (String)request.getSession(false).getAttribute("code");//获取session中的图片验证码
        if(inputCode.equals(code)){
            return "true";
        }
        return "false";
    }
}
