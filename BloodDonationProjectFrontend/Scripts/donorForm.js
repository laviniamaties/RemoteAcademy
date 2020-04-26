
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
function readFormData() {
    var formData = {};
    formData["sex"] = document.getElementById("sex").value;
    formData["type"] = document.getElementById("type").value;
    formData["firstName"] = document.getElementById("firstName").value;
    formData["lastName"] = document.getElementById("lastName").value;
    formData["address"] = document.getElementById("address").value;
    formData["city"] = document.getElementById("city").value;
    formData["country"] = document.getElementById("country").value;
    formData["phone"] = document.getElementById("phone").value;
    formData["email"] = document.getElementById("email").value;
    formData["bloodType"] = document.getElementById("bloodType").value;
    return formData;
}
function insertNewRecord(data) {
    var table = document.getElementById("donorsList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);

    cell1 = newRow.insertCell(0);
    cell1.innerHTML = data.sex;

    cell2 = newRow.insertCell(1);
    cell2.innerHTML = data.type;

    cell3 = newRow.insertCell(2);
    cell3.innerHTML = data.fisrtName;

    cell4= newRow.insertCell(3);
    cell4.innerHTML = data.lastName;


    cell5 = newRow.insertCell(4);
    cell5.innerHTML = data.address;

    cell6 = newRow.insertCell(5);
    cell6.innerHTML = data.city;

    cell7 = newRow.insertCell(6);
    cell7.innerHTML = data.country;

    cell8 = newRow.insertCell(7);
    cell8.innerHTML = data.phone;

    cell9 = newRow.insertCell(8);
    cell9.innerHTML = data.email;

    cell10 = newRow.insertCell(9);
    cell10.innerHTML = data.bloodType;

    cell10 = newRow.insertCell(10);
    cell10.innerHTML = `<a onClick="onEdit(this)">Edit</a>
                       <a onClick="onDelete(this)">Delete</a>`;
}

function resetForm() {
    document.getElementById("sex").value = "";
    document.getElementById("type").value = "";
    document.getElementById("firstName").value = "";
    document.getElementById("lastName").value = "";
    document.getElementById("address").value = "";
    document.getElementById("city").value = "";
    document.getElementById("country").value = "";
    document.getElementById("phone").value = "";
    document.getElementById("email").value = "";
    document.getElementById("bloodType").value = "";
    selectedRow = null;
}

function onEdit(td) {
    selectedRow = td.parentElement.parentElement;
    document.getElementById("sex").value = selectedRow.cells[0].innerHTML;
    document.getElementById("type").value = selectedRow.cells[1].innerHTML;
    document.getElementById("firstName").value = selectedRow.cells[2].innerHTML;
    document.getElementById("lastName").value = selectedRow.cells[3].innerHTML;
    document.getElementById("address").value = selectedRow.cells[4].innerHTML;
    document.getElementById("city").value = selectedRow.cells[5].innerHTML;
    document.getElementById("country").value = selectedRow.cells[6].innerHTML;
    document.getElementById("phone").value = selectedRow.cells[7].innerHTML;
    document.getElementById("email").value = selectedRow.cells[8].innerHTML;
    document.getElementById("bloodType").value = selectedRow.cells[9].innerHTML;
}
function updateRecord(formData) {
    selectedRow.cells[0].innerHTML = formData.sex;
    selectedRow.cells[1].innerHTML = formData.type;
    selectedRow.cells[2].innerHTML = formData.firstName;
    selectedRow.cells[3].innerHTML = formData.lastName;
    selectedRow.cells[4].innerHTML = formData.address;
    selectedRow.cells[5].innerHTML = formData.city;
    selectedRow.cells[6].innerHTML = formData.country;
    selectedRow.cells[7].innerHTML = formData.phone;
    selectedRow.cells[8].innerHTML = formData.email;
    selectedRow.cells[9].innerHTML = formData.bloodType;

}

function onDelete(td) {
    if (confirm('Are you sure to delete this record ?')) {
        row = td.parentElement.parentElement;
        document.getElementById("donorsList").deleteRow(row.rowIndex);
        resetForm();
    }
}
function validate() {
    isValid = true;
    if (document.getElementById("firstName").value == "") {
        isValid = false;
        document.getElementById("fisrtNameValidationError").classList.remove("hide");
    } else {
        isValid = true;
        if (!document.getElementById("fisrtNameValidationError").classList.contains("hide"))
            document.getElementById("fisrtNameValidationError").classList.add("hide");
    }
    return isValid;
}
