package com.blog.mapper.user;

import com.blog.common.annotation.MyBatisDao;
import com.blog.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


@MyBatisDao
public interface UserMapper  extends Mapper<User> {

    int updatePhoto(@Param("id") String id, @Param("img_url") String imgurl);

    int updateInformation(@Param("id") String id, @Param("nickName") String nickName,@Param("email")String email );

}
