$(document).ready(function(){
    populateDonorPoints();
});

function registerButtonEventsChooseDonorPoint(){
    $("#addDonorPoint").on("click", function(){
        handleInsert();
     });
}

function populateDonorPoints(){
    var spanToPopulate = $("#listOfPointsDonor");

    $.when(getDonorPoints()).then(function(data){
        data.forEach(function(item){
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
            }
            InsertRowCellDonorPoints(item);
        });
    }).fail(function() {
        alert("Something goes wrong!");
    });
    
}

function getDonorPoints(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/ViewDonorPoint/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}

function GetRegisterModelDonorPoint(){

    return {
        DonorID : $("#idDonorRegister").val(),
        CollectionPointID :  $("#idPointRegister").val()
    }
}

function handleInsert(){

    var registerData = GetRegisterModelDonorPoint();

    $.when(sendRegisterDataDonorPoint(registerData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
    });

}
//insert
function sendRegisterDataDonorPoint(data){
    let promise = $.ajax({
        type:'POST',
        url:'https://localhost:44331/api/Register/Insert',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
    });
    return promise;
}