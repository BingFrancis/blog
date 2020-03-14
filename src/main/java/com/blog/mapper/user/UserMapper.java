package com.blog.mapper.user;

import com.blog.common.annotation.MyBatisDao;
import com.blog.entity.User;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


@MyBatisDao
public interface UserMapper  extends Mapper<User> {

}
