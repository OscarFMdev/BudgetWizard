// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('click', function() {
  // Get the menu button and the menu
  let menuBtn = document.querySelector('.menu-btn');
  let menu = document.querySelector('.menu');
  let body = document.querySelector('body');

  // Toggle the active class on the menu
  menuBtn.addEventListener('click', function() {
    menu.classList.add('active');
  });

  if (menu.classList.contains('active')) {
    menuBtn.addEventListener('click', function() {
      menu.classList.remove('active');
    });
  }
});

// Trigger the hidden input[type="file"] when the separate "Choose file" button is clicked
document.querySelector('.file-input-wrapper').addEventListener('click', function() {
  document.querySelector('#user_avatar').click();
});