app.factory("PostServ", ["$http", function($http){
    return {
        get: function(){
            return $http.get("http://mfd.local/api/v1/post");
        },
        getpost: function(id){
            return $http.get("http://mfd.local/api/v1/post/"+id);
        }
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