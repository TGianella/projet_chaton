// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

let dropprofil = document.querySelector("#user-menu-button")
let dropprofilmenu = document.querySelector(".dropp")


console.log(dropprofil)
console.log(dropprofilmenu)
dropprofilmenu.style.display = "none"
dropprofil.addEventListener("click", e => {
  if (dropprofilmenu.style.display === "none"){
    dropprofilmenu.style.display = "block"
  }
  else {
    dropprofilmenu.style.display = "none"
  }
})



let burgermenu = document.querySelector(".burger")
let dropburgermenu = document.querySelector(".tuto")
dropburgermenu.style.display ="none"
burgermenu.addEventListener("click", e =>{
  // dropburgermenu.classList.toggle("block")
  if (dropburgermenu.style.display ==="none"){
    dropburgermenu.style.display = "block"
  }
  else {
    dropburgermenu.style.display = "none"
  }
})
console.log(burgermenu)
console.log(dropburgermenu)

