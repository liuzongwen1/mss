package com.belling.admin.controller.test;

import com.belling.base.controller.BaseController;
import com.belling.base.model.ResponseResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

@Controller
@RequestMapping("/test")
public class TestController extends BaseController {

    /**
     * 测试首页
     * @return 页面
     */
    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public String index(Model model) {
        return "/test/edit";
    }

    /**
     * 上传
     */
    @RequestMapping(value = "/upload")
    public @ResponseBody ResponseResult upload(HttpServletRequest request, MultipartFile file, String path) {
        String newFileName = "";
        try {
            if(file != null){
                String filePath = request.getSession().getServletContext().getRealPath("/")+ "static\\images\\user\\";
                String originalFilename = file.getOriginalFilename();
                newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
                System.out.println("filename: " + filePath + newFileName);
                File imgFile = new File(filePath + newFileName);
                file.transferTo(imgFile);
                // todo base64转码
//                String imgstr = ImageHelper.getImageStr(filePath + newFileName);
//                ImageHelper.generateImage(imgstr,request.getSession().getServletContext().getRealPath("/")+ "static\\images\\" + newFileName);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ResponseResult.createSuccessResult().setMessage("上传成功").setData("static\\images\\" + newFileName);
    }
}
