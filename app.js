// angular
var app = angular.module("MfdApp",["ngRoute"])

// app route
app.config(['$routeProvider','$locationProvider', function($routeProvider, $locationProvider){
    
    $routeProvider
        .when("/",{
            templateUrl: "/views/home.html",
            controller: 'mainCtrl',
            activetab: 'home'
        })
        .when("/home",{
            templateUrl: "/views/home.html",
            controller: 'mainCtrl',
            activetab: 'home'
        })
        .when("/about",{
            templateUrl: "/views/about.html",
            controller: 'mainCtrl',
            activetab: 'about'
        })
        .when("/news",{
            templateUrl: "views/news.html",
            activetab: 'active'
        })
        .when("/contact",{
            templateUrl: "views/contact.html",
            activetab: 'active'
        })
        .when("/login",{
            templateUrl: "views/login.html"
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