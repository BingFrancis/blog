package com.blog.service.Impl;

import com.blog.entity.Article;
import com.blog.mapper.article.ArticleMapper;
import com.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ArticleServiceImpl  implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;
    @Override
    public int inserContent(Article article) {
        return articleMapper.inserContent(article);
    }

    @Override
    public List<Article> findByJoin() {
        return  articleMapper.findByJoin();
    }
}
