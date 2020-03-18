package com.j.blog.controller;

import com.j.blog.entity.Test;
import com.j.blog.service.ITestService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Api(tags = "1.0", value = "测试接口", description = "这是一个测试接口")
@RestController
@RequestMapping("/test")
public class TestController {
    @Autowired
    private ITestService testService;

    @PostMapping("/test")
    public ResponseEntity<Test> inset(){
        Test test = new Test();
        test.setName("测试");
        testService.insert(test);
        return new ResponseEntity<Test>(test, HttpStatus.OK);
    }

    @PostMapping("/testGetById")
    public ResponseEntity<Test> list(Integer id){
        Test test = testService.selectById(id);
        return new ResponseEntity<Test>(test, HttpStatus.OK);
    }
}
