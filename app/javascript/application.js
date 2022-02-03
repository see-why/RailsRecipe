// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function popupIngModal() {
  document.querySelector('.main-recipe-show-page').style.display = 'none';
  console.log('did that')
}

document.querySelector(".hehe").addEventListener('click', popupIngModal);