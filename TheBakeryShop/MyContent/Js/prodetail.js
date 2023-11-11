var productImg = document.getElementById("productImg"),
    smallImg =document.getElementsByClassName("img-small");

smallImg[0].onclick = function(){
  productImg.src = smallImg[0].src;
}
smallImg[1].onclick = function(){
  productImg.src = smallImg[1].src;
}
smallImg[2].onclick = function(){
  productImg.src = smallImg[2].src;
}