package com.j.blog.service.Impl;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.j.blog.entity.Blog;
import com.j.blog.entity.File;
import com.j.blog.mapper.BlogMapper;
import com.j.blog.mapper.FileMapper;
import com.j.blog.service.IBlogService;
import com.j.blog.service.IFileService;
import com.j.blog.utils.UUIDUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * <p>
 * 文件表 服务实现类
 * </p>
 *
 * @author BigJ
 * @since 2019-07-02
 */
@Slf4j
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, File> implements IFileService {
    @Value("${file.picPath}")
    private String rootPath;

    //多文件上传
    public List<File> fileUpLoad(MultipartFile[] file) throws IOException{
//        String fileName = file.getOriginalFilename(); //该文件名是带后缀的完整文件名
//        String[] strs = fileName.split("\\.");
//        String type = strs[strs.length-1];//有的文件名中有多个点，取最后一个点之后的字符串为后辍
//        long size = file.getSize();
//        // byte[] bytes = null;
//        InputStream is = null;
//        Calendar now = Calendar.getInstance();
//        String directoryRealPath = rootPath + now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH)+1) + "/";
//
//        String fileID = UUIDUtils.generateShortUuid();//新创建一个文件ID
//        try {
//            // bytes = file.getBytes();
//            is = file.getInputStream();
//            //创建文件存储目录，一个月一个目录
//
//            //创建文件路径
////            java.io.File storeDirectory = new java.io.File(directoryRealPath + java.io.File.separator + fileID + "." + type);
//            //使用apache commons-io包，将输入流转成文件
////            FileUtils.copyInputStreamToFile(is, storeDirectory);
//            BufferedInputStream in = FileUtil.getInputStream(directoryRealPath + java.io.File.separator + fileID + "." + type);
//            BufferedOutputStream out = FileUtil.getOutputStream("d:/test2.txt");
//            long copySize = IoUtil.copy(storeDirectory, out, IoUtil.DEFAULT_BUFFER_SIZE);
//            is.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        File fileObj = new File();
//        fileObj.setNewName(fileID);
//        fileObj.setOriginName(fileName);
//        fileObj.setNewName(fileName);
//        fileObj.setLocation(directoryRealPath);
//        fileObj.setSuffix(type);
//
//        if (this.insert(fileObj)) { //插入成功
//            return fileObj;
//        } else {
//            return null;
//        }
        String yyyyMMdd = rootPath + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + java.io.File.separator;
        if (!FileUtil.exist(yyyyMMdd)) {
            FileUtil.mkdir(yyyyMMdd);
        }
        List< Map<String, String>> pathList = new ArrayList<>();
        if (file.length > 0) {
            List<File> files = new ArrayList<>();
            for (MultipartFile multipartFile : file) {
                String originName =  multipartFile.getOriginalFilename();
                String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".") + 1);
                String fileName = UUID.randomUUID().toString() + "." + suffix;

                java.io.File file1 = FileUtil.writeBytes(multipartFile.getBytes(), yyyyMMdd + fileName);
                if (file1.length()>0){
                    File file2 = new File();
                    file2.setOriginName(originName);
                    file2.setNewName(fileName);
                    file2.setSuffix(suffix);
                    file2.setLocation(yyyyMMdd.replaceAll("\\\\","/"));
                    files.add(file2);
                }
            }
            if (this.insertBatch(files)) { //插入成功
                return files;
            } else {
                return null;
            }
        }else {
            return null;
        }
    }

    //单文件上传
    public File fileUpLoad(MultipartFile file) throws IOException{
        String yyyyMMdd = rootPath + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + java.io.File.separator;
        if (!FileUtil.exist(yyyyMMdd)) {
            FileUtil.mkdir(yyyyMMdd);
        }

        log.info(file.getName());
        String originName =  file.getOriginalFilename();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        String fileName = UUID.randomUUID().toString() + "." + suffix;
        java.io.File file1 = FileUtil.writeBytes(file.getBytes(), yyyyMMdd + fileName);
        if (file1.length()>0){
            File file2 = new File();
            file2.setOriginName(originName);
            file2.setNewName(fileName);
            file2.setSuffix(suffix);
            file2.setLocation(yyyyMMdd.replaceAll("\\\\","/"));
            if (this.insert(file2)) { //插入成功
                return file2;
            } else {
                return null;
            }
        }else {
            return null;
        }

    }

}
