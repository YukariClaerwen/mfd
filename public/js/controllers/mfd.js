app.controller("mainCtrl", ["$scope", "$location", "UserServ", function($scope, $location, UserServ){
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
            console.log($scope.result[0].message);
            alert($scope.result[0].message);
            // $scope.loading = false;
        })
    }

}])