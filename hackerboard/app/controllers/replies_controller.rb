class RepliesController < ApplicationController
  require_logged_user

  def create
    @question = Question.find(params[:question_id])
    @reply = current_user.replies.new(reply_params)
    @reply.question = @question

    if @reply.save
      flash[:notice] = t('flash.replies.create.notice')
    else
      flash[:alert] = t('flash.replies.create.alert')
    end

    redirect_to question_path(@question)
  end

  private

  def reply_params
    params.require(:reply).permit(:body, :question_id)
  end
end