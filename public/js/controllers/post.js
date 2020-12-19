app.controller(
    "PostCtrl", ["$scope", "PostServ", "UserServ", "HashtagServ", "$location", "$routeParams", 
    function($scope, PostServ, UserServ,HashtagServ, $location, $routeParams){
        console.log($routeParams.hashtag);
        $scope.posts = [];
        
        $scope.post = {};
        if($routeParams.hashtag === undefined || $routeParams.hashtag === null) {
            console.log("dsff");
            PostServ.get().then(function(response){
                $scope.posts = response.data;
            })
        }
        else {
            PostServ.getpostbyHashtag($routeParams.hashtag).then(function(response){
                $scope.posts= response.data;
                console.log($scope.posts);
            })
        }
        PostServ.getpost($routeParams.id).then(function(response){
            $scope.post = response.data[0];
        })
        $scope.hashtags = [];
        HashtagServ.gethashtag().then(function(response){
            $scope.hashtags= response.data;
        })
        $scope.postbg = function(bg) {
            return bg;
        }
        $scope.users = [];
        UserServ.get().then(function(response){
            $scope.users = response.data;
        })
        
        /* Đưa từ khóa lên url */ 
        /*$scope.key="";
        $scope.searchKey= function(){
            PostServ.getpostbyKey($scope.key).then(function(response){
                $scope.posts = response.data;
            })
        }*/
    }
])
app.controller(
    "PostbyCtrl", ["$scope", "PostServ", "UserServ","HashtagServ", "$location", "$routeParams", 
    function($scope, PostServ, UserServ, HashtagServ ,$location, $routeParams){

        $scope.posts = [];
        PostServ.getpostbyHashtag($routeParams.hashtag).then(function(response){
            $scope.posts= response.data;
        })
        /*PostServ.getpostbyKey($routeParams.key).then(function(response){
            $scope.posts = response.data;
        })*/
        /*PostServ.getpostbyLocation($routeParams.location).then(function(response){
            $scope.posts = response.data;
        })*/
        $scope.users = [];
        UserServ.get().then(function(response){
            $scope.users = response.data;
        })
        $scope.hashtags = [];
        HashtagServ.gethashtag().then(function(response){
            $scope.hashtags= response.data;
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