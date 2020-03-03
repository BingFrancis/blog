package com.blog.controller;


import com.blog.entity.User;
import com.blog.security.Digests;
import com.blog.utils.Encodes;
import com.blog.utils.RandomValidateCode;
import com.sun.tools.internal.ws.processor.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    //图片验证码生成
    @RequestMapping(value = "getVerify")
    @ResponseBody
    public void getVerify(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("image/jpg");//设置相应的类型，告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode code = new RandomValidateCode();
        try {
            code.getRandcode(request,response);//输出验证码图片的方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//    //验证图片验证码
//    @RequestMapping(value = "/code")
//    @ResponseBody
//    public String checkCode(HttpServletRequest request,HttpServletResponse resp){
//        String inputCode = request.getParameter("inputCode").toUpperCase();
//        if(inputCode.length() == 0){
//            return "null";
//        }
//        String code = (String)request.getSession(false).getAttribute("code");//获取session中的图片验证码
//        if(inputCode.equals(code)){
//            return "true";
//        }
//        return "false";
//    }

    /**
     * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
     */
    public static String entryptPassword(String plainPassword) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Digests.generateSalt(8);
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
        return Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
    }

    /**
     * 验证密码
     * @param plainPassword 明文密码
     * @param password 密文密码
     * @return 验证成功返回true
     */
    public static boolean validatePassword(String plainPassword, String password) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Encodes.decodeHex(password.substring(0,16));
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
        return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
    }


//    注册页面的跳转
    @RequestMapping(value = "/sing_up")
    public String sing_up() {
        return "user/userRegist";
    }

//    用户登录页面的跳转
    @RequestMapping(value = "/sing_in")
    public String sing_() {
        return "user/login";
    }

//
//    //保存用户信息
//    @RequestMapping(value = "save")
//    @ResponseBody
//    public String save(User user, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
//        HttpSession session = request.getSession();
//        User pre_user = new User();
//
//        String pre_regtel = request.getParameter("loginName");
//        //获取session存的手机验证码
//        String regcode=(String)session.getAttribute("regcode");
//        //获取session的手机号
//        String regtel = (String) session.getAttribute("regtel");
//        //判断验证码和手机号
//        if(regcode == null || regtel == null){
//            return "past";
//        }
//        if(pre_user !=null){
//            return "false";
//        }
//        return "true";
//    }

}
