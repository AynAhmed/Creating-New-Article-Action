#configure our stripe api here.

Stripe.api_key = ENV['STRIPE_SECRET_KEY']
STRIPE_PUBLIC_KEY = ENV['STRIPE_PUBLIC_KEY']

#setting var to our api key and hidding it 