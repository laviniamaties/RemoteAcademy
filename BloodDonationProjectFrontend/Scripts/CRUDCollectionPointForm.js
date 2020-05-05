$(document).ready(function(){
    populatePoints();
});

function populatePoints(){
    var spanToPopulate = $("#listOfPoints");

    $.when(getPoints()).then(function(data){
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
                tr.append("<td>" + item[i].BloodBankID + "</td>");
                $('tbody').append(tr);
            }
            insertNewRecord(item);
        });
    }).fail(function() {
        alert("ceva naspa");
    });
    
}

function getPoints(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/CollectionPoint/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}

function insertNewRecord(data) {
    var table = document.getElementById("pointsList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell1 = newRow.insertCell(0);
    cell1.innerHTML = data.ID;
    cell2 = newRow.insertCell(1);
    cell2.innerHTML = data.Name;
    cell3 = newRow.insertCell(2);
    cell3.innerHTML = data.Addresse;
    cell4 = newRow.insertCell(3);
    cell4.innerHTML = data.City;
    cell5 = newRow.insertCell(4);
    cell5.innerHTML = data.Country;
    cell6 = newRow.insertCell(5);
    cell6.innerHTML = data.PhoneNumber;
    cell7 = newRow.insertCell(6);
    cell7.innerHTML = data.EmailAddresse;

    cell8 = newRow.insertCell(7);
    cell8.innerHTML = data.BloodBankID;

    cell8 = newRow.insertCell(8);
    cell8.innerHTML = `<a onClick="onEdit(this)">Edit</a>
                       <a onClick="onDelete(this)">Delete</a>`;
}

