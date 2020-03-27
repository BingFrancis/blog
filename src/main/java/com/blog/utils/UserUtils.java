package com.blog.utils;

import com.blog.entity.User;
import com.blog.mapper.user.UserMapper;
import com.blog.security.Digests;
import org.springframework.beans.factory.annotation.Autowired;

public class UserUtils {

    /**
     * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
     */
    public  String entryptPassword(String plainPassword) {
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
    public  boolean validatePassword(String plainPassword, String password) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Encodes.decodeHex(password.substring(0,16));
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
        return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
    }

//    private static UserMapper userMapper = SpringContextHolder.getBean(UserMapper.class);
    /**
     * 根据登录名获取用户
     *
     * @param loginName
     * @return 取不到返回null
//     */
//    public static User getByLoginName(String loginName) {
//        User user = userMapper.selectByNickName(new User(loginName));
//        if (user == null) {
//            return null;
//        }
//        return user;
//    }
}
