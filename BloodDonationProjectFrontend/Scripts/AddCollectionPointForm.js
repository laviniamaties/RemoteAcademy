function onFormSubmitPoint() {
    $("#addPointButton").on("click", function(){
       handleInsert();
    });
    $("#updatePointButton").on("click", function(){
        handleUpdate();
    });
    $("#deletePointButton").on("click", function(){
        handleDelete();
    });
}

function GetPointModel(){
    return {
        ID : $("#idPoint").val(),
        Name : $("#namePoint").val(), 
        Addresse : $("#addressPoint").val(),
        City : $("#cityPoint").val(),
        Country : $("#countryPoint").val(),
        PhoneNumber: $("#phonePoint").val(),
        EmailAddresse: $("#emailPoint").val(),
        BloodBankID: $("#idBankPoint").val()
    }
}

function isValid(){

    if($("#idPoint").val() == "") {
      return false;
    }
    if($("#namePoint").val() == "") {
        return false;
    }
      if($("#addressPoint").val() == "") {
        return false;
    }
    if($("#cityPoint").val() == "") {
        return false;
    }
    if($("#countryPoint").val() == "") {
        return false;
    }
    if($("#phonePoint").val() == "") {
        return false;
    }
    if($("#emailPoint").val() == "") {
        return false;
    }
    if($("#idBankPoint").val() == "") {
        return false;
    }
    return true;
  }

function handleInsert(){

    var pointData = GetPointModel();
    var isValidData = isValid();   
    if (isValidData == false){
        alert("Sorry, some fields are empty!");
        return false;
    }

    $.when(sendPointData(pointData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
    });

}
//insert
function sendPointData(data){
    let promise = $.ajax({
        type:'POST',
        url:'https://localhost:44331/api/CollectionPoint/Insert',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
    });
    return promise;
}
//update
function handleUpdate() {
 
    var pointData = GetPointModel();
    var isValidData = isValid();   
    if (isValidData == false){
        alert("Sorry, some fields are empty!");
        return false;
    }

    $.when(updatePointData(pointData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
    });
}

function updatePointData(data){
    let promise = $.ajax({
        type:'PUT',
        url:'https://localhost:44331/api/CollectionPoint/Update',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
    });
    return promise;

}

//delete
function handleDelete() {
 
    var id = $("#idPoint").val();

    var pointData = {
        ID : id
    }

    $.when(deletePointData(pointData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
    });

}

function deletePointData(data){
    var Id = $("#idPoint").val();
    let promise = $.ajax({
        type:'POST',
        url:"https://localhost:44331/api/CollectionPoint/DeleteById?ID=" + Id,
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
    });
    return promise;

}