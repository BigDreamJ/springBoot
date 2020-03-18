package com.j.blog.entity;

import com.j.blog.common.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@ApiModel(value = "文件表")
public class File extends BaseEntity {
    private String originName;
    private String newName;
    private String suffix;
    private String location;
}
