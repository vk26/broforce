Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '73f053e1becaf610dbb8', '9dbc685abd195e7e32d7b2514cf0e0cc0bfc4ad7', scope: 'user'
end
