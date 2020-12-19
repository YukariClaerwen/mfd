// angular
var app = angular.module("MfdApp",["ngRoute","app.swiper","app.bgSlide"])

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
            templateUrl: "/views/user/user.html",
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
            activetab: 'user',
            resolve: {
                loggedin: checklogin
            }
        })
        .when("/post/:id",{
            templateUrl: "views/post/post.html",
            controller: 'PostCtrl',
            activetab: 'post'
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

/* Create factory to Disable Browser Back Button only after Logout */
app.factory("checkAuth", function($location,$rootScope,$routeParams){
    return {
        getuserInfo : function(){
			if($rootScope.isLoggedIn === undefined || $rootScope.isLoggedIn === null || $rootScope.isLoggedIn === false){
                // console.log($rootScope.isLoggedIn)
				// $location.path('/login');
            }
            else {
                console.log($location.path())
                console.log($routeParams.id)
                // $location.path('/');
            }
        },
    };
});

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
