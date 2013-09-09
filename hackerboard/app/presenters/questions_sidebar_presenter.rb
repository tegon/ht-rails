class QuestionsSidebarPresenter
  def users
    @users ||= User.signup
  end

  def categories
    @categories ||= Category.sorted_by_name
  end
end