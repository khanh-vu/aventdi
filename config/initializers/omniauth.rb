# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '250382915451046', '24442b7aa32cb25be403b49b01919696'
end