package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.blog.entity.Article;
import com.blog.entity.User;
import com.blog.service.ArticleService;
import com.blog.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {

    private final static Logger log = Logger.getLogger(UserController.class);
    @Autowired
    private ArticleService articleService;


    //    用户登录页面的跳转
    @RequestMapping(value = "/write")
    public String write() {
        return "article/write";
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

    @RequestMapping(value ="/saveContent", method = RequestMethod.POST)
    public String saveContent(Model model, HttpServletRequest request, User user,
                       @RequestParam(value = "title", required = false) String title,
                       @RequestParam(value = "content", required = false) String content1) {
        user = (User) request.getSession().getAttribute("user");
        if(user !=null){
            System.out.println(user.getId());
            System.out.println(title);
            System.out.println(content1);
            Article article = new Article();
            article.setTitle(title);
            article.setContent(content1);
            article.setUserId(Long.parseLong(user.getId()));
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
            article.setWriteDate(dateFormat.format(now));
            articleService.inserContent(article);
            model.addAttribute("article_content",content1);
            return "article/view";
        }
        return "/index";
    }

    @RequestMapping(value = "getContent",produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String  getContent(){
        return "# 其实当你老了 我发誓不会坠落\n" +
                "> 驱蚊器却缺乏\n" +
                "\n" +
                "我的世界开始下雪了\n" +
                "![](/static/img/article/20170718150902_rNsZS.gif)\n" +
                "\n" +
                "|  1 | 2  |\n" +
                "| ------------ | ------------ |\n" +
                "|  3 |  1 |\n" +
                "|  1 | 2  |\n" +
                "我唱着妈妈唱着的歌谣\n" +
                "### 其实还好\n" +
                "\n" +
                "~~权威渠道~~\n" +
                "- 1213\n" +
                "- 21211\n" +
                "\n" +
                "1. 22访问完成v就会被\n" +
                "2. 七年前后举报\n" +
                "3. 潜伏期你看\n" +
                "\n" +
                "拉拉拉拉\n" +
                "\n" +
                "------------\n" +
                "    \n" +
                "        @RequestMapping(value =\"/saveContent\", method = RequestMethod.POST)\n" +
                "        public String saveContent(Model model, HttpServletRequest request, User user,\n" +
                "                           @RequestParam(value = \"title\", required = false) String title,\n" +
                "                           @RequestParam(value = \"content\", required = false) String content1) {\n" +
                "            user = (User) request.getSession().getAttribute(\"user\");\n" +
                "            if(user !=null){\n" +
                "                System.out.println(user.getId());\n" +
                "                System.out.println(title);\n" +
                "                System.out.println(content1);\n" +
                "                Article article = new Article();\n" +
                "                article.setTitle(title);\n" +
                "                article.setContent(content1);\n" +
                "                article.setUserId(Long.parseLong(user.getId()));\n" +
                "                Date now = new Date();\n" +
                "                SimpleDateFormat dateFormat = new SimpleDateFormat(\"yyyy/MM/dd HH:mm:ss\");//可以方便地修改日期格式\n" +
                "                article.setWriteDate(dateFormat.format(now));\n" +
                "                articleService.inserContent(article);\n" +
                "                model.addAttribute(\"article_content\",content1);\n" +
                "                return \"article/view\";\n" +
                "            }\n" +
                "            return \"/index\";\n" +
                "        }\n" +
                "结束了";
    }

//    @RequestMapping("/uploadImage")
//    public @ResponseBody
//    Map<String, Object> Image(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "editormd-image-file", required = false) MultipartFile file) {
//        Map<String, Object> resultMap = new HashMap<String, Object>();
//        try {
//            request.setCharacterEncoding("utf-8");
//            response.setHeader("Content-Type", "text/html");
//            String rootPath = request.getSession().getServletContext().getRealPath("/static/image/articleupload/");
//            //文件路径不存在则需要创建文件路径
//            File filePath = new File(rootPath);
//            if (!filePath.exists()) {
//                filePath.mkdirs();
//            }
//            //最终文件名
//            File realFile = new File(rootPath + File.separator + file.getOriginalFilename());
//            FileUtils.copyInputStreamToFile(file.getInputStream(), realFile);
//            resultMap.put("success", 1);
//            resultMap.put("message", "上传成功");
//            resultMap.put("url", realFile);
//        } catch (Exception e) {
//            try {
//                response.getWriter().write("{\"success\":0}");
//            } catch (IOException e1) {
//                e1.printStackTrace();
//            }
//        }
//        return resultMap;
//    }
//
//    @RequestMapping(value = "/getImage", method = RequestMethod.POST)
//    @ResponseBody
//    public ModelMap getImage(String urls) {
//        ModelMap map = new ModelMap();
//        map.put("resImg", getImgFileToBase64(urls));
//        return map;
//    }

    public static String getImgFileToBase64(String imgFile) {
        //将图片文件转化为字节数组字符串，并对其进行Base64编码处理
        InputStream inputStream = null;
        byte[] buffer = null;
        //读取图片字节数组
        try {
            inputStream = new FileInputStream(imgFile);
            int count = 0;
            while (count == 0) {
                count = inputStream.available();
            }
            buffer = new byte[count];
            inputStream.read(buffer);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    // 关闭inputStream流
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        // 对字节数组Base64编码
        return new BASE64Encoder().encode(buffer);
    }

//    public static String GetImageStr(File file) {
//        InputStream in = null;
//        byte[] data = null;
//        // 读取图片字节数组
//        try {
//            in = new FileInputStream(file);
//            data = new byte[in.available()];
//            in.read(data);
//            in.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        // 对字节数组Base64编码
//        BASE64Encoder encoder = new BASE64Encoder();
//        return encoder.encode(data);// 返回Base64编码过的字节数组字符串
//    }


}
