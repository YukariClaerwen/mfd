// angular
var app = angular.module("MfdApp",["ngRoute","app.swiper"])

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
        .when("/:user",{
            templateUrl: "/views/user.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/posts",{
            templateUrl: "views/userposts.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/likes",{
            templateUrl: "views/userlikes.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/plans",{
            templateUrl: "views/userplans.html",
            controller: 'UserCtrl',
            activetab: 'user'
        })
        .when("/:user/gallery",{
            templateUrl: "views/usergallery.html",
            controller: 'UserCtrl',
            activetab: 'user'
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