Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '104453516297820', 'c5d2f2a86e8444ca28cfffc3fdaa5a53'
  provider :twitter, 'xCjJBYddbZh3MSIN7N5UA', 'UyoFaiH6Z0jC9Gc1ViPtANf7oQqt3lbcAuAJfip6dJA'
end