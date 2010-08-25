class PostsController < InheritedResources::Base
  def sort
      @posts = Post.all
      @posts.each do |post|
        post.position = params['post'].index(post.id.to_s) + 1
        post.save
      end
      render :nothing => true
  end
end
