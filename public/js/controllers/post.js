app.controller(
    "PostCtrl", ["$scope", "PostServ", "UserServ", "HashtagServ", "$location", "$routeParams", 
    function($scope, PostServ, UserServ,HashtagServ, $location, $routeParams){
        // console.log("path" + $location.path());
        // console.log("url" + $location.url());
        // console.log("search" + $location.search());   
        $scope.path=$location.path().split('/');
        // console.log($scope.path);
        $scope.posts = [];
        $scope.post = {};
        $scope.key= "";
        $scope.hashtag = "";
        
        if($scope.path[2] == "hashtag"){
            $scope.hashtag = $routeParams.hashtag;
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
        // else if(Loa){
        //     $scope.searchKey = function(){
        //     console.log($scope.key);
        //     /*PostServ.getpostbyKey($scope.key).then(function(response){
        //         $scope.posts = response.data;
        //     })*/
        //     alert($scope.key);
        //     }
        // }
        else{
            PostServ.get().then(function(response){
                $scope.posts = response.data;
                // console.log($scope.posts);
            })
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
            console.log($scope.hashtags);
        })
        $scope.postbg = function(bg) {
            return bg;
        }
        $scope.users = [];
        UserServ.get().then(function(response){
            $scope.users = response.data;
        })

        $scope.isActive = function(route) {
            return route === $location.path();
        }
        
        /* Đưa từ khóa lên url */ 
    }
])
// nhớ hỏi
app.controller(
    "UserCtrl", ["$scope", "UserServ", "$routeParams", "$location", "checkAuth",
    function($scope, UserServ, $routeParams, $location,checkAuth){
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
        $scope.result =[];
        UserServ.getfollowing($routeParams.user).then(function(response){
            $scope.following = response.data;
            console.log($scope.following);
        })
        UserServ.getfollowers($routeParams.user).then(function(response){
            $scope.followers = response.data;
        });
        $scope.luuthongtin = function(){
            console.log($location.path());
            var infor ={
                    email: $scope.email,
                    gender: $scope.gender,
                    job: $scope.job,
                    birthday: $scope.birthday
                }    
            console.log(infor); 
            UserServ.change($routeParams.user,infor).then(function(response){
                
                $scope.result = response.data;
                console.log($scope.result);
            });
        }
        // $scope.check = checkAuth.getuserInfo();

        // console.log($routeParams);

        
    }
])