function onFormSubmitCampaign() {
    $("#addCampaignButton").on("click", function(){
       handleInsert();
    });
    $("#updateCampaignButton").on("click", function(){
        handleUpdate();
    });
    $("#deleteCampaignButton").on("click", function(){
        handleDelete();
    });
}

function handleInsert(){

    var id = $("#idCampaign").val();
    var name = $("#nameCampaign").val();
    var description = $("#descriptionCampaign").val();
    var startDate = $("#startDateCampaign").val();
    var endDate = $("#endDateCampaign").val();

    var campaignData = {
        ID : id,
        Name : name, 
        Description : description,
        StartDate : startDate,
        EndDate : endDate
    }

    $.when(sendCampaignData(campaignData)).then(function(){
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
    });

}

function sendCampaignData(data){
    let promise = $.ajax({
        type:'POST',
        url:'https://localhost:44331/api/Campaign/Insert',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
    });
    return promise;
}

function handleUpdate() {
 
    var id = $("#idCampaign").val();
    var name = $("#nameCampaign").val();
    var description = $("#descriptionCampaign").val();
    var startDate = $("#startDateCampaign").val();
    var endDate = $("#endDateCampaign").val();

    var campaignData = {
        ID : id,
        Name : name, 
        Description : description,
        StartDate : startDate,
        EndDate : endDate
    }

    $.when(updateCampaignData(campaignData)).then(function(){
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
    });

}

function updateCampaignData(data){
    let promise = $.ajax({
        type:'PUT',
        url:'https://localhost:44331/api/Campaign/Update',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
    });
    return promise;

}

//delete
function handleDelete() {
 
    var id = $("#idCampaign").val();
    var campaignData = {
        ID : id
    }

    $.when(deleteCampaignData(campaignData)).then(function(){
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
    });

}

function deleteCampaignData(data){
    var Id = $("#idCampaign").val();
    let promise = $.ajax({
        type:'POST',
        url:"https://localhost:44331/api/Campaign/DeleteById?ID=" + Id,
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
    });
    return promise;

}