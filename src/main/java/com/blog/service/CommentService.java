package com.blog.service;

import com.blog.entity.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> selectAll(String id);

    List<Comment>finadAllFirstComment(String id);

    int insertComment(Comment comment);
}
