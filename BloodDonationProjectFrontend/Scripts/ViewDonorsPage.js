$(document).ready(function(){
    populateAllDonors();
});

function populateAllDonors(){
    var spanToPopulate = $("#listOfDonors");
    $.when(showDonors()).then(function(data){
        data.forEach(function(item){
       
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
            }
            InsertRowCellDonors(item);
        });
    }).fail(function() {
        alert("smth wrong with database :(");
    });
    
}

function showDonors(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/Donor/ReadAllDonors',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}



