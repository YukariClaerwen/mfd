// angular
var app = angular.module("MfdApp",["ngRoute"])

app.controller("mainCtrl", ["$scope", "MfdServ", "$location", function($scope, MfdServ, $location){
    $scope.webName = "Mfd";
    $scope.searchData = {};
    $scope.loading = false;
    $scope.searching = false;
    $scope.link = "";
    $scope.searchList = [];
    $scope.isActive = function(route) {
        return route === $location.path();
    }
    $scope.themesData = {
        "light" : {
            "navbar" : "navbar-light",
            "bg" : "bg-white",
            "txt": "text-dark",
            "txt50": "text-black-50",
            "border": "border-light",
            "border_d": "border-light"
        },
        "dark" : {
            "navbar" : "navbar-dark",
            "bg" : "bg-dark",
            "txt" : "text-light",
            "txt50": "text-white-50",
            "border": "border-secondary",
            "border_d": "border-dark"
        }
    }
    $scope.theme = $scope.themesData.light;
    $scope.switch = function(key) {
        if(key == "light"){
            $scope.theme = $scope.themesData.light;
        }
        else{
            $scope.theme = $scope.themesData.dark;
        }
        $("[theme]").show();
        $("[theme='" + key +"']").hide();
    }
}])