var app = angular.module("Review",["ngRoute"]);

//định tuyến
app.config(function($routeProvider){
    $routeProvider
    .when("/",{
        templateUrl:"gioithieu.html"
    })
    .when("/baiviet",{
        templateUrl:"baiviet.html"
    })
    .when("/kehoachkhampha",{
        templateUrl:"kehoachkhampha.html"
    })
    .when("/yeuthich",{
        templateUrl:"yeuthich.html"
    })
    .when("/hinhanh&video",{
        templateUrl:"hinhanh&video.html"
    })
    .otherwise({
        redirectTo: "/"
    })
});





