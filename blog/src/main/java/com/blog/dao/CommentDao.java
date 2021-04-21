package com.blog.dao;

import com.blog.pojo.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CommentDao {

    //根据创建时间倒序来排
    List<Comment> findByBlogIdAndParentCommentNull(@Param("blogId") Long blogId, @Param("commentParentId") Long commentParentId);

    //根据创建时间倒序来排
    List<Comment> findAllReply(@Param("blogId") Long blogId,@Param("commentParentId") Long commentParentId);

    //查询父级对象
    Comment findByParentCommentId(@Param("parentCommentId")Long parentcommentid);

    //添加一个评论
    int saveComment(Comment comment);

    //修改父评论有子评论flag
    int updateParentChild(Comment comment);
}
