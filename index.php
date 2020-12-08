<!DOCTYPE html>
<html lang="en" ng-app="MfdApp">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mfd - Meet Foodie</title>
    <base href="/">

    <link rel="stylesheet" href="public/css/libs/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/angular-xeditable/0.10.2/css/xeditable.min.css"/>

    <link rel="stylesheet" href="public/css/mfd.css">
</head>
<body ng-controller="mainCtrl">
    <nav class="navbar navbar-expand-sm {{theme.navbar}} {{theme.bg}} border-bottom {{theme.border}} py-0">
        <a class="navbar-brand myBrand" href="/"><b>{{webName}}</b></a>
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item py-2 px-3" ng-class="{active:isActive('/')}">
                    <a class="nav-link" href="/home">Home</a>
                </li>
                <li class="nav-item py-2 px-3" ng-class="{active:isActive('/about')}">
                    <a class="nav-link" href="/about">About</a>
                </li>
                <li class="nav-item py-2 px-3" ng-class="{active:isActive('/news')}">
                    <a class="nav-link" href="/#/news">News</a>
                </li>
                <li class="nav-item py-2 px-3" ng-class="{active:isActive('/contact')}">
                    <a class="nav-link" href="/#/contact">Contact</a>
                </li>
            </ul>
            
            <div class="dropdown">
                <a class="btn btn-secondary {{theme.bg}} {{theme.txt}} border-0 dropdown-toggle  rounded-pill" id="dropdownId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Settings</a>
                <div class="dropdown-menu dropdown-menu-right {{theme.bg}} {{theme.border}} " aria-labelledby="dropdownId">
                    <a class="dropdown-item {{theme.txt}} {{theme.bg}}" href="/#/admin">Quản lý</a>
                    <!-- <a class="dropdown-item {{theme.txt}} {{theme.bg}}" href="" ng-click="switch('dark')" theme="dark" style="display: none;">Switch dark theme</a>
                    <a class="dropdown-item {{theme.txt}} {{theme.bg}}" href="" ng-click="switch('light')" theme="light">Switch light theme</a> -->
                </div>
            </div>
        </div>
    </nav>

    
		<div class="container">
			<div ng-view></div>
		</div>

    <footer>

    </footer>

    
    <script src="public/js/libs/jquery-3.5.1.min.js"></script>
    <script src="public/js/libs/popper.min.js"></script>
    <script src="public//js/libs/bootstrap/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-xeditable/0.10.2/js/xeditable.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular-route.js"></script>

    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

    <script src="app.js"></script>
    <script src="public/js/controllers/mfd.js"></script>
    <script src="public/js/services/mfd.js"></script>
</body>
</html>