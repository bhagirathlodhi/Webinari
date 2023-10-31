# Stripe.api_key = "sk_test_51O5jSDFIVNZxURShT8bhx1xEeRO4LPBVKuQuhCdDAj8sQ8rmbTCPS4VWOMJKDRhiqgu4fIo6vKe839bgrZWAAGgP00M79m6Zla"

Rails.configuration.stripe = { 
  :publishable_key => "pk_test_51O5jSDFIVNZxURShf7TRavOiMxtJRIl8b4h0p5DSzOAH8QZEocBNlf92PYmHloU0bhQcA4gpF9ouQMa2mqiXSVf000ywBDrPYY",
  :secret_key => "sk_test_51O5jSDFIVNZxURShT8bhx1xEeRO4LPBVKuQuhCdDAj8sQ8rmbTCPS4VWOMJKDRhiqgu4fIo6vKe839bgrZWAAGgP00M79m6Zla"
} 
Stripe.api_key = Rails.configuration.stripe[:secret_key]