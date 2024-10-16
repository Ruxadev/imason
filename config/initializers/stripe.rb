begin
  require 'stripe'
rescue LoadError
  # Handle the case where Stripe is not available (e.g., in test environment)
end

Stripe.api_key = ENV['STRIPE_API_KEY'] if defined?(Stripe) && !defined?(Stripe.api_key)

unless defined?(STRIPE_JS_HOST)
  STRIPE_JS_HOST = 'https://js.stripe.com'
end