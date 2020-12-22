app.controller(
    "PostCtrl", ["$scope", "PostServ", "UserServ", "HashtagServ", "$location", "$routeParams", "$rootScope", 
    function($scope, PostServ, UserServ,HashtagServ, $location, $routeParams, $rootScope){
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
            })
        }
        else if($scope.path[2] == "location"){
            PostServ.getpostbyHashtag($routeParams.location).then(function(response){
                $scope.posts= response.data;
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
        $scope.cmtList = [];
        $scope.countcmts = 0;

        // $scope.getcmtList;
        PostServ.getcmt($routeParams.id).then(function(resposne){
            $scope.cmtList = resposne.data;
            $scope.countcmts = $scope.cmtList.length;
        })
        $scope.submit_comment = function(){
            var message = {
                content : $scope.cmtForm.message,
                post_id : $scope.post.ID,
                username : $rootScope.userName
            };
            PostServ.addcmt(message).then(function(response){
                $scope.cmtList = response.data;
                $scope.cmtForm.message = "";
                $scope.countcmts = $scope.cmtList.length;
            })
        }
        $scope.postlike = [];
        $scope.Userpostlike = false;
        // like count
        PostServ.getlike($routeParams.id).then(function(resposne){
            $scope.getlike(resposne);
        })
        $scope.postAddlike = function(){
            var data = {
                post_id : $scope.post.ID,
                username : $rootScope.userName
            };
            PostServ.addlike(data).then(function(response){
                if(response.data.message == 1){
                    PostServ.getlike(data.post_id).then(function(resposne){
                        $scope.getlike(resposne);
                    })
                } else {
                    console.log("error");
                }
            })
        }
        $scope.postUnlike = function(){
            var data = {
                post_id : $scope.post.ID,
                username : $rootScope.userName
            };
            PostServ.unlike(data.post_id,data.username).then(function(response){
                if(response.data.message == 1){
                    PostServ.getlike(data.post_id).then(function(resposne){
                        $scope.getlike(resposne);
                    })
                } else {
                    console.log("error");
                }
            })
        }
        $scope.getlike = function(res){
            $scope.postlike = res.data;
            $scope.count = 0;
            $scope.postlike.users.forEach(ele => {
                if (ele === $rootScope.userName){
                    $scope.count++;
                    // break;
                }
            });
            if ($scope.count === 1) {
                $scope.Userpostlike = true;
            } else {
                $scope.Userpostlike = false;
            }
        }
        
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
        })
        UserServ.getfollowers($routeParams.user).then(function(response){
            $scope.followers = response.data;
        });
        $scope.luuthongtin = function(){
            console.log($location.path());
            var timestamp_end = new Date($scope.birthday).toISOString().slice(0, 19).replace('T', ' ');
            var infor ={
                    user: $routeParams.user,
                    email: $scope.email,
                    gender: $scope.gender,
                    job: $scope.job,
                    birthday: timestamp_end
                }    
            console.log(infor); 
            UserServ.change(infor).then(function(response){
                $scope.result = response.data;
            });
        }
        // $scope.check = checkAuth.getuserInfo();

        // console.log($routeParams);

        
    }
])