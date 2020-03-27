package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
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
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
    //    用户登录页面的跳转
    @RequestMapping(value = "/write")
    public String write() {
        return "article/write";
    }


    @ResponseBody
    @RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
    public JSONObject hello(HttpServletRequest request, HttpServletResponse response,
                            @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach) {

        JSONObject jsonObject=new JSONObject();

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
            jsonObject.put("url",   "/static/img/article/"+attach.getOriginalFilename()   );
        } catch (Exception e) {
            jsonObject.put("success", 0);
        }
        return jsonObject;
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
