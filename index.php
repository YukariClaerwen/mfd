<!DOCTYPE html>
<html lang="en" ng-app="MfdApp" ng-controller="mainCtrl" ng-click="hideSideMenu($event)">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>M.fd - Meet.Foodie</title>
    <base href="/">
    
    <link href="image/favicon-32x32.png" type="image/x-icon"  rel="shortcut icon" />

    <link rel="stylesheet" href="public/css/libs/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/angular-xeditable/0.10.2/css/xeditable.min.css"/>
    <link rel="stylesheet" href="public/css/libs/ng-tags-input.min.css" />
    <link rel="stylesheet" href="public/css/libs/swiper-bundle.min.css">
    
    <link rel="stylesheet" href="public/css/customBT.css">
    <link rel="stylesheet" href="public/css/mfd.css">
</head>
<body ng-class=" (loading || editor_block) ? 'overflow-hidden' : ''">
    <header>
        <div id="sideMenu" class="sidemenu">
            <ul ng-include="'views/includes/mainMenu.html'" ng-hide="isActive('/login') || isActive('/register')"></ul>
            <div class="dropdown">
                <a class="btn btn-secondary {{theme.bg}} {{theme.txt}} border-0 dropdown-toggle  rounded-pill" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Settings</a>
            </div>
        </div>
        <nav class="navbar navbar-strip fixed-top navbar-expand-sm py-0 {{theme.navbar}} {{theme.bg}} border-bottom {{theme.border}}">
            <a href="#" class="d-block d-md-none" ng-click="showSideMenu($event)" ng-class="{'d-none':isActive('/login')}">
                <ion-icon size="large" name="menu-outline"></ion-icon>
            </a>
            <a class="navbar-brand myBrand order-sm-1 mr-0 mr-md-3" href="/"><span>M.</span>fd</a>
            
            <a href="#searchMenu" data-toggle="collapse" data-target="#searchMenu" aria-controls="searchMenu"
                aria-expanded="false" class="d-block d-md-none order-sm-3">
                <ion-icon size="large" name="search-outline"></ion-icon>
            </a>
            
            <div class="collapse navbar-collapse order-sm-2" id="mainMenu">
                <ul class="navbar-nav mr-auto" ng-include="'views/includes/mainMenu.html'" ng-hide="isActive('/login') || isActive('/register')"></ul>
                
                <!-- <form class="form-inline my-2 my-lg-0 d-none d-lg-block">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                
                <div class="dropdown" ng-hide="isActive('/login') || isActive('/register')">
                    <a class="btn btn-secondary {{theme.bg}} {{theme.txt}} border-0 dropdown-toggle  rounded-pill" id="dropdownId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Settings</a>
                    <div class="dropdown-menu dropdown-menu-right {{theme.bg}} {{theme.border}} " aria-labelledby="dropdownId">
                        <a class="dropdown-item {{theme.txt}} {{theme.bg}}" href="/#/admin">Quản lý</a>
                         <a class="dropdown-item {{theme.txt}} {{theme.bg}}" href="" ng-click="switch('dark')" theme="dark" style="display: none;">Switch dark theme</a>
                        <a class="dropdown-item {{theme.txt}} {{theme.bg}}" href="" ng-click="switch('light')" theme="light">Switch light theme</a> 
                    </div>
                </div> -->
                <div ng-show="isLoggedIn" class="d-flex justify-content-end align-items-center">
                    <a href="/{{userName}}" title="{{viewName}}" class="mr-3 d-flex justify-content-end align-items-center">
                        <img class="navAva mr-1" ng-src="../public/imgs/{{avatar}}" alt="">
                        <b>{{viewName}}</b>
                    </a>
                    <a class="mr-3 icon-btn btn btn-light" href="" ng-click="addPost()">
                        <ion-icon name="add"></ion-icon>
                    </a>
                    <a class=" icon-btn btn btn-light" href="#" ng-click="logout()">
                        <ion-icon name="log-out-outline"></ion-icon>
                    </a>
                </div>         
                <div ng-hide="isActive('/login') || isActive('/register') || isLoggedIn">
                    <a class="btn btn-success icon-btn" href="/login" ng-click="getoldlink()">
                        <ion-icon name="log-in-outline"></ion-icon>
                    </a>
                </div>
            </div>
        </nav>
    </header>
    

	<div ng-view></div>
    <div class="spinner-loading d-flex justify-content-center align-items-center" ng-show="loading">
        <div class="spinner-grow text-success" style="width: 5rem; height: 5rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <div class="editor_block_modal" ng-include="'views/includes/post/posteditor.html'" ng-if="editor_block"></div>
    
    <footer>
        <div class="text-center py-3">
            &copy; <?php echo date("Y"); ?>  <a href="/" title="Meet.Foodie"><b>M.fd</b></a>
        </div>
    </footer>

    
    <script src="public/js/libs/jquery-3.5.1.min.js"></script>
    <script src="public/js/libs/popper.min.js"></script>
    <script src="public//js/libs/bootstrap/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-xeditable/0.10.2/js/xeditable.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular-route.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular-sanitize.js"></script>
    

    <script src="public/js/libs/ng-tags-input.min.js"></script>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

    <script src="app.js"></script>
    <script src="public/js/directive/swiper.js"></script>
    <script src="public/js/directive/bgSlide.js"></script>
    <script src="public/js/services/post.js"></script>
    <script src="public/js/services/user.js"></script>
    <script src="public/js/services/plan.js"></script>
    <script src="public/js/services/hashtag.js"></script>
    <script src="public/js/controllers/mfd.js"></script>
    <script src="public/js/controllers/post.js"></script>
</body>
</html>