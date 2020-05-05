
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
        loadCRUDDonorsPage();
    });
    $("#insert").on("click", function(){
        loadCRUDDonorsPage();
    });
    $("#update").on("click", function(){
        loadCRUDDonorsPage();
    });
    $("#delete").on("click", function(){
        loadCRUDDonorsPage();
    });
}

function loadCRUDDonorsPage(){
    window.location.href= 'http://localhost:8484/crudDonor.html';
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