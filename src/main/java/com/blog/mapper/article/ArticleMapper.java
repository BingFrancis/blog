package com.blog.mapper.article;

import com.blog.common.annotation.MyBatisDao;
import com.blog.entity.Article;
import tk.mybatis.mapper.common.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
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

    List<Article> findByUserid(String id);

    int updateComment(@Param("id") String id,@Param("comment_count") Long comment_count);

    int updateArticle(@Param("id") String id, @Param("title") String title,@Param("content") String content, @Param("summary")
                      String summary, @Param("imgUrl")String imgUrl, @Param("updateDate")String updateDate);

    void deletearticle(String id);


    List<Article> findByKeyWord(@Param("keyword")String keyword);
}
