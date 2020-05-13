window.onload = function(){
    registerEventsPage();
}

function registerEventsPage(){
    $("#home").on("click", function(){
        window.location.href= 'http://localhost:8484/index.html';
    });
    $("#donors").on("click", function(){
        window.location.href = 'http://localhost:8484/donor.html';
    });
    $("#points").on("click", function(){
        window.location.href = 'http://localhost:8484/collectionPoint.html';
    });
    $("#campaigns").on("click", function(){
        window.location.href= 'http://localhost:8484/campaign.html';
    });
    $("#banks").on("click", function(){
        window.location.href = 'http://localhost:8484/bloodBank.html';
    });

    $("#get").on("click", function(){
        window.location.href= 'http://localhost:8484/showActiveCampaigns.html';
    });
    $("#insert").on("click", function(){
        loadCRUDCampaignsPage();
    });
    $("#update").on("click", function(){
        loadCRUDCampaignsPage();
    });
    $("#delete").on("click", function(){
        loadCRUDCampaignsPage();
    });
    $("#choosePoint").on("click", function(){
        window.location.href= 'http://localhost:8484/choosePoints.html';
    });
}

function loadCRUDCampaignsPage(){
    window.location.href= 'http://localhost:8484/crudCampaign.html';
}