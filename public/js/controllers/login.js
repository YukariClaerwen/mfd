app.controller('loginCtrl', function($scope,$location,$rootScope,$sce){
	$rootScope.isLoggedIn = false;
	$scope.login = function(){		
			if ($scope.loginform.$valid) {
				if($scope.email == 'admin@gmail.com' && $scope.pass == 'admin123')
				{
					alert('login successful');
					$rootScope.isLoggedIn = true;
					$scope.UserId = $scope.email;
					$scope.session = $scope.email;
					$scope.sessionName = 'admin';
					window.localStorage.setItem("SessionId", $scope.session);
					window.localStorage.setItem("SessionName", $scope.sessionName);
					window.localStorage.setItem("isLoggedIn", $scope.isLoggedIn);
					
					//userDetails.SessionId = $scope.session;
					
					$location.path('/dashboard');
				}
				else{
					$rootScope.isLoggedIn = false;
					window.localStorage.setItem("isLoggedIn", $rootScope.isLoggedIn);
					$scope.loginMessage = $sce.trustAsHtml('<i class="fa fa-exclamation-triangle"></i> check your email id and password');
					console.log($scope.loginMessage);
				}
			}
			
	} 
	
});