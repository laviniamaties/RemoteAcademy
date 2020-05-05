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
 
    var id = $("#idPoint").val();
    var name = $("#namePoint").val();
    var addresse = $("#addressPoint").val();
    var city = $("#cityPoint").val();
    var country = $("#countryPoint").val();
    var email = $("#emailPoint").val();
    var phone = $("#phonePoint").val();
    var idBankPoint = $("#idBankPoint").val();

    var pointData = {
        ID : id,
        Name : name, 
        Addresse : addresse,
        City : city,
        Country : country,
        PhoneNumber: phone,
        EmailAddresse: email,
        BloodBankID: idBankPoint
    }

    $.when(updatePointData(pointData)).then(function(){
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
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
        alert("yey");
        location.reload();
    }).fail(function(){
        alert("no :(");
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