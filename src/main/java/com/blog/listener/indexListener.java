package com.blog.listener;

import com.blog.entity.Article;
import com.blog.mapper.article.ArticleMapper;
import com.blog.service.ArticleService;
import javafx.application.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;
import java.util.List;

public class indexListener implements ServletContextListener {

    @Autowired
    ArticleMapper articleMapper;
//    @Qualifier("articleMapper")
//    ArticleService articleMapper;

    private ApplicationContext context;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        context = new ClassPathXmlApplicationContext("classpath:spring-mybatis.xml");
        articleMapper = (ArticleMapper) context.getBean("articleMapper");
        ServletContext application = sce.getServletContext();
        List<Article> articleList=new ArrayList<Article>();
        articleList = articleMapper.findByJoin();
        application.setAttribute("articleList",articleList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
