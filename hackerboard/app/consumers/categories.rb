loop do
  Category.to_be_removed.find_each do |category|
    Rails.logger.info "removing category: #{category.name}"
    category.destroy
  end

  sleep 10
end