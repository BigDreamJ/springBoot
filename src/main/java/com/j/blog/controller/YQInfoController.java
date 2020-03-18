package com.j.blog.controller;

import com.alibaba.fastjson.JSON;
import com.j.blog.entity.YQInfo;
import com.j.blog.utils.WebMagic;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.Jedis;
import us.codecraft.webmagic.Spider;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Api(tags = "1.4", value = "疫情查询接口", description = "这是一个文件接口")
@RestController
@RequestMapping("/yqinfo")
public class YQInfoController {

    @GetMapping("/get")
    public List<YQInfo> getAll(){
        try{
            WebMagic webMagic = new WebMagic();
            webMagic.yqinfo();
        }catch (Exception e){
            getAll();
        }
        Jedis jedis = new Jedis("localhost");
//        List<String> yqInfos = Arrays.asList(jedis.get("yqinfos"));
        List<YQInfo> yqInfos = JSON.parseArray(jedis.get("yqinfos"), YQInfo.class);
        return yqInfos;
    }
}
