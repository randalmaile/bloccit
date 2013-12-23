index -- list all

show -- show only 1

edit -- edit specific

new -- create new (form
)

create -- dcreate a new record in db

destroy



class Post


def show (route: post/3)

@post = Post.find(params[:id])

def new

@post = Post.new

def create
@post = Post.create(params[:post])
if @post.save

else



def edit
@post = Post.find(params[:id])

def update
@post = Post.update_attribute(params[:id])
if post.save

def destroy

