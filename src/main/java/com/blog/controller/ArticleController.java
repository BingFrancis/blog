package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.blog.entity.Article;
import com.blog.entity.Comment;
import com.blog.entity.User;
import com.blog.mapper.article.ArticleMapper;
import com.blog.mapper.article.CommentMapper;
import com.blog.service.ArticleService;
import com.blog.service.CommentService;
import com.blog.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {

    private final static Logger log = Logger.getLogger(UserController.class);
    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    ArticleMapper articleMapper;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/getArticles", method = RequestMethod.GET)
    public String getArticles(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
        //设置当前页数与大小
        PageHelper.startPage(page, 5);
        List<Article> articleList = articleService.findByJoin();
        PageInfo pageInfo = new PageInfo(articleList, 5);
        model.addAttribute("articleList", pageInfo);
        return "/home";
    }


    //    用户登录页面的跳转
    @RequestMapping(value = "/write")
    public String write() {
        return "article/write";
    }


    //    用户登录页面的跳转
    @RequestMapping(value = "/toSearchArticle")
    public String toSearch() {
        return "article/searchArticle";
    }





    @ResponseBody
    @RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
    public JSONObject hello(HttpServletRequest request, HttpServletResponse response,
                            @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach) {

        JSONObject jsonObject = new JSONObject();

        try {
            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");
            String rootPath = request.getSession().getServletContext().getRealPath("/static/img/article/");


            /**
             * 文件路径不存在则需要创建文件路径
             */
            File filePath = new File(rootPath);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }

            // 最终文件名
            File realFile = new File(rootPath + File.separator + attach.getOriginalFilename());
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);

            // 下面response返回的json格式是editor.md所限制的，规范输出就OK

            jsonObject.put("success", 1);
            jsonObject.put("message", "上传成功");
            jsonObject.put("url", "/static/img/article/" + attach.getOriginalFilename());
        } catch (Exception e) {
            jsonObject.put("success", 0);
        }
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping(value = "/saveContent", method = RequestMethod.POST)
    public String saveContent(Model model, HttpServletRequest request, User user,
                              @RequestParam(value = "title", required = false) String title,
                              @RequestParam(value = "content", required = false) String content,
                              @RequestParam(value = "summary", required = false) String summary,
                              @RequestParam(value = "img_url", required = false) String img_url) {
        user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            Article article = new Article();
            if (title.equals("")) {
                title = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            }
            article.setTitle(title);
            article.setContent(content);
            article.setSummary(summary);
            article.setUserId((user.getId()));
            article.setAuther(user.getNickName());
            article.setImgUrl(img_url);
            article.setCommentCount(0L);
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
            article.setWriteDate(dateFormat.format(now));
            articleService.inserContent(article);
//            model.addAttribute("article_content",content);
            return "true";
        } else {
//            model.addAttribute("writeMessage","no");
            return "false";
        }

    }

    @RequestMapping(value = "getContent", method = RequestMethod.GET)
    public String getContent(Model model, @RequestParam(value = "a", required = false) String id) {
        Article articleDetails = articleService.findByid(id);
        model.addAttribute("details", articleDetails);
        List<Comment> list = commentService.finadAllFirstComment(id);
        if (list != null && list.size() > 0) {
            for (Comment c : list) {
                List<Comment> coments = commentService.findAllChildrenComment((c.getArticleId().toString()), c.getChildren());
                if (coments != null && coments.size() > 0) {
                    for (Comment com : coments) {
                        if (com.getCommenteeid() != null) {
                            User byUser = userService.findById(com.getCommenteeid());
                            com.setByUser(byUser);
                        }

                    }
                }
                c.setCommentList(coments);
            }
        }
        model.addAttribute("commentlist", list);
        return "article/view";
    }

    @ResponseBody
    @RequestMapping(value = "/deleteArticle", method = RequestMethod.POST)
    public Map<String, Object> deleteArticle(HttpServletRequest request, @RequestParam(value = "article_id", required = false) String id) {
        User user = (User) request.getSession().getAttribute("user");
        Map map = new HashMap<String, Object>();
        if (user == null) {
            map.put("data", "fail");
        } else {
            map.put("data", "ok");
            articleService.deleteById(id);
            commentMapper.deleteByArticleId(id);

        }
        return map;
    }


    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateArticle(Model model, @RequestParam(value = "a", required = false) String id) {
        Article articleDetails = articleService.findByid(id);
        model.addAttribute("details", articleDetails);
        return "article/update";
    }

    @ResponseBody
    @RequestMapping(value = "/updateArticle", method = RequestMethod.POST)
    public String updateArticle(Model model, HttpServletRequest request, User user,
                                @RequestParam(value = "id", required = false) String id,
                                @RequestParam(value = "title", required = false) String title,
                                @RequestParam(value = "content", required = false) String content,
                                @RequestParam(value = "summary", required = false) String summary,
                                @RequestParam(value = "img_url", required = false) String img_url) {
        user = (User) request.getSession().getAttribute("user");
        if(user !=null){
            Article article = new Article();
            if (title.equals("")) {
                title = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            }
            article.setId(id);
            article.setTitle(title);
            article.setContent(content);
            article.setSummary(summary);
            article.setUserId((user.getId()));
            article.setAuther(user.getNickName());
            article.setImgUrl(img_url);
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
            article.setUpdateDate(dateFormat.format(now));
            articleMapper.updateArticle(id,title,content,summary,img_url,dateFormat.format(now));
            return "true";
        }
         else {
            return "false";
        }

    }


    @RequestMapping(value ="/search")
    public String search(Model model, @RequestParam(value = "keyword", required = false) String keyword,
                         @RequestParam(value = "page", defaultValue = "1") Integer page) {
        if(keyword == null){
            keyword = "";
            PageHelper.startPage(page, 5);
            List<Article> articleList = articleService.searchByKeyWord(keyword);
            PageInfo pageInfo = new PageInfo(articleList, 5);
            model.addAttribute("searchList", pageInfo);
            model.addAttribute("keyword",keyword);
            return "/article/searchArticle";
            //设置当前页数与大小

        }else{
            PageHelper.startPage(page, 5);
            List<Article> articleList = articleService.searchByKeyWord(keyword);
            PageInfo pageInfo = new PageInfo(articleList, 5);
            model.addAttribute("searchList", pageInfo);
            model.addAttribute("keyword",keyword);
            return "/article/searchArticle";
        }
    }
}
