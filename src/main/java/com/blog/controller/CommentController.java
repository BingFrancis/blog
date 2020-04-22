package com.blog.controller;

import com.blog.entity.Comment;
import com.blog.entity.User;
import com.blog.service.CommentService;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CommentController  {
    private final static Logger log = Logger.getLogger(CommentController.class);
    @Autowired
    private CommentService commentService;



    @RequestMapping("/comment")
    @ResponseBody
    public Map<String, Object> comment(Model model, HttpServletRequest request, @RequestParam(value = "id", required = false) Long id,
                                       @RequestParam(value = "article_id", required = false) Long article_id,
                                       @RequestParam(value = "auther_id", required = false) Long auther_id,
                                       @RequestParam(value = "comment_content", required = false) String comment_content) {
        Map map = new HashMap<String, Object>();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            map.put("data", "fail");
        }
        Comment comment = new Comment();
        comment.setChildren("0");
        comment.setArticleId(article_id);
        comment.setCommentContent(comment_content);
        comment.setAutherId(Long.valueOf(user.getId()));

        commentService.insertComment(comment);

        System.out.println(article_id + "," + auther_id + "," + comment_content);

        return map;
    }

    @RequestMapping("/commentfirst")
    @ResponseBody
    public Map<String,Object>commentfirst(Model model, HttpServletRequest request, @RequestParam(value = "id", required = false) Long id,
                                          @RequestParam(value = "article_id", required = false) Long article_id,
                                          @RequestParam(value = "auther_id", required = false) Long auther_id,
                                          @RequestParam(value = "comment_content", required = false) String comment_content){
        User user = (User) request.getSession().getAttribute("user");
        Map map = new HashMap<String,Object>();
        if(user ==null){
            map.put("data","fail");
            return map;
        }
        Comment comment = new Comment();
        comment.setArticleId(article_id);
        comment.setCommentContent(comment_content);
        comment.setAutherId(Long.valueOf(user.getId()));
        comment.setCommenteeid(auther_id);
        comment.setChildren("0");
        commentService.insertComment(comment);



        Comment fcomment = commentService.findById(id);

        if(StringUtils.isBlank( fcomment.getChildren() )){
            fcomment.setChildren( comment.getId().toString() );
        }else {
            fcomment.setChildren( fcomment.getChildren()+","+comment.getId().toString() );
        }

        commentService.update(fcomment);



        return map;
    }
}
