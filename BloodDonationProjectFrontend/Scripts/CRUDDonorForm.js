$(document).ready(function(){
    populateDonors();
});

function populateDonors(){
    var spanToPopulate = $("#listOfDonors");

    $.when(getDonors()).then(function(data){
        data.forEach(function(item){
       
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
                tr = $('<tr/>');
                tr.append("<td>" + item[i].ID + "</td>" );
                tr.append("<td>" + item[i].Sex + "</td>");
                tr.append("<td>" + item[i].Type + "</td>");
                tr.append("<td>" + item[i].FirstName + "</td>");
                tr.append("<td>" + item[i].LastName + "</td>");
                tr.append("<td>" + item[i].Address + "</td>");
                tr.append("<td>" + item[i].City + "</td>");
                tr.append("<td>" + item[i].Country + "</td>");
                tr.append("<td>" + item[i].PhoneNumber + "</td>");
                tr.append("<td>" + item[i].EmailAddress + "</td>");
                tr.append("<td>" + item[i].Birthday + "</td>");
                tr.append("<td>" + item[i].BloodTypeID + "</td>");
                $('tbody').append(tr);
            }
            insertNewRecord(item);
        });
    }).fail(function() {
        alert("ceva naspa");
    });
    
}

function getDonors(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/Donor/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
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

function insertNewRecord(data) {
    var table = document.getElementById("donorsList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell1 = newRow.insertCell(0);
    cell1.innerHTML = data.ID;
    cell2 = newRow.insertCell(1);
    cell2.innerHTML = data.Sex;
    cell3 = newRow.insertCell(2);
    cell3.innerHTML = data.Type;
    cell4 = newRow.insertCell(3);
    cell4.innerHTML = data.FirstName;
    cell5= newRow.insertCell(4);
    cell5.innerHTML = data.LastName;
    cell6 = newRow.insertCell(5);
    cell6.innerHTML = data.Address;
    cell7 = newRow.insertCell(6);
    cell7.innerHTML = data.City;
    cell8 = newRow.insertCell(7);
    cell8.innerHTML = data.Country;
    cell9 = newRow.insertCell(8);
    cell9.innerHTML = data.PhoneNumber;
    cell10 = newRow.insertCell(9);
    cell10.innerHTML = data.EmailAddress;

    cell11 = newRow.insertCell(10);
    cell11.innerHTML = data.Birthday;
    cell12 = newRow.insertCell(11);
    cell12.innerHTML = data.BloodTypeID;

    cell12 = newRow.insertCell(12);
    cell12.innerHTML = `<a onClick="onEdit(this)">Edit</a>
                       <a onClick="onDelete(this)">Delete</a>`;
}

