package com.blog.mapper.article;

import com.blog.common.annotation.MyBatisDao;
import com.blog.entity.Article;
import tk.mybatis.mapper.common.Mapper;

@MyBatisDao
public interface ArticleMapper extends Mapper<Article> {

    int inserContent(Article article);


}
