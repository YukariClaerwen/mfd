// angular
var app = angular.module("MfdApp",["ngRoute","app.swiper","app.bgSlide"])

// app route
app.config(['$routeProvider','$locationProvider', function($routeProvider, $locationProvider){
    
    $routeProvider
        .when("/",{
            templateUrl: "/views/explore.html",
            controller: 'PostCtrl',
            activetab: 'explore'
        })
        .when("/explore",{
            templateUrl: "/views/explore.html",
            controller: 'PostCtrl',
            activetab: 'explore'
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
        .when("/post/hashtag/:hashtag",{
            templateUrl: "/views/explore.html",
            controller: 'PostbyCtrl',
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
        .when("/post/:id",{
            templateUrl: "views/post/post.html",
            controller: 'PostCtrl',
            activetab: 'post'
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
app.factory("checkAuth", function($location,$rootScope){
    return {
        getuserInfo : function(){
			if($rootScope.isLoggedIn === undefined || $rootScope.isLoggedIn === null){
				$location.path('/login');
			}
		}
    };
});