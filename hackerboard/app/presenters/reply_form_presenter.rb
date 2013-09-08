class ReplyFormPresenter
  def initialize(current_user, question, reply)
    @current_user = current_user
    @question = question
    @reply = reply
  end

  def partial
    if @current_user
      {
        partial: "replies/form", 
        locals: { question: @question, reply: @reply }
      }
    else
      { partial: "replies/require_login" }
    end
  end
end