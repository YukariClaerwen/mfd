app.factory("UserServ", ["$http", function($http){
    return {
        get: function(){
           return $http.get("http://mfd.local/api/v1/user");
        },
        getuser: function(id){
            return $http.get("http://mfd.local/api/v1/user/"+id);
        },
        getfollowing: function(id){
            return $http.get("http://mfd.local/api/v1/user/"+id+"/following");
        },
        getfollowers: function(id){
            return $http.get("http://mfd.local/api/v1/user/"+id+"/followers");
        },
        add: function(user){
            return $http({
                method  : 'POST',
                url     : 'http://mfd.local/api/v1/user/',
                data    : $.param(user),
                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
        },
        login: function(data){
            return $http({
                method  : 'POST',
                url     : 'http://mfd.local/api/v1/login',
                data    : $.param(data),
                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
        }
        // delete: function(id){
        //     return $http.delete("http://171.244.37.97:9119/api/todo/" + id);
        // },
        // update: function(data){
        //     return $http.put("http://171.244.37.97:9119/api/todo", data);
        // }
    }
}]) 