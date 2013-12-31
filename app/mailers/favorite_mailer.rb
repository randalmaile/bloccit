class FavoriteMailer < ActionMailer::Base
  default from: "rmaile2000@yahoo.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    #new headers
    headers["Message-ID"] = "<comments/#{@comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{@post.id}@your-app-name.example>"
    headers["References"] = "<post/#{@post.id}@your-app-name.example>"

    mail(to: user.email, subject: "New comment on #{@post.title}")
  end

end
