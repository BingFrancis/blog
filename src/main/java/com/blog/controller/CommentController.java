package com.blog.controller;

import com.blog.entity.Article;
import com.blog.entity.Comment;
import com.blog.entity.User;
import com.blog.mapper.article.ArticleMapper;
import com.blog.service.ArticleService;
import com.blog.service.CommentService;
import com.github.pagehelper.util.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.blog.common.DeleteIdUtil;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CommentController {
    private final static Logger log = Logger.getLogger(CommentController.class);

    @Autowired
    private CommentService commentService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ArticleMapper articleMapper;


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
        Article article = articleMapper.findByid(article_id.toString());
        articleMapper.updateComment(article_id.toString(),article.getCommentCount()+1);
        return map;
    }

    @RequestMapping("/commentfirst")
    @ResponseBody
    public Map<String, Object> commentfirst(Model model, HttpServletRequest request, @RequestParam(value = "id", required = false) Long id,
                                            @RequestParam(value = "article_id", required = false) Long article_id,
                                            @RequestParam(value = "auther_id", required = false) Long auther_id,
                                            @RequestParam(value = "comment_content", required = false) String comment_content) {
        User user = (User) request.getSession().getAttribute("user");
        Map map = new HashMap<String, Object>();
        if (user == null) {
            map.put("data", "fail");
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

        if (StringUtils.isBlank(fcomment.getChildren())) {
            fcomment.setChildren(comment.getId().toString());
        } else {
            fcomment.setChildren(fcomment.getChildren() + "," + comment.getId().toString());
        }

        commentService.update(fcomment);


        return map;
    }

    @RequestMapping("/deleteComment")
    @ResponseBody
    public Map<String, Object> deleteComment(Model model, HttpServletRequest request, @RequestParam(value = "comment_id", required = false) Long id, @RequestParam(value = "auther_id", required = false) Long uid,
                                             @RequestParam(value = "article_id", required = false) Long article_id, @RequestParam(value = "fid", required = false) Long fid) {
        int num = 0;
        Map map = new HashMap<String, Object>();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            map.put("data", "fail");
        } else {
            Comment comment = commentService.findById(id);
            if (fid != null) {//评论为子评论，将父评论里的children里的id去掉
                //id
                Comment fcomm = commentService.findById(fid);
                String child = DeleteIdUtil.deleteString(fcomm.getChildren(), id);
                fcomm.setChildren(child);
                commentService.deleteById(id);
                commentService.update(fcomm);

            } else {//评论为一级评论，遍历删除子评论
                String children = comment.getChildren();
                commentService.deleteChildrenComment(children);
                commentService.deleteById(id);
                Article article = articleService.findByid(article_id.toString());
                articleMapper.updateComment(article_id.toString(),article.getCommentCount()-1);
            }
            map.put("data", "q");
        }
        return map;
    }
}
