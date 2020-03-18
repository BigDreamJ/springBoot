package com.j.blog.config;

import jdk.nashorn.internal.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import springfox.documentation.spring.web.json.Json;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class TestInterceptor implements HandlerInterceptor {
    private static final Logger LOGGE = LoggerFactory.getLogger(TestInterceptor.class);

    //实现前置方法
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String uri = request.getRequestURI();
//        request.setAttribute("key", "iaosdioasndiouwdn");
//        System.out.println("============================");
//        LOGGE.info(request.getHeader("Host") );
//        LOGGE.info("UserAgent: {}", request.getHeader("loginToken"));
//        LOGGE.info("用户访问地址: {}, 来路地址: {}", uri, IPKit.getIpAddrByRequest(request));

        if("GET".equals(request.getMethod())){
            LOGGE.info(request.getMethod() );
        }


        //拦截器处理用户权限
//        if (uri.startsWith("/admin") && !uri.startsWith("/admin/login")) {
//            response.sendRedirect(request.getContextPath() + "/admin/login");
//            return false;
//        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //这个方法可以往request中添加一些公共的工具类给前端页面进行调用
//        httpServletRequest.setAttribute("key", "iaosdioasndiouwdn");

    }



    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //当请求处理完成调用
//        LOGGE.info(String.valueOf(httpServletRequest.getAttribute("key")) );
//        LOGGE.info(String.valueOf(httpServletResponse.getStatus()) );
    }
}
