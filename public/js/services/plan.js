app.factory("PlanServ", ["$http", function($http){
    return {
        get: function(user){
            return $http.get("http://mfd.local/api/v1/plan/"+user);
        },
        getCity: function(){
            return $http.get("http://mfd.local/api/v1/city");
        },
        createplan: function(data){
            return $http({
                method  : 'POST',
                url     : 'http://mfd.local/api/v1/plan/',
                data    : $.param(data),
                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
        },
        /*createDetailPlan: function(data){
            return $http({
                method  : 'POST',
                url     : 'http://mfd.local/api/v1/plan/',
                data    : $.param(data),
                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
        }*/
        // add: function(data){
        //     return $http.post("http://171.244.37.97:9119/api/todo", data);
        // },
        // delete: function(id){
        //     return $http.delete("http://171.244.37.97:9119/api/todo/" + id);
        // },
        // update: function(data){
        //     return $http.put("http://171.244.37.97:9119/api/todo", data);
        // }
    }
}])