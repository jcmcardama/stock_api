IEX::Api.configure do |config|
    config.publishable_token = 'pk_ec5820e19aee4a9db470d817141e4061' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_4fdc2a7ae741464b8d89d52c4c2eca57' # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end