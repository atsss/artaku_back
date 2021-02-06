Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.keep_original_rails_log = true
  path = Rails.root.join('log', "lograge_#{Rails.env}.log")
  config.lograge.logger = ActiveSupport::Logger.new(path, 100, 100.megabytes)
  config.lograge.formatter = Lograge::Formatters::Logstash.new

  config.lograge.custom_options = ->(event) do
    current_datetime = Time.current

    data = {
      level: 'info',
      severity: 'INFO',
      date: current_datetime.to_date,
      hour: current_datetime.hour,
      min: current_datetime.min,
      sec: current_datetime.sec,
      day: current_datetime.day,
      ip: event.payload[:ip],
      user_agent: event.payload[:ua],
      params: event.payload[:params].to_json
    }
    if event.payload[:exception]
      message = event.payload[:exception].try(:message)
      backtrace = event.payload[:exception].try(:backtrace)

      data[:level] = 'fatal'
      data[:severity] = 'ERROR'
      data[:exception] = message
      data[:exception_backtrace] = backtrace[0..6] if backtrace.present?
    end
    data
  end
end
