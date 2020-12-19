app.controller('loginCtrl',["$scope","$location","$rootScope","$sce","UserServ", function($scope,$location,$rootScope,$sce,UserServ){
    // $scope.check = checkAuth.getuserInfo();
    $rootScope.isLoggedIn = false;
    $scope.login = function(){
        
        if ($scope.loginform.$valid) {
            var user = {
                email: $scope.email,
                password: $scope.pass
            };
            
            UserServ.login(user).then(function(response){
                $scope.result = response.data[0].success;
                if($scope.result == 2)
                {
                    alert('login successful');
                    $rootScope.isLoggedIn = true;
                    $scope.UserId = user.email;
                    $scope.session = $scope.email;
                    $scope.sessionName = 'admin';
                    window.localStorage.setItem("SessionId", $scope.session);
                    window.localStorage.setItem("SessionName", $scope.sessionName);
                    window.localStorage.setItem("isLoggedIn", $scope.isLoggedIn);
                    
                    //userDetails.SessionId = $scope.session;
                    
                    $location.path('/');
                }
                else{
                    $rootScope.isLoggedIn = false;
                    window.localStorage.setItem("isLoggedIn", $rootScope.isLoggedIn);
                    if($scope.result == 1) {
                        $scope.loginMessage = $sce.trustAsHtml('<i class="fa fa-exclamation-triangle"></i> please verify your account');
                    }
                    else if ($scope.result == 3) {
                        $scope.loginMessage = $sce.trustAsHtml('<i class="fa fa-exclamation-triangle"></i> your account was blocked, please contact admin for more infomation');
                    }
                    else if ($scope.result == 4) {
                        $scope.loginMessage = $sce.trustAsHtml('<i class="fa fa-exclamation-triangle"></i> your account was deleted, please contact admin for more infomation');
                    }
                    else {
                        $scope.loginMessage = $sce.trustAsHtml('<i class="fa fa-exclamation-triangle"></i> check your email id and password');
                    }
                }
            })
            
        }
            
    } 
}]);
app.controller("mainCtrl", ["$scope", "$location", "$rootScope", "UserServ", function($scope, $location, $rootScope, UserServ){
    $scope.isActive = function(route) {
        return route === $location.path();
    }

    $rootScope.session = window.localStorage.getItem("SessionId");
    $rootScope.userName = window.localStorage.getItem("SessionName");
    $rootScope.isLoggedIn = window.localStorage.getItem("isLoggedIn");
    console.log($rootScope.isLoggedIn);
    // Call checkAuth factory for cheking login details
    // $scope.check = checkAuth.getuserInfo();

    $scope.logout = function () {
        window.localStorage.clear();
        $rootScope.isLoggedIn = false;
        $location.path("/login");
    };

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
            username: $scope.regForm.username,
            password1: $scope.regForm.password1,
            password2: $scope.regForm.password2
        };
        console.log(user);
        // $scope.loading = true;
        UserServ.add(user).then(function(response){
            $scope.result = response.data;
            $scope.regForm.email = "";
            $scope.regForm.username = "";
            $scope.regForm.password1 = "";
            $scope.regForm.password2 = "";        
            //console.log($scope.result[0].message);
            alert($scope.result[0].message);
            // $scope.loading = false;
        })
    }
}])