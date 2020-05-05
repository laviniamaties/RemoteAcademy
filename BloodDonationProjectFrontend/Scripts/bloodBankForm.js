
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

    $("#viewBankButton").on("click", function(){
        loadViewAllBanksPage();
    });
    $("#insert").on("click", function(){
        loadCRUDBanksPage();
    });
    $("#update").on("click", function(){
        loadCRUDBanksPage();
    });
    $("#delete").on("click", function(){
        loadCRUDBanksPage();
    });
}

function loadCRUDBanksPage(){
    window.location.href= 'http://localhost:8484/crudBloodBank.html';
}
function loadViewAllBanksPage(){
    window.location.href= 'http://localhost:8484/viewBloodBank.html';
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