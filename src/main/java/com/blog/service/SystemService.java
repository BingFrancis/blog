package com.blog.service;

import com.blog.entity.User;
import com.blog.mapper.user.UserMapper;
import com.blog.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class SystemService {

    @Autowired
    private UserMapper UserMapper;

    /**
     * 根据登录名获取用户
     * @param loginName
     * @return
     */
    public User getUserByLoginName(String loginName) {
        return UserUtils.getByLoginName(loginName);
    }


    public static void main(String[] args) {

       User user= UserUtils.getByLoginName("马化腾");
        System.out.println(user);
    }

}
