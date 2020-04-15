package com.blog.controller;

import com.blog.entity.Article;
import com.blog.entity.User;
import com.blog.security.Digests;
import com.blog.service.ArticleService;
import com.blog.service.UserService;
import com.blog.utils.Encodes;
import com.blog.utils.UserUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class LoginController {
    private final static Logger log = Logger.getLogger(LoginController.class);
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
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
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Model model, HttpServletRequest request,
                        @RequestParam(value = "phone", required = false) String phone,
                        @RequestParam(value = "password", required = false) String password,
                        @RequestParam(value = "vercode",required = false)String vercode,
                        @RequestParam(value = "page", defaultValue = "1") Integer page) {
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
            request.getSession().setAttribute("user",pre_login);
            model.addAttribute("user",pre_login);
            PageHelper.startPage(page,5);
            List<Article> articleList = articleService.findByJoin();
            PageInfo pageInfo = new PageInfo(articleList,5);
            model.addAttribute("articleList",pageInfo);
            return "/home";
        }else{
            model.addAttribute("message","fail");
            return "user/userLogin";
        }
    }
}
