package com.j.blog.service;

import com.baomidou.mybatisplus.service.IService;
import com.j.blog.entity.Blog;
import com.j.blog.entity.File;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * <p>
 * 测试表 服务类
 * </p>
 *
 * @author BigJ
 * @since 2019-07-02
 */
public interface IFileService extends IService<File> {
    List<File> fileUpLoad(MultipartFile[] file) throws IOException;
    File fileUpLoad(MultipartFile file) throws IOException;

}
