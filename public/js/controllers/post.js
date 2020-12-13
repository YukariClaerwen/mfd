app.controller("PostCtrl", ["$scope", "PostServ", "$location", function($scope, PostServ, $location){

    $scope.posts = [];
    // PostServ.get().then(function(response){
    //     $scope.posts = response.data;
    //     console.log($scope.posts)
    // })
    PostServ.get().then(function(response){
        $scope.posts = response.data;
        console.log($scope.posts)
    })
    $scope.postbg = function(bg) {
        return bg;
    }

}])