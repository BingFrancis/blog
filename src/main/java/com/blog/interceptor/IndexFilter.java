package com.blog.interceptor;


import com.blog.entity.Article;
import com.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class IndexFilter  implements Filter {

    @Autowired
    private ArticleService articleService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("===========自定义过滤器==========");
//        List<Article> articleList=new ArrayList<Article>();
//        articleList = articleService.findByJoin1();
//        request.setAttribute("articleList", articleList );
//        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
