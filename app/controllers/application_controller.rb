class ApplicationController < ActionController::Base
  def append_info_to_payload(payload)
    super
    payload[:ip] = request.remote_ip
    payload[:ua] = request.user_agent
    # payload[:user_id] = current_user.try(:id) TODO: current_user の id を入れる
    payload[:params] = request.filtered_parameters
    payload[:exception] = @error_for_payload
  end
end
