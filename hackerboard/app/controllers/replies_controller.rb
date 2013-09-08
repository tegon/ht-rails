class RepliesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @reply = current_user.replies.new(reply_params)
    @reply.question = @question

    @reply.save
    redirect_to question_path(@question), notice: t('flash.replies.create.notice')
  end

  private

  def reply_params
    params.require(:reply).permit(:body, :question_id)
  end
end