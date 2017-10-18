package com.belling.admin.controller.test;

import com.belling.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}
