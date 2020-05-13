window.onload = function(){
    registerEventsPage();
}

function _executeGetCall(){
    this._donorService.SetUrl('Donor/ReadAll')
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
        loadViewDonorsPage();
        _executeGetCall.call(this);
    });
    $("#showDonorButton").on("click", function(){
        loadShowDonorsPage();
    });
    $("#showPacientButton").on("click", function(){
        loadShowPacientsPage();
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
    $("#choosePoint").on("click", function(){
        window.location.href= 'http://localhost:8484/showDonorPoint.html';
    })
}

function loadCRUDDonorsPage(){
    window.location.href= 'http://localhost:8484/crudDonor.html';
}
function loadViewDonorsPage(){
    window.location.href= 'http://localhost:8484/viewDonor.html';
}
function loadShowDonorsPage(){
    window.location.href= 'http://localhost:8484/viewDonorsPage.html';
}
function loadShowPacientsPage(){
    window.location.href= 'http://localhost:8484/viewPacientsPage.html';
}