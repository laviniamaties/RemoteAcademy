$(document).ready(function(){
    populateBanks();
});

function registerButtonEventsBankDelete(){
    $("#deleteBankButton").on("click", function(){
        handleDelete();
    });
}

function populateBanks(){
    var spanToPopulate = $("#listOfBanks");

    $.when(getBanks()).then(function(data){
        data.forEach(function(item){
       
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
            }
            InsertRowCellBanks(item);
        });
    }).fail(function() {
        alert("Something goes wrong!");
    });
}

function getBanks(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/BloodBank/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}

//delete
function handleDelete() {
 
    var id = $("#idBank").val();
    var bankData = {
        ID : id
    }

    $.when(deleteBankData(bankData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
    });

}

function deleteBankData(data){
    var Id = $("#idBank").val();
    let promise = $.ajax({
        type:'POST',
        url:"https://localhost:44331/api/BloodBank/DeleteById?ID=" + Id,
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
    });
    return promise;
}




