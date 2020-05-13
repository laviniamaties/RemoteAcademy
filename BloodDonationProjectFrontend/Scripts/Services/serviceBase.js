ServiceBase = function(){
    this._baseURL = 'https://localhost:44331/api/';

}

ServiceBase.prototype = function(){
    return{
        GetUrl : function(){
            return 
                this._baseURL;
        },

        Get : function(){
            let promise = $.ajax({
                type:'GET',
                url:this.GetUrl(),
                contentType: 'application/json',
                dataType: 'json',
                accept: 'application/json'
            });
            return promise;
        }, 

        Post: function(data){
            let promise = $.ajax({
                type:'POST',
                url:this.GetUrl(),
                contentType: 'application/json',
                dataType: 'json',
                accept: 'application/json',
                data: JSON.stringify(data)
            });
            return promise;
        },

        Put: function(data){
            let promise = $.ajax({
                type:'PUT',
                url:this.GetUrl(),
                contentType: 'application/json',
                dataType: 'json',
                accept: 'application/json',
                data: JSON.stringify(data)
            });
            return promise;
        }
    }
}();