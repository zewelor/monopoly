class Monopoly::Api < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  before do
    f = ActionDispatch::Http::ParameterFilter.new(Rails.application.config.filter_parameters)
    Rails.logger.info "  Parameters: #{f.filter(params.to_hash.except('route_info'))}"
  end

  mount Monopoly::Api::Lobby
  mount Monopoly::Api::Game
end
