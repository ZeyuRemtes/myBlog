package com.blog.service.impl;

import com.blog.dao.BlogDao;
import com.blog.dao.CommentDao;
import com.blog.pojo.Comment;
import com.blog.service.CommentService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Autowired
    private BlogDao blogDao;

    @Override
    public List<Comment> getCommentByBlogId(Long blogId) {  //查询当前博客下的所有父评论
        //没有父节点的默认为-1
        List<Comment> comments = commentDao.findByBlogIdAndParentCommentNull(blogId, Long.parseLong("-1"));
        return comments;
    }

    @Override
    public List<Comment> getAllReply(Long blogId) {  //查询当前博客下的所有回复评论
        //没有父节点的默认为-1
        List<Comment> replys = commentDao.findAllReply(blogId, Long.parseLong("-1"));
        return replys;
    }

    @Override
    //接收回复的表单
    public int saveComment(Comment comment) {
        //获得父id
        Long parentCommentId = comment.getParentComment().getId();
        //没有父级评论默认是-1
        if (parentCommentId != -1) {
            //有父级评论
            comment.setParentCommentId(parentCommentId);
            comment.setParentComment(commentDao.findByParentCommentId(comment.getParentCommentId()));
        } else {
            //没有父级评论
            comment.setParentCommentId((long) -1);
            comment.setParentComment(null);
        }
        comment.setCreateTime(new Date());
        comment.setChildcomment(false);
        return commentDao.saveComment(comment);
    }

    @Override
    public int updateParentCommentChildFlag(Comment parentComment) {
        parentComment.setChildcomment(true);
        return  commentDao.updateParentChild(parentComment);
    }

}
