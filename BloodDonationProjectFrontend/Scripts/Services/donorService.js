DonorService = function(){
    ServiceBase.call(this);
}

DonorService.prototype = Object.create(ServiceBase.prototype);
DonorService.constructor = DonorService;

DonorService.prototype = function(){
    return {
        SetUrl : function(urlSuffix){
            DonorService.prototype.GetUrl = function(){
                return this._baseUrl + urlSuffix;
            }
        }
    }
}();