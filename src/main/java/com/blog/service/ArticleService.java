package com.blog.service;

import com.blog.entity.Article;
import com.blog.entity.Comment;

import java.util.List;

public interface ArticleService {

    int inserContent(Article article);

    List<Article> findByJoin();

    Article findByid(String id);

    List<Article> findByUserid(String id);

    void update(Article article);

    void deleteById(String id);

    List<Article>searchByKeyWord(String keyword);

}
