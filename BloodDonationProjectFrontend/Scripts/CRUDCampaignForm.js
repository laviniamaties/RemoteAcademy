$(document).ready(function(){
    populateCampaigns();
});

function populateCampaigns(){
    var spanToPopulate = $("#listOfCampaigns");

    $.when(getCampaigns()).then(function(data){
        data.forEach(function(item){
       
            for (var i = 0; i < item.length; i++) {
                spanToPopulate.text(JSON.stringify(item));
                tr = $('<tr/>');
                tr.append("<td>" + item[i].ID + "</td>");
                tr.append("<td>" + item[i].Name + "</td>");
                tr.append("<td>" + item[i].Description + "</td>");
                tr.append("<td>" + item[i].StartDate + "</td>");
                tr.append("<td>" + item[i].EndDate + "</td>");
                $('tbody').append(tr);
            }
            insertNewRecord(item);
        });
    }).fail(function() {
        alert("ceva naspa");
    });
    
}

function getCampaigns(){
    let promise = $.ajax({
        type:'GET',
        url:'https://localhost:44331/api/Campaign/ReadAll',
        contentType: 'application/json',
        dataType: 'json',
        accept: 'application/json'
    });
    return promise;
}

function insertNewRecord(data) {
    var table = document.getElementById("campaignList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell1 = newRow.insertCell(0);
    cell1.innerHTML = data.ID;

    cell2 = newRow.insertCell(1);
    cell2.innerHTML = data.Name;
    cell3 = newRow.insertCell(2);
    cell3.innerHTML = data.Description;
    cell4 = newRow.insertCell(3);
    cell4.innerHTML = data.StartDate;
    cell5 = newRow.insertCell(4);
    cell5.innerHTML = data.EndDate;
    cell5 = newRow.insertCell(5);
    cell5.innerHTML = `<a onClick="getData(this)">Edit</a>
                        <a onClick="onDelete(this)">Delete</a>`;
}


/*var selectedRow = null

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
function readFormData() {
    var formData = {};
    formData["name"] = document.getElementById("name").value;
    formData["description"] = document.getElementById("description").value;
    formData["startDate"] = document.getElementById("startDate").value;
    formData["endDate"] = document.getElementById("endDate").value;
    return formData;
}

function resetForm() {
    document.getElementById("name").value = "";
    document.getElementById("description").value = "";
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";
    selectedRow = null;
}

function getData(td){
    selectedRow = td.parentElement.parentElement;

    var id = selectedRow.cells[0].innerHTML;
    var name = selectedRow.cells[1].innerHTML;
    var description = selectedRow.cells[2].innerHTML;
    var startDate = selectedRow.cells[3].innerHTML;
    var endDate = selectedRow.cells[4].innerHTML;

    $("#idCampaign").append(id).show();
    $("#nameCampaign").append(name).show();
    $("#descriptionCampaign").append(description).show();
    $("#startDateCampaign").append(startDate).show();
    $("#endDateCampaign").append(endDate).show();
}

function updateRecord(formData) {
    selectedRow.cells[0].innerHTML = formData.name;
    selectedRow.cells[1].innerHTML = formData.description;
    selectedRow.cells[2].innerHTML = formData.startDate;
    selectedRow.cells[3].innerHTML = formData.endDate;
   
}

function onDelete(td) {
    if (confirm('Are you sure to delete this record ?')) {
        row = td.parentElement.parentElement;
        document.getElementById("campaignList").deleteRow(row.rowIndex);
        resetForm();
    }
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
