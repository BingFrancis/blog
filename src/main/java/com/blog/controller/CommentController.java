package com.blog.controller;

import com.blog.entity.Comment;
import com.blog.entity.User;
import com.blog.service.CommentService;
import org.apache.commons.lang3.time.DateUtils;
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
public class CommentController {

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
        if(user == null){
            map.put("data","fail");
        }
        Comment comment = new Comment();
        comment.setChildren("0");
        comment.setArticleId(article_id);
        comment.setCommentContent(comment_content);
//        文章的作者即被评论人
//        comment.setCommenteeid(auther_id);
//        评论人
        comment.setAutherId(Long.valueOf(user.getId()));

        commentService.insertComment(comment);

        System.out.println(article_id+","+auther_id+","+comment_content);

        return map;
    }

}
