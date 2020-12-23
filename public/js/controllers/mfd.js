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
                $scope.result = response.data[0];
                console.log($scope.result);
                if($scope.result.success == 2)
                {
                    alert('login successful');
                    $rootScope.isLoggedIn = true;
                    const mfdSession = [{
                        email: user.email,
                        userid : $scope.result.username,
                        viewname : $scope.result.name,
                        avatar : $scope. result.avatar,
                        role : $scope.result.role,
                        isLoggedIn : $scope.isLoggedIn
                    }] ;
                    const setjson = JSON.stringify(mfdSession);
                    window.localStorage.setItem("mfdssn", setjson);
                    console.log(mfdSession);
                    // console.log(window.localStorage.getItem("mfdssn"));
                    // $scope.UserId = user.email;
                    // $scope.session = $scope.result.username;
                    // $scope.sessionName = $scope.result.roll;
                    // window.localStorage.setItem("SessionId", $scope.session);
                    // window.localStorage.setItem("SessionName", $scope.sessionName);
                    // window.localStorage.setItem("isLoggedIn", $scope.isLoggedIn);
                    
                    //userDetails.SessionId = $scope.session;
                    
                    $location.path($rootScope.oldlink);
                    $rootScope.session = user.email;
                    $rootScope.userName = $scope.result.username;
                    $rootScope.viewName = $scope.result.name;
                    $rootScope.avatar = $scope.result.avatar;
                    $rootScope.isLoggedIn = $scope.isLoggedIn;
                }
                else{
                    $rootScope.isLoggedIn = false;
                    // window.localStorage.setItem("isLoggedIn", $rootScope.isLoggedIn);
                    if($scope.result.success == 1) {
                        $scope.loginMessage = $sce.trustAsHtml('<i class="fa fa-exclamation-triangle"></i> please verify your account');
                    }
                    else if ($scope.result.success == 3) {
                        $scope.loginMessage = $sce.trustAsHtml('<i class="fa fa-exclamation-triangle"></i> your account was blocked, please contact admin for more infomation');
                    }
                    else if ($scope.result.success == 4) {
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
    $rootScope.isLoggedIn = false;
    if (localStorage.getItem("mfdssn") !== null) {
        $scope.mfdSession = JSON.parse(window.localStorage.getItem("mfdssn"))[0];
    
        $rootScope.session = $scope.mfdSession.email;
        $rootScope.userName = $scope.mfdSession.userid;
        $rootScope.viewName = $scope.mfdSession.viewname;
        $rootScope.avatar = $scope.mfdSession.avatar;
        $rootScope.isLoggedIn = $scope.mfdSession.isLoggedIn;
        
    }
    // console.log($rootScope.isLoggedIn);
    // console.log($scope.mfdSession);
    // Call checkAuth factory for cheking login details

    $scope.logout = function () {
        window.localStorage.removeItem("mfdssn");
        $rootScope.isLoggedIn = false;
        $rootScope.session = null;
        $rootScope.userName = null;
        $rootScope.viewName = null;
        $rootScope.avatar = null;
        $location.path("/");
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
            if($scope.result[0].message == "Dang ky thanh cong"){
                $location.path('/login');    
            }
            // $scope.loading = false;
        })
    }
    $rootScope.oldlink = "/";
    $scope.getoldlink = function(){
        $rootScope.oldlink = $location.path();
    }
}])