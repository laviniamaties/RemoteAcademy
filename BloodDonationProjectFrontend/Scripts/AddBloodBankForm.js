
function registerButtonEventsBank() {
    $("#addBankButton").on("click", function(){
        handleInsert();
    });
    $("#updateBankButton").on("click", function(){
        handleUpdate();
    });
}

function getBankModel(){
    return {

        ID : $("#idBank").val(),
        Name : $("#nameBank").val(),
        Addresse : $("#addressBank").val(),
        City : $("#cityBank").val(),
        Country : $("#countryBank").val(),
        PhoneNumber : $("#phoneBank").val(),
        EmailAddresse : $("#emailBank").val()
    }
}

function isValid(){

    if($("#nameBank").val() == "") {
        return false;
    }
      if($("#address").val() == "") {
        return false;
    }
    if($("#city").val() == "") {
        return false;
    }
    if($("#country").val() == "") {
        return false;
    }
    if($("#phoneBank").val() == "") {
        return false;
    }
    if($("#emailBank").val() == "") {
        return false;
    }
    return true;
  }

function handleInsert(){
    var bankData = getBankModel();
    var isValidData = isValid();
    if (isValidData == false){
        alert("Sorry, some fields are empty!");
        return false;
    }
    
    $.when(sendBanksData(bankData)).then(function(){
        alert("Successfully!");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
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
 
    var bankData = getBankModel();
    var bankData = getBankModel();
    var isValidData = isValid();
    if (isValidData == false){
        alert("Sorry, some fields are empty!");
        return false;
    }    

    $.when(updateBankData(bankData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
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

