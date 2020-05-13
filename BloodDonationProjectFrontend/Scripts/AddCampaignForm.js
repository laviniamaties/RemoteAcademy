
function registerButtonEventsCamp(){
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

function getCampaignModel(){
    return {
        ID : $("#idCampaign").val(),
         Name : $("#nameCampaign").val(),
         Description : $("#descriptionCampaign").val(),
         StartDate : $("#startDateCampaign").val(),
         EndDate : $("#endDateCampaign").val()

    }
}

function isValid(){

    if($("#idCampaign").val() == "") {
      return false;
    }
    if($("#nameCampaign").val() == "") {
        return false;
    }
      if($("#descriptionCampaign").val() == "") {
        return false;
    }
    if($("#startDateCampaign").val() == "") {
        return false;
    }
    if($("#endDateCampaign").val() == "") {
        return false;
    }
    return true;
  }

function handleInsert(){
    var campaignData = getCampaignModel();
    var isValidData = isValid();   
    if (isValidData == false){
        alert("Sorry, some fields are empty!");
        return false;
    }

    $.when(sendCampaignData(campaignData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
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
 
    var campaignData = getCampaignModel();
    var isValidData = isValid();   
    if (isValidData == false){
        alert("Sorry, some fields are empty!");
        return false;
    }

    $.when(updateCampaignData(campaignData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
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
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
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