package com.blog.mapper.article;

import com.blog.entity.Comment;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CommentMapper extends Mapper<Comment> {
    //根据文章id查询所有评论
    List<Comment>selectAll(String id);

    List<Comment>finadAllFirstComment(String id);

    int insertComment(Comment comment);

    List<Comment>findAllChildrenComment(@Param("cid")String id,@Param("children")String children);

}
