require 'spec_helper'

describe QuestionFilter do
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  let(:question) { 
    FactoryGirl.create(:question, user: user, category: category) 
  }

  let!(:reply) { 
    question.replies.create!(body: 'My reply', user: user)
  }

  let!(:another_question) { 
    FactoryGirl.create(:question, user: user, category: category) 
  }

  context 'when filtering by unanswered' do
    subject { QuestionFilter.filter(QuestionFilter::UNANSWERED).all }

    it { should have(1).item }

    it 'returns correct records' do
      subject.first.should eql(another_question)
    end
  end

  context 'when no filter is provided' do
    subject { QuestionFilter.filter(nil).all }

    it { should have(2).items }
  end
end