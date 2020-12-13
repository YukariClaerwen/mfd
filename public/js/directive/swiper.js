angular.module('app.swiper', []).directive('swiper', function() {
    function link(scope, element, attrs) {              
        $(document).ready(function () {
            //initialize swiper when document ready
            var swiper = new Swiper('.swiper-container', {
                slidesPerView: 'auto',
                spaceBetween: 5,
                centeredSlides: false,
                pagination: {
                  el: '.swiper-pagination',
                  clickable: true
                },
                scrollbar: {
                    el: '.swiper-scrollbar',
                    hide: true
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                    hide: true
                },
                breakpoints: {
                  640: {
                    slidesPerView: 'auto',
                    spaceBetween: 20,
                    centeredSlides: true,
                  }
                }
              });
          });                                 
    };
      
    return {        
        link: link        
    };
  });