
window.onload = function(){
    registerEventsPage();
}

function registerEventsPage(){
    $("#home").on("click", function(){
        loadHomePage();
    });
    $("#donors").on("click", function(){
        loadDonorsPage();
    });
    $("#points").on("click", function(){
        loadPointPage();
    });
    $("#campaigns").on("click", function(){
        loadCampaignsPage();
    });
    $("#banks").on("click", function(){
        loadBanksPage();
    });

    $("#get").on("click", function(){
        loadCRUDCampaignsPage();
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
}

function loadCRUDCampaignsPage(){
    window.location.href= 'http://localhost:8484/crudCampaign.html';
}
function loadCampaignsPage(){
    window.location.href= 'http://localhost:8484/campaign.html';
}

function loadHomePage(){
    window.location.href= 'http://localhost:8484/index.html';
}

function loadPointPage(){
    window.location.href = 'http://localhost:8484/collectionPoint.html';
}

function loadDonorsPage(){
    window.location.href = 'http://localhost:8484/donor.html';
}
function loadBanksPage(){
    window.location.href = 'http://localhost:8484/bloodBank.html';
}