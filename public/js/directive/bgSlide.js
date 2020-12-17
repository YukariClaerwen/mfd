angular.module('app.bgSlide', []).directive('ngBgSlideshow', function($interval) {
      return {
        restrict: 'A',
        scope: {
          ngBgSlideshow: '&',
          interval: '=',
        },
        templateUrl: '/views/includes/slideshow.html',
        link: function(scope, elem, attrs){
          scope.$watch('ngBgSlideshow', function(val){
            scope.images = val();
            scope.active_image = 0;
          });
          var change = $interval(function(){
            scope.active_image++;
            if(scope.active_image >= scope.images.length)
              scope.active_image = 0;
          }, scope.interval || 7000);

          scope.$on('$destroy', function(){
            $interval.cancel(change);
          })
        }
      };
});