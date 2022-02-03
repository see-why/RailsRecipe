// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function popupIngModal() {
  document.querySelector('.main-recipe-show-page').classList.add('blurred')
  document.querySelector(".fixed-modal-container").classList.remove('close')
}

function closeIngModal() {
  document.querySelector('.main-recipe-show-page').classList.remove('blurred')
  document.querySelector(".fixed-modal-container").classList.add('close')
}



document.querySelector(".hehe").addEventListener('click', popupIngModal);

document.querySelector(".closing-btn").addEventListener('click', closeIngModal);