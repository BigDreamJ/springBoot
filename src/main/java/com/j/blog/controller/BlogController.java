package com.j.blog.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.j.blog.entity.Blog;
import com.j.blog.entity.Test;
import com.j.blog.service.IBlogService;
import com.j.blog.service.ITestService;
import io.swagger.annotations.Api;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

@Api(tags = "1.1", value = "博客接口", description = "这是一个博客接口")
@RestController
@RequestMapping("/blog")
public class BlogController {
    @Autowired
    private IBlogService blogService;

    @PostMapping("/add")
    public ResponseEntity<Blog> add(@Param("blog") Blog blog){
        blogService.insert(blog);
        return new ResponseEntity<Blog>(blog, HttpStatus.OK);
    }

    @PostMapping("/update")
    public ResponseEntity<Blog> update(@Param("blog") Blog blog){
        blogService.updateById(blog);
        return new ResponseEntity<Blog>(blog, HttpStatus.OK);
    }

    @PostMapping("/delete")
    public ResponseEntity<Blog> delete(@Param("blog") Blog blog){
        blogService.deleteById(blog);
        return new ResponseEntity<Blog>(blog, HttpStatus.OK);
    }

    @GetMapping("/getById")
    public ResponseEntity<Blog> getById(@Param("id") Integer id){
        Blog blog = blogService.selectById(id);
        return new ResponseEntity<Blog>(blog, HttpStatus.OK);
    }

    @GetMapping("/getList")
    public ResponseEntity<List<Blog>> getList(){
        List<Blog> blogs = blogService.selectList(new EntityWrapper<Blog>().eq("del_flag", 0));
        return new ResponseEntity<List<Blog>>(blogs, HttpStatus.OK);
    }

    @GetMapping("/getPage")
    public ResponseEntity<Page<Blog>> getPage(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                                              @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize){
        Page<Blog> blogs = blogService.selectPage(new Page<Blog>(pageNum, pageSize), new EntityWrapper<Blog>().eq("del_flag", 0));
        return new ResponseEntity<Page<Blog>>(blogs, HttpStatus.OK);
    }
}
