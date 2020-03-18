package com.j.blog.entity;

import com.j.blog.common.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@ApiModel(value = "博客表")
public class Blog extends BaseEntity {
    private String title;
    private String content;
}
