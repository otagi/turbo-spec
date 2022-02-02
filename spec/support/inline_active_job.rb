# Force immediate execution of jobs by adding the `active_job: :inline` tag to an example.

RSpec.configure do |config|
  config.around(:each) do |example|
    if example.metadata[:active_job]
      original_queue_adapter = ActiveJob::Base.queue_adapter
      descendants = ActiveJob::Base.descendants + [ActiveJob::Base]

      ActiveJob::Base.queue_adapter = example.metadata[:active_job]
      descendants.each(&:disable_test_adapter)
    end

    example.run

    if example.metadata[:active_job]
      descendants.each { |a| a.enable_test_adapter(ActiveJob::QueueAdapters::TestAdapter.new) }
      ActiveJob::Base.queue_adapter = original_queue_adapter
    end
  end
end
