$(document).ready(function(){
    populatePoints();
});

function populatePoints(){
    var spanToPopulate = $("#listOfPoints");

    $.when(getPoints()).then(function(data){
        data.forEach(function(item){
       
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
            }
            InsertRowCellPoints(item);
        });
    }).fail(function() {
        alert("Something goes wrong!");
    });
}

function getPoints(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/CollectionPoint/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}


