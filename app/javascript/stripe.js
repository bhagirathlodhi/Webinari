var stripe = Stripe('pk_test_51O5jSDFIVNZxURShf7TRavOiMxtJRIl8b4h0p5DSzOAH8QZEocBNlf92PYmHloU0bhQcA4gpF9ouQMa2mqiXSVf000ywBDrPYY');
var elements = stripe.elements();

var card = elements.create('card');
card.mount('#card_number');

var form = document.getElementById('show.html.erb');

form.addEventListener('submit', function(event) {
  event.preventDefault();

  stripe.createToken(card).then(function(result) {
    if (result.error) {
      // Handle errors
    } else {
      // Token successfully created, send it to your server
      var token = result.token;
      // Send the token to your server
      fetch('/your_server_endpoint', {
        method: 'POST',
        body: JSON.stringify({ token: token.id }),
        headers: {
          'Content-Type': 'application/json'
        }
      });
    }
  });
});

