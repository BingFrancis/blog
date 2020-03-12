package com.blog.mapper.user;

import com.blog.common.annotation.MyBatisDao;
import com.blog.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;


@MyBatisDao
public interface UserMapper {
    /**
     * 根据登录名称查询用户
     * @param
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
