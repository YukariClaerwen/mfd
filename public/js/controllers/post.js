app.controller(
    "PostCtrl", ["$scope", "PostServ", "UserServ", "$location", "$routeParams", 
    function($scope, PostServ, UserServ, $location, $routeParams){

        $scope.posts = [];
        PostServ.get().then(function(response){
            $scope.posts = response.data;
        })
        $scope.post = {};
        PostServ.getpost($routeParams.id).then(function(response){
            $scope.post = response.data[0];
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
    "PostbyCtrl", ["$scope", "PostServ", "UserServ", "$location", "$routeParams", 
    function($scope, PostServ, UserServ, $location, $routeParams){

        $scope.posts = [];
        PostServ.getpostbyHashtag($routeParams.hashtag).then(function(response){
            $scope.posts= response.data;
        })
        $scope.users = [];
        UserServ.get().then(function(response){
            $scope.users = response.data;
        })

    }
])
// nhớ hỏi
app.controller(
    "UserCtrl", ["$scope", "UserServ", "$routeParams", "$location",
    function($scope, UserServ, $routeParams, $location){
        $scope.user = {};
        $scope.cover = null;
        UserServ.getuser($routeParams.user).then(function(response){
            $scope.user = response.data[0];
            $scope.cover = $scope.user.cover;
        })

        $scope.isActive = function(route) {
            return route === $location.path();
        }
        $scope.following = [];
        $scope.followers = [];
        UserServ.getfollowing($routeParams.user).then(function(response){
            $scope.following = response.data;
        })
        UserServ.getfollowers($routeParams.user).then(function(response){
            $scope.followers = response.data;
        })

        
    }
])