package com.blog.service;

import com.blog.pojo.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> getCommentByBlogId(Long blogId);

    List<Comment> getAllReply(Long blogId);

    int saveComment(Comment comment);

    int updateParentCommentChildFlag(Comment parentComment);
}
