function onFormSubmitDonor() {
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
 
    var id = $("#idDonor").val();
    var sex = $("#sexDonor").val();
    var type = $("#typeDonor").val();
    var firstName = $("#firstNameDonor").val();
    var lastName = $("#lastNameDonor").val();
    var addresse = $("#addressDonor").val();
    var city = $("#cityDonor").val();
    var country = $("#countryDonor").val();
    var email = $("#emailDonor").val();
    var phone = $("#phoneDonor").val();
    var birthday = $("#birthdayDonor").val();
    var idBloodType = $("#bloodTypeId").val();

    var donorData = {
        ID : id,
        Sex : sex, 
        Type : type, 
        FirstName : firstName, 
        LastName : lastName, 
        Address : addresse,
        City : city,
        Country : country,
        PhoneNumber: phone,
        EmailAddress: email,
        Birthday: birthday,
        BloodTypeID: idBloodType
    }

    $.when(updateDonorData(donorData)).then(function(){
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
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
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
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