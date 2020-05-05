function onFormSubmit() {
    $("#addBankButton").on("click", function(){
        handleInsert();
    });
    $("#updateBankButton").on("click", function(){
        handleUpdate();
    });
}
function onFormDelete(){
    $("#deleteBankButton").on("click", function(){
        handleDelete();
    });
}

function handleInsert(){
    var id = $("#idBank").val();
    var name = $("#nameBank").val();
    var address = $("#addressBank").val();
    var city = $("#cityBank").val();
    var country = $("#countryBank").val();
    var phone = $("#phoneBank").val();
    var email = $("#emailBank").val();

    var bankData = {
        ID : id,
        Name : name, 
        Addresse : address,
        City : city,
        Country : country, 
        PhoneNumber : phone, 
        EmailAddresse : email
    }

    $.when(sendBanksData(bankData)).then(function(){
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
    });

}

function sendBanksData(data){
    let promise = $.ajax({
        type:'POST',
        url:'https://localhost:44331/api/BloodBank/Insert',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
    });
    return promise;
}

function handleUpdate() {
 
    var id = $("#idBank").val();
    var name = $("#nameBank").val();
    var address = $("#addressBank").val();
    var city = $("#cityBank").val();
    var country = $("#countryBank").val();
    var phone = $("#phoneBank").val();
    var email = $("#emailBank").val();

    var bankData = {
        ID : id,
        Name : name, 
        Addresse : address,
        City : city,
        Country : country, 
        PhoneNumber : phone, 
        EmailAddresse : email
    }
    $.when(updateBankData(bankData)).then(function(){
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
    });

}

function updateBankData(data){
    let promise = $.ajax({
        type:'PUT',
        url:'https://localhost:44331/api/BloodBank/Update',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
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
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
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