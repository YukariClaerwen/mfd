// angular
var app = angular.module("MfdApp",["ngRoute","app.swiper","app.bgSlide","ngSanitize", 'ngTagsInput', 'ngFileUpload'])

// app route
app.config(['$routeProvider','$locationProvider' , function($routeProvider, $locationProvider){
    
    $routeProvider
        .when("/",{
            templateUrl: "/views/explore.html",
            controller: 'PostCtrl',
            activetab: 'explore',
            resolve: {
                // loggedin: checklogin
            }
        })
        .when("/explore",{
            templateUrl: "/views/explore.html",
            controller: 'PostCtrl',
            activetab: 'explore',
            resolve: {
                // loggedin: checklogin
            }
        })
        .when("/about",{
            templateUrl: "/views/home.html",
            controller: 'mainCtrl',
            activetab: 'about'
        })
        .when("/login",{
            templateUrl: "views/account/login.html",
            controller: 'loginCtrl',
            activetab: 'login'
        })
        .when("/register",{
            templateUrl: "views/account/register.html",
            controller: 'mainCtrl',
            activetab: 'login'
        }) 
        .when("/post/key/:key",{
            templateUrl: "/views/explore.html",
            controller: 'PostCtrl',
            activetab: 'explore'
        })
        .when("/post/location/:location",{
            templateUrl: "/views/explore.html",
            controller: 'PostCtrl',
            activetab: 'explore'
        })
        .when("/:user",{
            templateUrl: "/views/user/userposts.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/posts",{
            templateUrl: "views/user/userposts.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/likes",{
            templateUrl: "views/user/userlikes.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/plans",{
            templateUrl: "views/user/userplans.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/plans/:idplan",{
            templateUrl: "views/user/userplans.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/gallery",{
            templateUrl: "views/user/usergallery.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/following",{
            templateUrl: "views/user/userfollowing.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/followers",{
            templateUrl: "views/user/userfollowers.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/settings",{
            templateUrl: "views/user/usersetting.html",
            controller: 'UserCtrl',
            activetab: 'user'
            // resolve: {
            //     loggedin: checklogin
            // }
        })
        .when("/post/:id",{
            templateUrl: "views/post/post.html",
            controller: 'PostCtrl',
            type: 'singlepost'
        })
        .when("/post/hashtag/:hashtag",{
            templateUrl: "/views/explore.html",
            controller: 'PostCtrl',
            activetab: 'explore'
        }) 
        .when("/admin", {
            templateUrl: "views/admin.html"
            // resolve: {
            //     loggedin: checklogin
            // }
        })
        .when("/error", {
            templateUrl: "views/error.html"
        })
        .otherwise({
            redirectTo: "/"
        })
    $locationProvider.html5Mode({
        enabled: true
    });
}])

// end app route

app.run(function($rootScope, PostServ) {
    $rootScope.$on('$routeChangeSuccess', function(event, next, current){
        var views = 0;
        var message = "";
        if(next.type == "singlepost"){
            var data = {
                post_id : next.params.id
            }
            PostServ.updateviews(data).then(function(response){
                message = response.data.message;
                PostServ.getpost(next.params.id).then(function(response){
                    views = response.data[0].views;
                })
                
            })
        }
    });
})
app.directive('ngFiles', ['$parse', function ($parse) {
        function fn_link(scope, element, attrs) {
            var onChange = $parse(attrs.ngFiles);
            element.on('change', function (event) {
                onChange(scope, { $files: event.target.files });
            });
        };
        return {
            link: fn_link
        }
    } 
])

var checklogin = function($q, $location,$rootScope,$route){
    var deferred = $q.defer();
    if($rootScope.isLoggedIn){
        var route = $route.current.params.user;
        if(route === $rootScope.userName){           
            deferred.resolve();
        }
        else{
            deferred.reject();
            $location.url("/"+$rootScope.userName);
        }
    }
    else {
        deferred.reject();
        $location.url("/login");
    }
    return deferred.promise;
}