// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('click', function(event) {
  // Get the menu button and the menu
  let menuBtn = document.querySelector('.menu-btn');
  let menu = document.querySelector('.menu');
  let body = document.querySelector('body');

  // Toggle the active class on the menu
  menuBtn.addEventListener('click', function() {
    menu.classList.toggle('active');
  });

  // Close the menu if the clicked element is not part of the menu or the menu button
  if (!menu.contains(event.target) && !menuBtn.contains(event.target)) {
    menu.classList.remove('active');
  }
});



// Trigger the hidden input[type="file"] when the separate "Choose file" button is clicked
document.querySelector('.file-input-wrapper').addEventListener('click', function() {
  document.querySelector('#user_avatar').click();
});

const avatarInput = document.querySelector('#user_avatar');
const previewContainer = document.querySelector('.avatar-preview-container');
avatarInput.addEventListener('change', function() {
  const file = avatarInput.files[0];
  const url = URL.createObjectURL(file);
  const previewImg = document.createElement('img');
  previewImg.src = url;
  previewImg.classList.add('avatar');
  previewContainer.innerHTML = '';
  previewContainer.appendChild(previewImg);
});
