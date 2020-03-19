package com.blog.controller;

import com.blog.entity.User;
import com.blog.security.Digests;
import com.blog.service.UserService;
import com.blog.utils.Encodes;
import com.blog.utils.UserUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


@Controller
public class LoginController {
    private final static Logger log = Logger.getLogger(LoginController.class);
    @Autowired
    private UserService userService;
    public static String entryptPassword(String plainPassword) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Digests.generateSalt(8);
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
        return Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
    }

    public static boolean validatePassword(String plainPassword, String password) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Encodes.decodeHex(password.substring(0, 16));
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
        return password.equals(Encodes.encodeHex(salt) + Encodes.encodeHex(hashPassword));
    }



    //验证图片验证码
    @RequestMapping(value = "/login")
    public String login(Model model, HttpServletRequest request,
                        @RequestParam(value = "phone", required = false) String phone,
                        @RequestParam(value = "password", required = false) String password,
                        @RequestParam(value = "vercode",required = false)String vercode) {
        //核验图片验证码
        String verifyCode = (String) request.getSession(false).getAttribute("code");
        if (!vercode.toUpperCase().equals(verifyCode)) {
            model.addAttribute("message","false");
            return "user/userLogin";
        }
        User pre_login = userService.findByPhone(phone);
        if(pre_login == null){
            model.addAttribute("message","null");
            return "user/userLogin";
        }
        if(validatePassword(password,pre_login.getPassword())){
            log.info("登录成功");
            model.addAttribute("user",pre_login);
            return "index";
        }else{
            model.addAttribute("message","fail");
            return "user/userLogin";
        }
    }
}
