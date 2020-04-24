package com.blog.service;

import com.blog.entity.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> selectAll(String id);

    List<Comment>finadAllFirstComment(String id);

    List<Comment>findAllChildrenComment(String cid,String children);

    int insertComment(Comment comment);

    Comment findById(Long id);

    void update(Comment comment);

    /**
     * 根据id删除评论
     * @param id
     */
    void deleteById(Long id);

    void deleteChildrenComment(String children);

}
