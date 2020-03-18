package com.j.blog.utils;

import com.alibaba.fastjson.JSON;
import com.j.blog.entity.YQInfo;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import redis.clients.jedis.Jedis;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import java.util.ArrayList;
import java.util.List;


public class WebMagic implements PageProcessor {
    private Site site = Site.me().setRetryTimes(3).setSleepTime(1000).setTimeOut(3000)
            .setUserAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36");


    public void process(Page page) {
        System.setProperty("webdriver.chrome.driver", "D:/chromedriver/chromedriver_win32/chromedriver.exe");

        ChromeOptions  options = new ChromeOptions();
        options.addArguments("--headless");
        WebDriver driver = new ChromeDriver(options);

        driver.get("https://voice.baidu.com/act/newpneumonia/newpneumonia");
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Document document = Jsoup.parse(driver.getPageSource());
//        System.out.println(document);
        Element element = document.select("table.VirusTable_1-1-204_38pQEh").first();
        Elements elements = element.select("tr");
//        System.out.println(elements);
        List<YQInfo>  list = new ArrayList<>();
        elements.remove(0);
        for(Element element1 : elements){
            YQInfo yqInfo = new YQInfo();
            if(element1.select("span").size() == 2){
//                System.out.println(element1.select("td.VirusTable_1-1-199_EjGi8c"));
//                System.out.println("=======================");
            yqInfo.setName(element1.select("span").get(1).text());

            yqInfo.setSw(element1.select("td.VirusTable_1-1-204_EjGi8c").get(1).text());
            yqInfo.setTotle(element1.select("td.VirusTable_1-1-204_3x1sDV").get(1).text());
            yqInfo.setXz(element1.select("td.VirusTable_1-1-204_3x1sDV").get(0).text());
            yqInfo.setZy(element1.select("td.VirusTable_1-1-204_EjGi8c").get(0).text());
                list.add(yqInfo);
            }
        }
//        System.out.println(list);
        driver.close();
        kill_chromedriver();
        saveRedis(list);

    }

    public void kill_chromedriver(){
        Runtime runtime=Runtime.getRuntime();
        try{
            System.out.println("kill chromedriver.exe");
            runtime.exec("taskkill /f /im chromedriver.exe");
        }catch(Exception e){
            System.out.println("Error!");
        }
    }

    public Site getSite() {
        return site;
    }

    public void saveRedis(List<YQInfo> yqInfos) {
        //连接本地的 Redis 服务
        Jedis jedis = new Jedis("localhost");
        System.out.println("连接成功");
        //查看服务是否运行
//        System.out.println("服务正在运行: "+jedis.ping());
        String json = JSON.toJSONString(yqInfos);
        jedis.set("yqinfos", json);
        System.out.println("redis 存储的字符串为: "+ jedis.get("yqinfos"));
    }

    public void yqinfo() {
        Spider.create(new WebMagic())
                .addUrl("https://voice.baidu.com/act/newpneumonia/newpneumonia")
                .thread(5)
                .run();
    }

    public static void main(String[] args) {
        Spider.create(new WebMagic())
                .addUrl("https://voice.baidu.com/act/newpneumonia/newpneumonia")
                .thread(5)
                .run();
    }
}
