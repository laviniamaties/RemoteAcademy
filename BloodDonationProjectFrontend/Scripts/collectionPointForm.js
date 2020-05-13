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
        loadCRUDPointsPage();
    });
    $("#insert").on("click", function(){
        loadCRUDPointsPage();
    });
    $("#update").on("click", function(){
        loadCRUDPointsPage();
    });
    $("#delete").on("click", function(){
        loadCRUDPointsPage();
    });
}

function loadCRUDPointsPage(){
    window.location.href= 'http://localhost:8484/crudCollectionPoint.html';
}