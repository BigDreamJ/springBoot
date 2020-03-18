package com.j.blog.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.j.blog.entity.Blog;
import com.j.blog.entity.File;
import com.j.blog.service.IBlogService;
import com.j.blog.service.IFileService;
import io.swagger.annotations.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Api(tags = "1.3", value = "文件接口", description = "这是一个文件接口")
@RestController
@RequestMapping("/file")
public class FileController {
    @Autowired
    private IFileService fileService;

    @ApiOperation(value = "上传图片", httpMethod = "POST")
    @PostMapping(value = "/upload", consumes = "multipart/*", headers = "content-type=multipart/form-data")
    public File fileupload(@ApiParam(value = "上传图片文件", required = true) @RequestParam("file") MultipartFile file) throws IOException {
        File newFile = fileService.fileUpLoad(file);
        return newFile;
    }

}
