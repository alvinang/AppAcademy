module CommentsHelper  
  
  def comment_partial(comment, comments_by_parent)
    render partial: "comments/comment",
      locals: { comment: comment, 
          comments_by_parent: comment_by_parent 
        }
  end  
end