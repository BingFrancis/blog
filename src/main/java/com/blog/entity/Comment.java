package com.blog.entity;


import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;

public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    private  Long articleId;

    private  Long autherId;

    private Long commenteeId;

    private String commentContent;



    private Date commentDate;

    private  String children;

    private  Integer upvote;


    @Transient
    private User user;

    @Transient User byUser;

    @Transient
    private List<Comment> commentList;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Long getAutherId() {
        return autherId;
    }

    public void setAutherId(Long autherId) {
        this.autherId = autherId;
    }

    public Long getCommenteeid() {
        return commenteeId;
    }

    public void setCommenteeid(Long commenteeId) {
        this.commenteeId = commenteeId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentTime) {
        this.commentDate = commentTime;
    }

    public String getChildren() {
        return children;
    }

    public void setChildren(String children) {
        this.children = children == null ? null : children.trim();
    }

    public Integer getUpvote() {
        return upvote;
    }

    public void setUpvote(Integer upvote) {
        this.upvote = upvote;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getByUser() {
        return byUser;
    }

    public void setByUser(User byUser) {
        this.byUser = byUser;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }





}
