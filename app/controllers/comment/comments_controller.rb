class Comment::CommentsController < CommentController

  @commentor_user = {}

  def index
    comments = resource.comments.order(created_at: :desc).page(params[:page])

    render json: comments, adapter: :json, meta: meta_attributes(comments), root: 'comment', each_serializer: CommentSerializer
  end

  def create
    comment = Comment.new(comment_params)
    comment.author = @commentor_user #TODO: replace with auth user
    comment.resource = resource

    raise Errors::CustomError.new(:bad_request, 400, comment.errors.messages) unless comment.save

    render json: comment, adapter: :json, serializer: CommentSerializer
  end

  private

  # It will return the comment's resource instance with id of :resource_id
  def resource
    resource_type = request.path_parameters[:resource_type]
    resource_id = request.path_parameters[:resource_id]

    resource_type.singularize.capitalize.constantize.find(resource_id)
  end

  def comment_params
    @comment_params ||= params.require(:comment).permit(:body)
  end
end
