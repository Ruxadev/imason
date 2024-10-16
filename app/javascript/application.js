import "@hotwired/turbo-rails"
Turbo.session.drive = false;

import "@rails/ujs"
import "./controllers"
import "bootstrap"

// Rails UJS setup
import Rails from "@rails/ujs"
Rails.start()

// Credit card input handling
document.addEventListener('DOMContentLoaded', function () {
    const cardNumberField = document.getElementById('card_number');
    const expiryDateField = document.getElementById('expiry_date');
    const cvcField = document.getElementById('cvc');
  
    // Card Number: Allow exactly 16 digits
    cardNumberField.addEventListener('input', function (e) {
      let input = e.target.value.replace(/\D/g, ''); // Remove non-digit characters
      if (input.length > 16) {
        input = input.slice(0, 16);  // Limit to exactly 16 digits
      }
      e.target.value = input;
    });
  
    // Expiry Date: Auto-format as MM/YY and validate after full entry
    expiryDateField.addEventListener('input', function (e) {
      let input = e.target.value.replace(/\D/g, '');  // Remove non-digit characters
      if (input.length >= 3) {
        input = input.slice(0, 2) + '/' + input.slice(2, 4);  // Insert "/"
      }
      e.target.value = input;
  
      if (input.length === 5) {  // Ensure that MM/YY is fully typed before validating
        const parts = input.split('/');
        const month = parts[0];
        const year = parts[1];
  
        // Validate month is between 01 and 12
        if (month > 12 || month === '00') {
          alert("Please enter a valid month (01-12).");
          e.target.value = '';  // Clear the input if invalid
        }
      }
    });
  
    // CVC: Ensure exactly 3 digits
    cvcField.addEventListener('input', function (e) {
      let input = e.target.value.replace(/\D/g, ''); // Remove non-digit characters
      if (input.length > 3) {
        input = input.slice(0, 3);  // Limit to exactly 3 digits
      }
      e.target.value = input;
    });
  });
