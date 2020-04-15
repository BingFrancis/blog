package com.blog.mapper.article;

import com.blog.common.annotation.MyBatisDao;
import com.blog.entity.Article;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@MyBatisDao
public interface ArticleMapper extends Mapper<Article> {

    int inserContent(Article article);

    /**
     * article与user连接查询
     * @return
     */

    List<Article> findByJoin();

    Article findByid(String id);

}
