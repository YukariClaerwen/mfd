app.controller(
    "PostCtrl", ["$scope", "PostServ", "UserServ", "$location", "$routeParams", 
    function($scope, PostServ, UserServ, $location, $routeParams){

        $scope.posts = [];
        PostServ.get().then(function(response){
            $scope.posts = response.data;
        })
        $scope.postbg = function(bg) {
            return bg;
        }

        $scope.users = [];
        UserServ.get().then(function(response){
            $scope.users = response.data;
        })

    }
])
app.controller(
    "UserCtrl", ["$scope", "UserServ", "$routeParams", "$location",
    function($scope, UserServ, $routeParams, $location){
        $scope.user = {};
        $scope.cover = null;
        UserServ.getuser($routeParams.user).then(function(response){
            $scope.user = response.data[0];
            $scope.cover = $scope.user.cover;
        })
        $scope.follow = {};
        UserServ.getfollow($routeParams.user).then(function(response){
            $scope.follow = response.data[0];
        })

        $scope.isActive = function(route) {
            return route === $location.path();
        }
        
    }
])