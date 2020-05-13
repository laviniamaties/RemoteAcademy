$(document).ready(function(){
    populateActiveCampaigns();
});

function populateActiveCampaigns(){
    var spanToPopulate = $("#listOfCampaigns");
    $.when(showCampaigns()).then(function(data){
        data.forEach(function(item){
       
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
            }
            InsertRowCellCampaigns(item);
        });
    }).fail(function() {
        alert("smth wrong with database :(");
    });
    
}

function showCampaigns(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/Campaign/ShowActiveCampaign',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}



