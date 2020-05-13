$(document).ready(function(){
    populateDonors();
});

function populateDonors(){
    var spanToPopulate = $("#listOfDonors");

    $.when(getDonors()).then(function(data){
        data.forEach(function(item){
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
            }
            InsertRowCellDonors(item);
        });
    }).fail(function() {
        alert("Something goes wrong!");
    });
    
}

function getDonors(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/Donor/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}





