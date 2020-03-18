package com.j.blog.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.j.blog.entity.Blog;
import com.j.blog.entity.Test;
import com.j.blog.mapper.BlogMapper;
import com.j.blog.mapper.TestMapper;
import com.j.blog.service.IBlogService;
import com.j.blog.service.ITestService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 测试表 服务实现类
 * </p>
 *
 * @author BigJ
 * @since 2019-07-02
 */
@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements IBlogService {

}
