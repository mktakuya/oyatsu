RailsAdmin.config do |config|
  config.authorize_with do
    authenticate_or_request_with_http_basic('ログイン') do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.model User do
    include_fields_if do
      not name.match /_at$|^password.*|.*token$/
    end
  end
end
