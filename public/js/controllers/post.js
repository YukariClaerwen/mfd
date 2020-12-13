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

        $scope.user = {};
        UserServ.getuser($routeParams.user).then(function(response){
            $scope.user = response.data[0];
        })

    }
])