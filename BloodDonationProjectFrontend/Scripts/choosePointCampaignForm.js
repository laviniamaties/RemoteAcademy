$(document).ready(function(){
    populateCampaignsPoints();
});

function registerButtonEventsChoosePoint(){
    $("#addPoint").on("click", function(){
        handleInsert();
     });
}

function populateCampaignsPoints(){
    var spanToPopulate = $("#listOfPointsCampaigns");

    $.when(getCampaignsPoints()).then(function(data){
        data.forEach(function(item){
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
            }
            InsertRowCellCampaignsPoints(item);
        });
    }).fail(function() {
        alert("Something goes wrong!");
    });
    
}

function getCampaignsPoints(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/ViewPointCampaign/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}

function GetRegisterModel(){

    return {
        CampaignID : $("#idCampaignRegister").val(),
        CollectionPointID :  $("#idPointRegister").val()
    }
}

function handleInsert(){

    var registerData = GetRegisterModel();

    $.when(sendRegisterData(registerData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
    });

}
//insert
function sendRegisterData(data){
    let promise = $.ajax({
        type:'POST',
        url:'https://localhost:44331/api/RegisterCampaigns/Insert',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
    });
    return promise;
}