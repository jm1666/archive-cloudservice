class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @post.comments
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1
  def show
    @username = username(@post.user_id)
  end

  # GET /comments/1/edit
  def edit
    if current_user.try(:admin?)
    else
      render nothing: true, status: :unauthorized
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @post.comments.create(comment_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@post, @comment], notice: 'Comment was successfully created.' }
        format.json { head :ok }
      else
        format.html { render :new }
        format.json { head :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if current_user.try(:admin?)
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to [@post, @comment], notice: 'Comment was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render :edit }
          format.json { head :unprocessable_entity }
        end
      end
    else
      render nothing: true, status: :unauthorized
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if current_user.try(:admin?)
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to post_comments_url, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      render nothing: true, status: :unauthorized
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end

  def username(user_id)
    User.find(user_id).email.split('@')[0]
  end

  helper_method :username

end
