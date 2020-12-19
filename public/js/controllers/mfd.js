app.controller("mainCtrl", ["$scope", "$location", "$rootScope", "UserServ", "checkAuth", function($scope, $location, $rootScope, UserServ, checkAuth){
    $scope.isActive = function(route) {
        return route === $location.path();
    }

    // $rootScope.session = window.localStorage.getItem("SessionId");
    // $rootScope.userName = window.localStorage.getItem("SessionName");
    // $rootScope.isLoggedIn = window.localStorage.getItem("isLoggedIn");

    // // Call checkAuth factory for cheking login details
    // $scope.check = checkAuth.getuserInfo();

    // $scope.logout = function () {
    //     window.localStorage.clear();
    //     $rootScope.isLoggedIn = false;
    //     $location.path("/login");
    // };

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

    $scope.showSideMenu = function($event){
        $event.stopPropagation();
        $("header").addClass("sideMenuOpen");
    }
    $scope.hideSideMenu = function(){
        $("header").removeClass("sideMenuOpen");
    }
    
    $scope.navH = function(){
        return $("nav").height()
    }
    $scope.topMargin = {
        "margin-top" : $("nav").height()
    }

    
    $scope.regForm = {};

    $scope.addUser = function(){
        var user = {
            email: $scope.regForm.email,
            username: $scope.regForm.username
        };
        $scope.regForm.email = "";
        console.log(user);
        // $scope.loading = true;
        UserServ.add(user).then(function(response){
            $scope.user = response.data;
            $scope.regForm.email = "";
            $scope.regForm.username = "";
            console.log($scope.user);
            // $scope.loading = false;
        })
    }
}])