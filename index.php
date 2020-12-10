<!DOCTYPE html>
<html lang="en" ng-app="MfdApp" ng-controller="mainCtrl" ng-click="hideSideMenu($event)">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mfd - Meet Foodie</title>
    <base href="/">

    <link rel="stylesheet" href="public/css/libs/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/angular-xeditable/0.10.2/css/xeditable.min.css"/>

    <link rel="stylesheet" href="public/css/mfd.css">
</head>
<body>
    <header>
        <div id="sideMenu" class="sidemenu" ng-click="">
            <ul ng-include="'views/includes/mainMenu.html'"></ul>
            <div class="dropdown">
                <a class="btn btn-secondary {{theme.bg}} {{theme.txt}} border-0 dropdown-toggle  rounded-pill" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Settings</a>
                <div class="dropdown-menu dropdown-menu-right {{theme.bg}} {{theme.border}} " aria-labelledby="dropdown">
                    <a class="dropdown-item {{theme.txt}} {{theme.bg}}" href="/#/admin">Quản lý</a>
                    <!-- <a class="dropdown-item {{theme.txt}} {{theme.bg}}" href="" ng-click="switch('dark')" theme="dark" style="display: none;">Switch dark theme</a>
                    <a class="dropdown-item {{theme.txt}} {{theme.bg}}" href="" ng-click="switch('light')" theme="light">Switch light theme</a> -->
                </div>
            </div>
        </div>
        <nav class="navbar navbar-strip fixed-top navbar-expand-sm py-0 {{theme.navbar}} {{theme.bg}} border-bottom {{theme.border}}">
            <a href="#" class="d-block d-md-none" ng-click="showSideMenu($event)">
                <ion-icon size="large" name="menu-outline"></ion-icon>
            </a>
            <a class="navbar-brand myBrand order-sm-1" href="/"><span>M.</span>fd</a>
            
            <a href="#searchMenu" data-toggle="collapse" data-target="#searchMenu" aria-controls="searchMenu"
                aria-expanded="false" class="d-block d-md-none order-sm-3">
                <ion-icon size="large" name="search-outline"></ion-icon>
            </a>
            <div class="collapse navbar-collapse order-sm-2" id="mainMenu">
                <ul class="navbar-nav mr-auto" ng-include="'views/includes/mainMenu.html'"></ul>
                
                <form class="form-inline my-2 my-lg-0 d-none d-lg-block">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
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
    </header>
    

    
	<div ng-view></div>

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

    <script>
        
    </script>
</body>
</html>