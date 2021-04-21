package com.blog.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 把博客和标签关系存到数据库中使用的类
 */

@Data
@NoArgsConstructor
public class BlogAndTag {

    public BlogAndTag(Long tagId, Long blogId) {
        this.tagId = tagId;
        this.blogId = blogId;
    }

    private Long tagId;
    private Long blogId;

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public Long getBlogId() {
        return blogId;
    }

    public void setBlogId(Long blogId) {
        this.blogId = blogId;
    }

}
