ThinkingSphinx::Index.define :question, :with => :active_record, :delta => true do
  indexes title
  indexes body
end