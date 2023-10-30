
<script src="https://js.stripe.com/v3/"></script>

  const stripe = Stripe('pk_test_51O5jSDFIVNZxURShf7TRavOiMxtJRIl8b4h0p5DSzOAH8QZEocBNlf92PYmHloU0bhQcA4gpF9ouQMa2mqiXSVf000ywBDrPYY');
  stripe.createToken(cardElement).then(function(result) {
    if (result.error) {
      // Handle errors
    } else {
      // Send the result.token.id to your server
    }

