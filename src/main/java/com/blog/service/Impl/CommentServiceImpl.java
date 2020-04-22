package com.blog.service.Impl;

import com.blog.entity.Comment;
import com.blog.mapper.article.CommentMapper;
import com.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl  implements CommentService {
    @Autowired
    private CommentMapper commentMapper;


    @Override
    public List<Comment> selectAll(String id) {
        return commentMapper.selectAll(id);
    }

    @Override
    public List<Comment> finadAllFirstComment(String id) {
        return commentMapper.finadAllFirstComment(id);
    }

    @Override
    public List<Comment> findAllChildrenComment(String id, String children) {
        return commentMapper.findAllChildrenComment(id,children);
    }

    @Override
    public int insertComment(Comment comment) {
        return commentMapper.insertComment(comment);
    }

    @Override
    public Comment findById(Long id) {
        Comment comment = new Comment();
        comment.setId( id );
        return commentMapper.selectOne( comment );
    }


    public void update(Comment comment) {
         commentMapper.updateByPrimaryKey(comment);
    }
}
