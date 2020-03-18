package com.j.blog.utils;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;

public class JSoup {
    public Document getHtmlTextByUrl(String url) throws IOException {
        WebClient webClient = new WebClient(BrowserVersion.CHROME);
        webClient.getOptions().setJavaScriptEnabled(true); //启用JS解释器，默认为true
        webClient.setAjaxController(new NicelyResynchronizingAjaxController());//设置支持AJAX
        webClient.getOptions().setCssEnabled(false); //禁用css支持
        webClient.getOptions().setThrowExceptionOnScriptError(false); //js运行错误时，是否抛出异常
        webClient.getOptions().setTimeout(20000);
        HtmlPage page = webClient.getPage(url);

        //我认为这个最重要

//        System.out.println(pageXml);
        webClient.waitForBackgroundJavaScript(10000);
        String pageXml = page.asXml();
        System.out.println(pageXml);
//        return page;
        Document document = Jsoup.parse(pageXml);
//        try {
//            int i = (int) (Math.random() * 1000);////做一个随机延时，防止网站屏蔽
//            while (i != 0) {
//                i--;
//            }
//            document = Jsoup.connect(url)
//                    .data("query", "Java")
//                    .userAgent("Mozilla")
//                    .cookie("auth", "token")
//                    .timeout(300000).post();
//        } catch (Exception e) {
//            e.printStackTrace();
//            try {
//                document = Jsoup.connect(url).timeout(5000000).get();
//            } catch (Exception e1) {
//                e1.printStackTrace();
//            }
//        }
        return document;
    }

    //根据元素属性获取某个元素内的elements列表
    public Elements getElementByClass(Document document, String className) {
        Elements elements = null;
        elements = document.select(className);
        return elements;
    }

//    public ArrayList getProvice(String url, String type) {
//        ArrayList result = new ArrayList();
//        String classtype = "." + type;
//        //从网络上获取网页
//        Document document = getHtmlTextByUrl(url);
//        if (document != null) {
//            Elements elements = getElementByClass(document, classtype);// tr的集合
//            for (Element e : elements) {// 依次循环每个元素，也就是一个tr
//                if (e != null) {
//                    for (Element ec : e.children()) {// 一个tr的子元素td，td内包含a标签
//                        String[] prv = new String[4];
//                        if (ec.children().first() != null) {
//                            prv[0] = url;// 原来的url
//                            prv[1] = ec.children().first().ownText();
//                            System.out.println(prv[1]);//身份名称
//
//                            String ownurl = ec.children().first().attr("abs:href");
//                            prv[2] = ownurl;
//                            System.out.println(prv[2]);
//
//                            prv[3] = type;
//                            result.add(prv);
//                        }
//                    }
//                }
//            }
//        }
//        return result;
//    }

//        public ArrayList getProvice(String url, String type) {
//        ArrayList result = new ArrayList();
//        String classtype = "." + type;
//        //从网络上获取网页
//        Document document = getHtmlTextByUrl(url);
////            System.out.println(document);
//        if (document != null) {
////            Elements elements = getElementByClass(document, classtype);// tr的集合
//            Elements elements = document.select("div.result-op");
//            System.out.println(elements);
////            for (Element e : elements) {// 依次循环每个元素，也就是一个tr
////                if (e != null) {
////                    for (Element ec : e.children()) {// 一个tr的子元素td，td内包含a标签
////                        String[] prv = new String[4];
////                        if (ec.children().first() != null) {
////                            prv[0] = url;// 原来的url
////                            prv[1] = ec.children().first().ownText();
////                            System.out.println(prv[1]);//身份名称
////
////                            String ownurl = ec.children().first().attr("abs:href");
////                            prv[2] = ownurl;
////                            System.out.println(prv[2]);
////
////                            prv[3] = type;
////                            result.add(prv);
////                        }
////                    }
////                }
////            }
//        }
//        return result;
//    }

    public static void main(String[] args) {
//        String url = "http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/index.html";
        String url = "https://voice.baidu.com/act/newpneumonia/newpneumonia";
        String type = "provincetr";
        try{
            System.out.println(new JSoup().getHtmlTextByUrl(url));
        }catch (IOException e){
            e.printStackTrace();
        }

//        System.out.println(new JSoup().getProvice(url, type));
    }
}
