var selectedRow = null

function onFormSubmit() {
    //insertNewRecord(formData);
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
function insertNewRecord(data) {
    var table = document.getElementById("campaignList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell1 = newRow.insertCell(0);
    cell1.innerHTML = data.name;
    cell2 = newRow.insertCell(1);
    cell2.innerHTML = data.description;
    cell3 = newRow.insertCell(2);
    cell3.innerHTML = data.startDate;
    cell4 = newRow.insertCell(3);
    cell4.innerHTML = data.endDate;
    cell4 = newRow.insertCell(4);
    cell4.innerHTML = `<a onClick="onEdit(this)">Edit</a>
                       <a onClick="onDelete(this)">Delete</a>`;
}

function resetForm() {
    document.getElementById("name").value = "";
    document.getElementById("description").value = "";
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";
    selectedRow = null;
}

function onEdit(td) {
    selectedRow = td.parentElement.parentElement;
    document.getElementById("name").value = selectedRow.cells[0].innerHTML;
    document.getElementById("description").value = selectedRow.cells[1].innerHTML;
    document.getElementById("startDate").value = selectedRow.cells[2].innerHTML;
    document.getElementById("endDate").value = selectedRow.cells[3].innerHTML;
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
}
