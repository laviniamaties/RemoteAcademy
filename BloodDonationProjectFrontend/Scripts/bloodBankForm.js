window.onload = function(){
    registerPageEvents();
}

function registerPageEvents(){
    $("#home").on("click", function(){
        window.location.href= 'http://localhost:8484/index.html';
    });
    $("#banks").on("click", function(){
        window.location.href = 'http://localhost:8484/bloodBank.html';
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