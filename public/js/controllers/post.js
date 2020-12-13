app.controller(
    "PostCtrl", ["$scope", "PostServ", "UserServ", "$location", 
    function($scope, PostServ, UserServ, $location){

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