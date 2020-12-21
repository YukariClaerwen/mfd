app.factory("PostServ", ["$http", function($http){
    return {
        get: function(){
            return $http.get("http://mfd.local/api/v1/post");
        },
        getpost: function(id){
            return $http.get("http://mfd.local/api/v1/post/"+id);
        },
        getpostbyHashtag: function(hashtag){
            return $http.get("http://mfd.local/api/v1/post/hashtag/"+hashtag);
        },
        getpostbyKey: function(key){
            return $http.get("http://mfd.local/api/v1/post/key/"+key);
        },
        getpostbyLocation: function(location){
            return $http.get("http://mfd.local/api/v1/post/location/"+location);
        },
        getcmt: function(id){
            return $http.get("http://mfd.local/api/v1/comment/"+id);
        },
        addcmt: function(cmt){
            return $http({
                method  : 'POST',
                url     : 'http://mfd.local/api/v1/comment/',
                data    : $.param(cmt),
                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
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