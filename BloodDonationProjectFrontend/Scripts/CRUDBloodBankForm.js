$(document).ready(function(){
    populateBanks();
});

function populateBanks(){
    var spanToPopulate = $("#listOfBanks");

    $.when(getBanks()).then(function(data){
        data.forEach(function(item){
       
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
                tr = $('<tr/>');
                tr.append("<td>" + item[i].ID + "</td>");
                tr.append("<td>" + item[i].Name + "</td>");
                tr.append("<td>" + item[i].Addresse + "</td>");
                tr.append("<td>" + item[i].City + "</td>");
                tr.append("<td>" + item[i].Country + "</td>");
                tr.append("<td>" + item[i].PhoneNumber + "</td>");
                tr.append("<td>" + item[i].EmailAddresse + "</td>");
                $('tbody').append(tr);
            }
            insertNewRecord(item);
        });
    }).fail(function() {
        alert("ceva naspa");
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

function insertNewRecord(list) {
    var table = document.getElementById("bankList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell1 = newRow.insertCell(0);
    cell1.innerHTML = list.ID;
    cell2 = newRow.insertCell(1);
    cell2.innerHTML = list.Name;
    cell3 = newRow.insertCell(2);
    cell3.innerHTML = list.Addresse;
    cell4 = newRow.insertCell(3);
    cell4.innerHTML = list.City;
    cell5 = newRow.insertCell(4);
    cell5.innerHTML = list.Country;
    cell6 = newRow.insertCell(5);
    cell6.innerHTML = list.PhoneNumber;
    cell7 = newRow.insertCell(6);
    cell7.innerHTML = list.EmailAddresse;
    cell7 = newRow.insertCell(7);
    cell7.innerHTML = `<a onClick="onEdit(this)">Edit</a>
                       <a onClick="onDelete(this)">Delete</a>`;
                       
}
/*function readFormData() {
    var formData = {};
    formData["name"] = document.getElementById("name").value;
    formData["address"] = document.getElementById("address").value;
    formData["city"] = document.getElementById("city").value;
    formData["country"] = document.getElementById("country").value;
    formData["phone"] = document.getElementById("phone").value;
    formData["email"] = document.getElementById("email").value;
    return formData;
}
var selectedRow = null

function onFormSubmit() {
    if (validate()) {
        var formData = readFormData();
        if (selectedRow == null)
            insertNewRecord(formData);
        else
            updateRecord(formData);
        resetForm();
    }
}

function resetForm() {
    document.getElementById("name").value = "";
    document.getElementById("address").value = "";
    document.getElementById("city").value = "";
    document.getElementById("country").value = "";
    document.getElementById("phone").value = "";
    document.getElementById("email").value = "";
    selectedRow = null;
}

function onEdit(td) {
    selectedRow = td.parentElement.parentElement;
    document.getElementById("name").value = selectedRow.cells[0].innerHTML;
    document.getElementById("address").value = selectedRow.cells[1].innerHTML;
    document.getElementById("city").value = selectedRow.cells[2].innerHTML;
    document.getElementById("country").value = selectedRow.cells[3].innerHTML;
    document.getElementById("phone").value = selectedRow.cells[4].innerHTML;
    document.getElementById("email").value = selectedRow.cells[5].innerHTML;
}
function updateRecord(formData) {
    selectedRow.cells[0].innerHTML = formData.name;
    selectedRow.cells[1].innerHTML = formData.address;
    selectedRow.cells[2].innerHTML = formData.city;
    selectedRow.cells[3].innerHTML = formData.country;
    selectedRow.cells[4].innerHTML = formData.phone;
    selectedRow.cells[5].innerHTML = formData.email;

}

function onDelete(td) {

    if (confirm('Are you sure to delete this record ?')) {
        var row = $(this).parents('td:first');
        //row = td.parentElement.parentElement;
        //row = td.text(JSON.ID);
       //document.getElementById("bankList").deleteRow(row.rowIndex);
        //resetForm();
        //document.getElementById("bankList").deleteBank(row.rowIndex);

        $.when(deleteBank(row)).then(function(){
            alert("yey");
            $(row).remove();
            location.reload();
        }).fail(function(){
            alert("no :(");
        });
    }
}

function deleteBank(data){
    let promise = $.ajax({
        type:'DELETE',
        url:'https://localhost:44331/api/BloodBank/DeleteById',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json',
        data: Object.keys("ID")
    });
    return promise;

}
function validate() {
    isValid = true;
    if (document.getElementById("name").value == "") {
        isValid = false;
        document.getElementById("nameValidationError").classList.remove("hide");
    } else {
        isValid = true;
        if (!document.getElementById("nameValidationError").classList.contains("hide"))
            document.getElementById("nameValidationError").classList.add("hide");
    }
    return isValid;
}*/




