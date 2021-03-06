app.factory("PostServ", ["$http","Upload", function($http,Upload){
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
        getpostbyuser: function(user){
            return $http.get("http://mfd.local/api/v1/post/"+user);
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
        },
        getlike: function(id){
            return $http.get("http://mfd.local/api/v1/postlike/"+id);
        },
        addlike: function(data) {
            return $http({
                method  : 'POST',
                url     : 'http://mfd.local/api/v1/postlike/',
                data    : $.param(data),
                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
        },
        unlike: function(postid, user){
            return $http.delete("http://mfd.local/api/v1/postlike/?user=" + user + "&postid=" + postid);
        },
        updateviews: function(data){
            return $http.put("http://mfd.local/api/v1/postview/", data);
        },
        createPost: function(data) {
            return $http({
                method  : 'POST',
                url     : 'http://mfd.local/api/v1/post/',
                data    : $.param(data),
                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
        },
        uploadImgs: function(files) {
            return Upload.upload({
                url: 'http://mfd.local/api/models/uploadFile.php', 
                method: 'POST',
                file: files,
                data: {
                    'targetPath' : '/public/imgs/'
                },
                headers: {
                    'Content-Type': undefined
                }
            })
        },
        getImgs: function(id) {
            return $http.get("http://mfd.local/api/v1/image/"+id);
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