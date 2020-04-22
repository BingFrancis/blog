package com.blog.service.Impl;

import com.blog.entity.User;
import com.blog.mapper.user.UserMapper;
import com.blog.security.Digests;
import com.blog.service.UserService;
import com.blog.utils.Encodes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sun.nio.cs.US_ASCII;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;


    /**
     * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
     */
    @Autowired
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


    @Override
    public User findByNickName(String nickname) {
        User user = new User();
        user.setNickName(nickname);
        return userMapper.selectOne(user);
    }

    @Override
    public User findById(Long id) {
        User user = new User();
        user.setId(id.toString());
        return userMapper.selectOne(user);
    }

    @Override
    public User findByPhone(String phone) {
        User user =  new User();
        user.setPhone(phone);
        return userMapper.selectOne(user);
    }

    @Override
    public User selectByNickName(User user) {
        return null;
    }

    @Override
    public int deleteByPrimaryKey(Long id) {
        return 0;
    }

    @Transactional(readOnly = false)
    @Override
    public int insert(User user) {
        return userMapper.insert(user);
    }

    @Override
    public User login(String username, String password) {
        User user = new User();
        user.setPhone(username);
        user.setPassword(entryptPassword(password));
        return userMapper.selectOne(user);
    }

    @Override
    public int insertSelective(User record) {
        return 0;
    }

    @Override
    public User selectByPrimaryKey(Long id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(User record) {
        return 0;
    }

    @Override
    public List<User> findAll() {
        return null;
    }
}
