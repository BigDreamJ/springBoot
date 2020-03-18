package com.j.blog.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
@EnableWebMvc
@Slf4j
public class WebConfig extends WebMvcConfigurerAdapter {

    @Value("${file.picPath}")
    private String picPath;

    @Value("${file.musicPath}")
    private String musicPath;

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        super.addInterceptors(registry);
        registry.addInterceptor(getInterfaceAuthCheckInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/rest/login.do/info")
                .excludePathPatterns("/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html/**");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String os = System.getProperty("os.name");
        log.info(os);
        if (os.toLowerCase().startsWith("win")) {  //如果是Windows系统

            registry.addResourceHandler("/pic/**")
                    // /apple/**表示在磁盘apple目录下的所有资源会被解析为以下的路径
                    .addResourceLocations("file:" + picPath);//媒体资源
            registry.addResourceHandler("swagger-ui.html")
                    .addResourceLocations("classpath:/META-INF/resources/");//swagger2页面
            registry.addResourceHandler("/music/**")
                    // /apple/**表示在磁盘apple目录下的所有资源会被解析为以下的路径
                    .addResourceLocations("file:" + musicPath); //媒体资源
        } else {  //linux 和mac
            registry.addResourceHandler("/smallapple/**")
                    .addResourceLocations("file:/resources/smallapple/")   //媒体资源
                    .addResourceLocations("classpath:/META-INF/resources/");  //swagger2页面;
        }
//        registry.addResourceHandler("/image/**").addResourceLocations("file:F:/*");
    }

    @Bean
    public TestInterceptor getInterfaceAuthCheckInterceptor() {
        return new TestInterceptor();
    }
}
