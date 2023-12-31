﻿/*scroll*/
window.addEventListener("scroll", function () {
    var header = this.document.querySelector("header");
    header.classList.toggle("sticky", window.scrollY > 0);
})

/* open search */
const popSearch = document.querySelector(".popup-search"),
    searchIcon = document.querySelector("#searchIcon"),
    closeIcon = document.querySelector("#closePopup");

    searchIcon.addEventListener("click", () => {
        popSearch.classList.toggle("openSearch");
    });
    closeIcon.addEventListener("click", () => {
        popSearch.classList.remove("openSearch");
    })

/*mb menu collpase*/
const menu = document.querySelector(".menu");
const menuMain = menu.querySelector(".menu-main");
const goBack = menu.querySelector(".go-back");
const menuTrigger = document.querySelector(".mobile-menu-trigger");
const closeMenu = menu.querySelector(".mobile-menu-close");
let subMenu;
menuMain.addEventListener("click", (e) => {
    if (!menu.classList.contains("active")) {
        return;
    }
    if (e.target.closest(".menu-item-has-children")) {
        const hasChildren = e.target.closest(".menu-item-has-children");
        showSubMenu(hasChildren);
    }
});
goBack.addEventListener("click", () => {
    hideSubMenu();
})
menuTrigger.addEventListener("click", () => {
    toggleMenu();
})
closeMenu.addEventListener("click", () => {
    toggleMenu();
})
document.querySelector(".menu-overlay").addEventListener("click", () => {
    toggleMenu();
})
function toggleMenu() {
    menu.classList.toggle("active");
    document.querySelector(".menu-overlay").classList.toggle("active");
}
function showSubMenu(hasChildren) {
    subMenu = hasChildren.querySelector(".sub-menu");
    subMenu.classList.add("active");
    subMenu.style.animation = "slideLeft 0.5s ease forwards";
    const menuTitle = hasChildren.querySelector("i").parentNode.childNodes[0].textContent;
    menu.querySelector(".current-menu-title").innerHTML = menuTitle;
    menu.querySelector(".mobile-menu-head").classList.add("active");
}
function hideSubMenu() {
    subMenu.style.animation = "slideRight 0.5s ease forwards";
    setTimeout(() => {
        subMenu.classList.remove("active");
    }, 300);
    menu.querySelector(".current-menu-title").innerHTML = "";
    menu.querySelector(".mobile-menu-head").classList.remove("active");
}
window.onresize = function () {
    if (this.innerWidth > 991) {
        if (menu.classList.contains("active")) {
            toggleMenu();
        }

    }
};

/*sign in*/
const signin_btn = document.querySelector(".user-icon"),
    popup = document.querySelector(".popup"),
    popup_open = document.querySelector(".popup.open"),
    popup_inner = document.querySelector(".popup-inner"),
    closePopup = document.querySelector(".closePopup");

signin_btn.addEventListener("click", () => {
    popup.classList.toggle("open");
});
closePopup.addEventListener("click", () => {
    popup.classList.remove("open");
});
popup.addEventListener("click", () => {
    popup.classList.remove("open");
});

/*cart*/
//var cart_btn = document.querySelector(".cart-icon");
//var cart_sidebar = document.querySelector(".cart-sidebar");
//var closeCart = document.querySelector(".close-cart");

//cart_btn.onclick = function () {
//    cart_sidebar.style.right = "0";
//};
//closeCart.onclick = function () {
//    cart_sidebar.style.right = "-400px";
/*};*/


