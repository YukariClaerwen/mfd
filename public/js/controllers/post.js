app.controller(
    "PostCtrl", ["$scope", "PostServ", "UserServ", "HashtagServ", "$location", "$routeParams", 
    function($scope, PostServ, UserServ,HashtagServ, $location, $routeParams){
        console.log("path" + $location.path());
        console.log("url" + $location.url());
        console.log("search" + $location.search());   
        $scope.path=$location.path().split('/');
        console.log($scope.path);
        $scope.posts = [];
        $scope.post = {};
        $scope.key= "";
        if($location.path() == "/"){
            PostServ.get().then(function(response){
                $scope.posts = response.data;
            })
        }
        else if($scope.path[2] == "hashtag"){
            PostServ.getpostbyHashtag($routeParams.hashtag).then(function(response){
                $scope.posts= response.data;
                console.log($scope.posts);
            })
        }
        else if($scope.path[2] == "location"){
            PostServ.getpostbyHashtag($routeParams.location).then(function(response){
                $scope.posts= response.data;
                console.log($scope.posts);
            })
        }
        else{
            $scope.searchKey = function(){
            console.log($scope.key);
            /*PostServ.getpostbyKey($scope.key).then(function(response){
                $scope.posts = response.data;
            })*/
            alert($scope.key);
        }
        }
        
        /*if($routeParams.hashtag === undefined || $routeParams.hashtag === null) {
            PostServ.get().then(function(response){
                $scope.posts = response.data;
            })
        }
        else {
            PostServ.getpostbyHashtag($routeParams.hashtag).then(function(response){
                $scope.posts= response.data;
                console.log($scope.posts);
            })
        }*/
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