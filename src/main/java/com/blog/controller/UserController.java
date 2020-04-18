package com.blog.controller;


import com.blog.entity.User;
import com.blog.security.Digests;
import com.blog.service.UserService;
import com.blog.utils.Encodes;
import com.blog.utils.RandomValidateCode;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    private final static Logger log = Logger.getLogger(UserController.class);
    @Autowired
    private UserService userService;

    //    判断昵称是否存在
    @RequestMapping("/checkNickName")
    @ResponseBody
    public String checkNickName(Model model, @RequestParam(value = "nickName", required = false) String nickName) {
        Map map = new HashMap<String, Object>();
        User user = userService.findByNickName(nickName);
        if (user == null) {
            //未注册
            return "true";
        }
        return "false";
    }

    //    判断手机号是否存在
    @RequestMapping("/checkPhone")
    @ResponseBody
    public String checkPhone(Model model, @RequestParam(value = "phoneNum", required = false) String phoneNum) {
        User user = userService.findByPhone(phoneNum);
        if (user == null) {
            //手机号为注册
            return "true";
        }
        return "false";
    }
    //图片验证码生成
    @RequestMapping(value = "getVerify")
    @ResponseBody
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("image/jpg");//设置相应的类型，告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode code = new RandomValidateCode();
        try {
            code.getRandcode(request, response);//输出验证码图片的方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //验证图片验证码
    @RequestMapping(value = "/code")
    @ResponseBody
    public String checkCode(HttpServletRequest request, HttpServletResponse response) {
        String inputCode = request.getParameter("inputCode").toUpperCase();
        if (inputCode.length() == 0) {
            return "null";
        }
        String verifyCode = (String) request.getSession(false).getAttribute("code");
        if (inputCode.equals(verifyCode)) {
            return "true";
        }
        return "false";
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    public String saveUser(Model model,HttpServletRequest request,User user,
                           @RequestParam(value = "nickname", required = false) String nickname,
                           @RequestParam(value = "cellphone", required = false) String cellphone,
                           @RequestParam(value = "vercode", required = false) String vercode,
                           @RequestParam(value = "password", required = false) String password) {
        log.debug("注册...");
        if (StringUtils.isBlank(vercode)) {
            model.addAttribute("error", "非法注册，请重新注册！");
            return "error";
        }
        User preUser = userService.findByPhone(cellphone);
        if (preUser !=null){
            return "500";
        }

        HttpSession session = request.getSession();

        String regcode=(String)session.getAttribute("regcode");

//        if(null == regcode){//验证码超时，请重新注册
//            return "past";
//        }
//        if (!regcode.equals(vercode)) {
//            return "error";
//        }
        user.setNickName(nickname);
        user.setPhone(cellphone);
        user.setPassword(entryptPassword(password));
        user.setImgUrl("/images/icon_m.jpg");
        userService.insert(user);
        log.info("注册成功");
        return "true";
    }

    /**
     * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
     */
    public static String entryptPassword(String plainPassword) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Digests.generateSalt(8);
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
        return Encodes.encodeHex(salt) + Encodes.encodeHex(hashPassword);
    }
    /**
     * 验证密码
     *
     * @param plainPassword 明文密码
     * @param password      密文密码
     * @return 验证成功返回true
     */
    public static boolean validatePassword(String plainPassword, String password) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Encodes.decodeHex(password.substring(0, 16));
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
        return password.equals(Encodes.encodeHex(salt) + Encodes.encodeHex(hashPassword));
    }
    //    注册页面的跳转
    @RequestMapping(value = "/sing_up")
    public String sing_up() {
        return "user/userRegist";
    }

    //    用户登录页面的跳转
    @RequestMapping(value = "/sing_in")
    public String sing_in() {
        return "user/userLogin";
    }



}
