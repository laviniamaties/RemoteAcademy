/*window.onload = function(){
    buildForm();
}

function buildForm(){
    var bodyElement = document.body;
    var formElement = document.createElement('form');
        
    formElement.append(getViewButton(), 
      getAddButton(), getUpdateButton(), getDeleteButton());
    bodyElement.appendChild(formElement);
}

function setTitlePage(title){
    var divElement = document.createElement('div');
    var padElement = document.createElement('h1');
    padElement.innerText = title;
    divElement.appendChild(padElement);
    return divElement;
}

function getUpdateButton(){
    var button = document.createElement('input');
    button.setAttribute('type', 'button');
    button.setAttribute('value', 'Update');
    button.setAttribute('style', 'color: red');

    button.onclick = function (){
        alert("Update ok");
    }
    return button;
}
function getDeleteButton(){
    var button = document.createElement('input');
    button.setAttribute('type', 'button');
    button.setAttribute('value', 'Delete');
    button.setAttribute('style', 'color: red');

    button.onclick = function (){
        alert("Delete ok");
    }
    return button;
}
function getAddButton(){
    var button = document.createElement('input');
    button.setAttribute('type', 'button');
    button.setAttribute('value', 'Add');
    button.setAttribute('style', 'color: red');

    button.onclick = function (){
        alert("Add  ok");
    }
    return button;
}
function getViewButton(){
    var button = document.createElement('input');
    button.setAttribute('type', 'button');
    button.setAttribute('value', 'View');
    button.setAttribute('style', 'color: red');

    button.onclick = function (){
        alert("Add  ok");
    }
    return button;
}*/

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
    formData["name"] = document.getElementById("name").value;
    formData["address"] = document.getElementById("address").value;
    formData["city"] = document.getElementById("city").value;
    formData["country"] = document.getElementById("country").value;
    formData["phone"] = document.getElementById("phone").value;
    formData["email"] = document.getElementById("email").value;
    return formData;
}
function insertNewRecord(data) {
    var table = document.getElementById("bankList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell1 = newRow.insertCell(0);
    cell1.innerHTML = data.name;
    cell2 = newRow.insertCell(1);
    cell2.innerHTML = data.address;
    cell3 = newRow.insertCell(2);
    cell3.innerHTML = data.city;
    cell4 = newRow.insertCell(3);
    cell4.innerHTML = data.country;
    cell5 = newRow.insertCell(4);
    cell5.innerHTML = data.phone;
    cell6 = newRow.insertCell(5);
    cell6.innerHTML = data.email;
    cell6 = newRow.insertCell(6);
    cell6.innerHTML = `<a onClick="onEdit(this)">Edit</a>
                       <a onClick="onDelete(this)">Delete</a>`;
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
        row = td.parentElement.parentElement;
        document.getElementById("bankList").deleteRow(row.rowIndex);
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
