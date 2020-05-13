$(document).ready(function(){
    populateBloodTypes();
});

function registerButtonEventsDonor() {
    $("#addDonorButton").on("click", function(){
       handleInsert();
    });
    $("#updateDonorButton").on("click", function(){
        handleUpdate();
    });
    $("#deleteDonorButton").on("click", function(){
        handleDelete();
    });
}

function populateBloodTypes(){
    var spanToPopulate = $("#listOfBloodTyes");
    $.when(getBloodTypes()).then(function(data){
        data.forEach(function(item){
           for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
            }
            InsertRowCell(item.ID,item.Type);
        });
    }).fail(function() {
        alert("Something goes wrong!");
    });   
}

function InsertRowCell(id, type ){
    var tr = $('<tr/>');
    var listTypes = {
        ID : tr.append("<td>" + id + "</td>" ),
        Type: tr.append("<td>" + type + "</td>")
    }
    $('tbody').append(listTypes);

    var table = document.getElementById("bloodTypesList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell = newRow.insertCell(0);
    cell.innerHTML = id;
    cell = newRow.insertCell(1);
    cell.innerHTML = type;
    cell = newRow.insertCell(2);
    cell.innerHTML = `<a onClick="onSelect(this.ID, this.Type)">Select</a>`;
}

//function onSelect(id, type){} 

function getBloodTypes(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/BloodType/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}

function GetDonorModel(){

    return {
        ID : $("#idDonor").val(),
        Sex :  $("#sexDonor").val(), 
        Type : $("#typeDonor").val(), 
        FirstName : $("#firstNameDonor").val(), 
        LastName :  $("#lastNameDonor").val(), 
        Address : $("#addressDonor").val(),
        City : $("#cityDonor").val(),
        Country : $("#countryDonor").val(),
        PhoneNumber:  $("#phoneDonor").val(),
        EmailAddress:  $("#emailDonor").val(),
        Birthday: $("#birthdayDonor").val(),
        BloodTypeID: $("#bloodTypeId").val()
    }
}

function isValid(){

    if($("#idDonor").val() == "") {
      return false;
    }
    if($("#sexDonor").val() == "") {
        return false;
    }
      if($("#typeDonor").val() == "") {
        return false;
    }
    if($("#firstNameDonor").val() == "") {
        return false;
    }
    if($("#lastNameDonor").val() == "") {
        return false;
    }
    if($("#addressDonor").val() == "") {
        return false;
    }
    if($("#cityDonor").val() == "") {
        return false;
    }
    if($("#countryDonor").val() == "") {
        return false;
    }
    if($("#phoneDonor").val() == "") {
        return false;
    }
    if($("#emailDonor").val() == "") {
        return false;
    }
    if($("#birthdayDonor").val() == "") {
        return false;
    }
    if($("#bloodTypeId").val() == "") {
        return false;
    }
    return true;
  }

function handleInsert(){

    var donorData = GetDonorModel();
    var isValidData = isValid();   
    if (isValidData == false){
        alert("Sorry, some fields are empty!");
        return false;
    }

    $.when(sendDonorData(donorData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
    });

}
//insert
function sendDonorData(data){
    let promise = $.ajax({
        type:'POST',
        url:'https://localhost:44331/api/Donor/Insert',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
    });
    return promise;
}
//update
function handleUpdate() {
 
    var donorData = GetDonorModel();
    var isValidData = isValid();   
    if (isValidData == false){
        alert("Sorry, some fields are empty!");
        return false;
    }

    $.when(updateDonorData(donorData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
    });

}

function updateDonorData(data){
    let promise = $.ajax({
        type:'PUT',
        url:'https://localhost:44331/api/Donor/Update',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: JSON.stringify(data)
    });
    return promise;
}

//delete
function handleDelete() {
 
    var id = $("#idDonor").val();
    var donorData = {
        ID : id
    }

    $.when(deleteDonorData(donorData)).then(function(){
        alert("Successfully");
        location.reload();
    }).fail(function(){
        alert("Something goes wrong!");
    });
}

function deleteDonorData(data){
    var Id = $("#idDonor").val();
    let promise = $.ajax({
        type:'POST',
        url:"https://localhost:44331/api/Donor/DeleteById?ID=" + Id,
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
    });
    return promise;
}
