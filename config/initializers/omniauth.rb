Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :facebook, '358226114213486', '11d5e17554a8721aa54e9f5dbd7054d3'
  else
    provider :facebook, '329271283804794', '912d808563fe2f048c768b85053148b6'
  end
end