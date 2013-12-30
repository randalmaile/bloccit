class FavoriteMailer < ActionMailer::Base
  default from: "rmaile2000@yahoo.com"

  def new_comment(user, post, comment)

    @user = user
    @post = post
    @comment = comment
    
    # New Headers
    headers["Message-ID"] = "<comments/#{@comment.id}@rmaile-bloccit.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@rmaile-bloccit.herokuapp.com>"
    headers["References"] = "<post/#{@comment.id}@rmaile-bloccit.herokuapp.com>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
