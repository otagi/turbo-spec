RSpec.configure do |config|
  # Monkey-patch capybara/rspec/features.rb to also use the `feature` DSL keyword in system specs.
  config.alias_example_group_to :feature, :capybara_feature, type: :system
  config.alias_example_group_to :xfeature, :capybara_feature, type: :system, skip: 'Temporarily disabled with xfeature'
  config.alias_example_group_to :ffeature, :capybara_feature, :focus, type: :system

  # Use Puma when needed, e.g. when ActionCable is used.
  config.before(:each, puma: true) do
    Capybara.server = :puma
  end
end

Capybara.configure do |config|
  config.automatic_label_click = true
end
