$(document).ready(function(){
    populateCampaigns();
});

function populateCampaigns(){
    var spanToPopulate = $("#listOfCampaigns");

    $.when(getCampaigns()).then(function(data){
        data.forEach(function(item){
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
            }
            InsertRowCellCampaigns(item);
        });
    }).fail(function() {
        alert("Something goes wrong!");
    });
    
}

function getCampaigns(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/Campaign/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}


