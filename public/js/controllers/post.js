app.controller(
    "PostCtrl", ["$scope", "PostServ", "UserServ", "HashtagServ", "$location", "$routeParams", "$rootScope", "$anchorScroll","PlanServ",
    function($scope, PostServ, UserServ,HashtagServ, $location, $routeParams, $rootScope, $anchorScroll,PlanServ){
        // console.log("path" + $location.path());
        // console.log("url" + $location.url());
        // console.log("search" + $location.search());   
        $scope.path=$location.path().split('/');
        // console.log($scope.path);
        $scope.posts = [];
        $scope.post = {};
        $scope.key= "";
        $scope.hashtag = "";
        $scope.cities=[];
        //console.log($location.search().search);
        PlanServ.getCity().then(function(response){
            $scope.cities= response.data;
            //console.log($scope.cities[0].Name);
        })
        $scope.imgs = {};
        $rootScope.Posts = [];

        
        
        if($scope.path[2] == "hashtag"){
            $scope.hashtag = $routeParams.hashtag;
            PostServ.getpostbyHashtag($routeParams.hashtag).then(function(response){
                $scope.posts= response.data;
            })
        }
        else if($scope.path[2] == "location"){
            PostServ.getpostbyLocation($routeParams.location).then(function(response){
                $scope.posts= response.data;
            })
        }
        else if($scope.path[2] == "key"){
            PostServ.getpostbyKey($routeParams.key).then(function(response){
                $scope.posts = response.data;
            })
        }
        else{
            $rootScope.loading = true;
            PostServ.get().then(function(response){
                $scope.posts = response.data;
                $rootScope.Posts = response.data;
                console.log($scope.posts);
                const Postsjson = JSON.stringify(response.data);
                $rootScope.loading = false;
                var keepgoing = true;
                $scope.posts.forEach(element => {
                    if(keepgoing){
                        if(element.ID === $routeParams.id){
                            $scope.post = element;
                            followFn($scope,UserServ,$scope.post.user.username,$rootScope);
                            $scope.points = $scope.getNumber($scope.post.point);
                            getimgs(PostServ,$scope.post.ID,$scope);
                            keepgoing = false;
                        }
                    }
                });
                window.localStorage.setItem("mfdPosts", Postsjson);
            })
        }      
        $scope.SearchLocation = function(){
            $location.path("/post/location/"+$scope.location );
            //console.log($location.path("/post/location/"+$scope.location ));
            //$scope.location=$routeParams.location;
            //console.log($routeParams.location);
        } 
        $scope.SearchKey = function(){
            $location.path("/post/key/"+$scope.key);
            //$scope.key= $routeParams.key;
            //console.log($routeParams.key);    
            } 
        /*$scope.searchKey = function(){
            console.log($scope.key);
            PostServ.getpostbyKey($scope.key).then(function(response){
                $scope.posts = response.data;
            })}*/
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
        
        // PostServ.getpost($routeParams.id).then(function(response){
        //     $scope.post = response.data[0];
        //     followFn($scope,UserServ,$scope.post.user.username,$rootScope);
        //     $scope.points = $scope.getNumber($scope.post.point);
        //     // $scope.placepoint = parseFloat($scope.post.place.point).toFixed(1);
        // })
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
            if($rootScope.isLoggedIn){
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
            } else {
                var alert = confirm("Hãy đăng nhập để có thể thích bài viết!")
                if(alert){
                    $location.path("/login");
                }
            }
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
                }
            });
            if ($scope.count === 1) {
                $scope.Userpostlike = true;
            } else {
                $scope.Userpostlike = false;
            }
        }
        $scope.followUser = function(user) {
            if($rootScope.isLoggedIn){
                followUser($rootScope,user,UserServ,$scope);
            } else {
                var alert = confirm("Hãy đăng nhập để theo dõi tài khoản này");
                if(alert){
                    $location.path("/login");
                }
            }
        }
        $scope.unfollowUser = function(user){
            var alert = confirm("Bạn có chắc chắn muốn xóa theo dõi hay không?");
            if(alert){
                unfollowUser($rootScope,user,UserServ,$scope);
            }
        }
        $scope.getNumber = function(num) {
            return new Array(parseInt(num));   
        }
        $scope.fixPoint = function financial(x) {
            return Number.parseFloat(x).toFixed(1);
        }
        $scope.scroll = function () {
            $anchorScroll();
        };
        $scope.gotoCmt = function() {
            $location.hash('comment_list');
            $anchorScroll();
        }
        
    }
])


// nhớ hỏi
app.controller(
    "UserCtrl", ["$scope", "UserServ","PlanServ", "$routeParams", "$location","$rootScope","PostServ",
    function($scope, UserServ,PlanServ, $routeParams, $location, $rootScope,PostServ){
        $scope.user = {};
        $scope.cover = null;
        getuser(UserServ,$routeParams.user,$scope)
        $scope.limitcmt = 1;
        /* get plan*/
        $scope.plans=[];
        PlanServ.get($routeParams.user).then(function(response){
            $scope.plans = response.data;
            //console.log($scope.plans[0])
        })
        $scope.posts=[];
        $scope.nopost= true;
        // window.localStorage.removeItem("mfdplaceList");
        $rootScope.localPosts = JSON.parse(window.localStorage.getItem("mfdPosts"));

        angular.forEach($rootScope.localPosts, function(value, key) {
            if(value.user.username == $routeParams.user){
                value.message = null;
                this.push(value)
            }
        }, $scope.posts);
        if($scope.posts.length > 0){$scope.nopost =false;}
        // PostServ.getpostbyuser($routeParams.user).then(function(response){
        //     $scope.posts= response.data;
        //     console.log($scope.posts[0].comments);
        //     if($scope.posts.length > 0){$scope.nopost =false;}
        // })
        // get City
        $scope.cities=[];
        PlanServ.getCity().then(function(response){
            $scope.cities = response.data;
        })
        $scope.isActive = function(route) {
            return route === $location.path();
        }
        $scope.following = [];
        $scope.followers = [];
        UserServ.getfollowing($routeParams.user).then(function(response){
            $scope.following = response.data;
        })
        $scope.Userfollowing = false;
        getfollowers(UserServ,$routeParams.user,$scope,$rootScope)
        // UserServ.getfollowers($routeParams.user).then(function(response){
        //     $scope.getfollowers(response);
        // });
        $scope.luuthongtin = function(){
            console.log($location.path());
            var timestamp_end = new Date($scope.birthday).toISOString().slice(0, 19).replace('T', ' ');
            var infor ={
                    user: $routeParams.user,
                    email: $scope.Email,
                    gender: $scope.gender,
                    job: $scope.job,
                    birthday: timestamp_end
                }    
            console.log(infor); 
            UserServ.change(infor).then(function(response){
                $scope.result = response.data;
                console.log($scope.result)
                alert($scope.result[0].message);
            });
        }
        $scope.ChangePassword = function(){
            //console.log($location.path());
            //var timestamp_end = new Date($scope.birthday).toISOString().slice(0, 19).replace('T', ' ');
            var password ={
                    user: $routeParams.user,
                    pswdcurrent: $scope.pswdcurrent,
                    pswd1: $scope.pswd1,
                    pswd2: $scope.pswd2
                }    
            console.log(password); 
            UserServ.changePassword(password).then(function(response){
                $scope.result = response.data;
                console.log($scope.result)
                alert($scope.result[0].message);
                $scope.pswdcurrent="";
                $scope.pswd1="";
                $scope.pswd2=""
            });
        }
        // Create plan
        $scope.re=[];
        $scope.selected= true;
        $scope.CreatePlan = function(){
            //console.log($location.path());
            //var timestamp_end = new Date($scope.birthday).toISOString().slice(0, 19).replace('T', ' ');
            var data ={
                    user: $routeParams.user,
                    namePlan: $scope.namePlan,
                    city: $scope.City
                }    
            console.log(data); 
            PlanServ.createplan(data).then(function(response){
                $scope.plans = response.data;
                //console.log($scope.result);
            });
        }

        $scope.Createdetail = function(){
            var d = new Date( $scope.Date).toISOString().slice(0, 10);
            var data ={
                id: $routeParams.idplan,
                Activity: $scope.Activity,
                Address: $scope.Address,
                Date:  d
            }
            //console.log($location.search());
            // console.log(data);
            PlanServ.createplan(data).then(function(response){
                PlanServ.get($routeParams.user).then(function(response){
                    $scope.plans = response.data;
                    //console.log($scope.plans[0])
                })
                //console.log($scope.plans);
                //$('#exampleModal1').modal('hide');
                alert("Successful");
            })

        }
        // $scope.check = checkAuth.getuserInfo();

        // console.log($routeParams);

        followFn($scope,UserServ,$routeParams.user,$rootScope);
        $scope.followUser = function(user) {
            followUser($rootScope,user,UserServ,$scope);
        }
        $scope.unfollowUser = function(user){
            unfollowUser($rootScope,user,UserServ,$scope);
        }

        
        $scope.submit_comment = function(index){
            var message = {
                content : $scope.posts[index].message,
                post_id : $scope.posts[index].ID,
                username : $rootScope.userName
            };
            PostServ.addcmt(message).then(function(response){
                $scope.posts[index].comments = response.data;
                $scope.posts[index].message = "";
                PostServ.get().then(function(response){
                    $rootScope.Posts = response.data;
                    window.localStorage.removeItem("mfdPosts");
                    const Postsjson = JSON.stringify(response.data);
                    window.localStorage.setItem("mfdPosts", Postsjson);
                })
            })
        }

        $scope.imgsuser = [];
        UserServ.getimgs($routeParams.user).then(function(res){
            $scope.imgsuser =res.data;
            // console.log($scope.imgsuser);
        })

        
        // $scope.postAddlike = function(id){
        //     if($rootScope.isLoggedIn){
        //         var data = {
        //             post_id : id,
        //             username : $rootScope.userName
        //         };
        //         PostServ.addlike(data).then(function(response){
        //             if(response.data.message == 1){
        //                 PostServ.getlike(data.post_id).then(function(resposne){
        //                     $scope.getlike(resposne);
        //                 })sss
        //             } else {
        //                 console.log("error");
        //             }
        //         })
        //     } else {
        //         var alert = confirm("Hãy đăng nhập để có thể thích bài viết!")
        //         if(alert){
        //             $location.path("/login");
        //         }
        //     }
        // }
        // $scope.postUnlike = function(id){
        //     var data = {
        //         post_id : id,
        //         username : $rootScope.userName
        //     };
        //     PostServ.unlike(data.post_id,data.username).then(function(response){
        //         if(response.data.message == 1){
        //             PostServ.getlike(data.post_id).then(function(resposne){
        //                 $scope.getlike(resposne);
        //             })
        //         } else {
        //             console.log("error");
        //         }
        //     })
        // }

        
        // $scope.getlike = function(res){
        //     $scope.postlike = res.data;
        //     $scope.count = 0;
        //     $scope.postlike.users.forEach(ele => {
        //         if (ele === $rootScope.userName){
        //             $scope.count++;
        //         }
        //     });
        //     if ($scope.count === 1) {
        //         $scope.Userpostlike = true;
        //     } else {
        //         $scope.Userpostlike = false;
        //     }
        // }
    }   
])

var getfollowing = function(service, user, scope) {
    service.getfollowing(user).then(function(response){
        scope.following = response.data;
        // console.log(scope.following);
    })
}

var getfollowers = function(service, user, scope, rootScope) {
    service.getfollowers(user).then(function(res){
        scope.followers = res.data;
        scope.count = 0;
        scope.followers.forEach(ele => {
            if (ele.username === rootScope.userName){
                scope.count++;
            }
        });
        if (scope.count === 1) {
            scope.Userfollowing = true;
        } else {
            scope.Userfollowing = false;
        }
        // console.log(scope.followers);
    })
}

var getuser = function(service, user, scope) {
    service.getuser(user).then(function(response){
        scope.user = response.data[0];
        scope.cover = scope.user.cover;
        console.log(scope.user);
    })
}

var getimgs = function(service,postid,scope) {
    service.getImgs(postid).then(function(response){
        console.log(response.data)
        scope.imgs =  response.data;
    })
}

var followUser = function(rootScope, user, service, scope){
    var data = {
        username : rootScope.userName,
        follow : user
    };
    service.follow(data).then(function(response){
        if(response.data.message == 1){
            getfollowers(service,user,scope,rootScope);
            getfollowing(service,user,scope);
            getuser(service,user,scope);
        } else {
            console.log("error");
        }
    })
}

var unfollowUser = function(rootScope, user, service, scope){
    var data = {
        username : rootScope.userName,
        unfollow : user
    };
    service.unfollow(data.username,data.unfollow).then(function(response){
        if(response.data.message == 1){
            getfollowers(service,user,scope,rootScope);
            getfollowing(service,user,scope);
            getuser(service,user,scope);
        } else {
            console.log("error");
        }
    })
}

var followFn = function(scope,service,user,rootScope){
    scope.following = [];
    scope.followers = [];
    scope.Userfollowing = false;
    getfollowing(service,user,scope);
    getfollowers(service,user,scope,rootScope);
}


// app.run(function ($rootScope) {
    
//   });