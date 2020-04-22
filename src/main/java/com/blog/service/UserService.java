package com.blog.service;

import com.blog.entity.User;

import java.util.List;

public interface UserService {
    /**
     * 根据昵称查询用户
     * @param nickname
     * @return
     */
    User findByNickName(String nickname);

    /**
     * 根据用户id查询用户
     * @param id
     * @return
     */
    User findById(Long id);

    /**
     * *
     * @param phone
     * @return
     */
    User findByPhone(String phone);

    /**
     *
     * @param user
     * @return
     */

    User selectByNickName(User user);
    /**
     * 根据id删除用户
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Long id);
    /**
     * 添加用户
     * @return
     */
    int insert(User record);

    User login(String username,String password);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);
    /**
     * 更新用户信息
     * @return
     */
    int updateByPrimaryKey(User record);

    List<User> findAll();
}
