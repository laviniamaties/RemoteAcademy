
function InsertRowCellDonors(data){
    
    var tr = $('<tr/>');
    var listTypes = {
        ID : tr.append("<td>" + data.ID + "</td>" ),
        Sex: tr.append("<td>" + data.Sex + "</td>"),
        Type: tr.append("<td>" + data.Type + "</td>"),
        FirstName: tr.append("<td>" + data.FirstName + "</td>"),
        LastName: tr.append("<td>" + data.LastName + "</td>"),
        Address: tr.append("<td>" + data.Address + "</td>"),
        City: tr.append("<td>" + data.City + "</td>"),
        Country: tr.append("<td>" + data.Country + "</td>"),
        PhoneNumber: tr.append("<td>" + data.PhoneNumber + "</td>"),
        EmailAddress: tr.append("<td>" + data.EmailAddress + "</td>"),
        Birthday: tr.append("<td>" + data.Birthday + "</td>"),
        BloodType: tr.append("<td>" + data.BloodType + "</td>")

    }

    $('tbody').append(listTypes);
    var table = document.getElementById("donorsList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell = newRow.insertCell(0);
    cell.innerHTML = data.ID;
    cell = newRow.insertCell(1);
    cell.innerHTML = data.Sex;
    cell = newRow.insertCell(2);
    cell.innerHTML = data.Type;
    cell = newRow.insertCell(3);
    cell.innerHTML = data.FirstName;
    cell = newRow.insertCell(4);
    cell.innerHTML = data.LastName;
    cell = newRow.insertCell(5);
    cell.innerHTML = data.Address;
    cell = newRow.insertCell(6);
    cell.innerHTML = data.City;
    cell = newRow.insertCell(7);
    cell.innerHTML = data.Country;
    cell = newRow.insertCell(8);
    cell.innerHTML = data.PhoneNumber;
    cell = newRow.insertCell(9);
    cell.innerHTML = data.EmailAddress;
    cell = newRow.insertCell(10);
    cell.innerHTML = data.Birthday;
    cell = newRow.insertCell(11);
    cell.innerHTML = data.BloodType;
}

function InsertRowCellBanks(data){
    
    var tr = $('<tr/>');
    var listTypes = {
        ID : tr.append("<td>" + data.ID + "</td>" ),
        LastName: tr.append("<td>" + data.Name + "</td>"),
        Address: tr.append("<td>" + data.Addresse + "</td>"),
        City: tr.append("<td>" + data.City + "</td>"),
        Country: tr.append("<td>" + data.Country + "</td>"),
        PhoneNumber: tr.append("<td>" + data.PhoneNumber + "</td>"),
        EmailAddresse: tr.append("<td>" + data.EmailAddresse + "</td>"),
       
    }
    $('tbody').append(listTypes);
    var table = document.getElementById("bankList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell = newRow.insertCell(0);
    cell.innerHTML = data.ID;
    cell = newRow.insertCell(1);
    cell.innerHTML = data.Name;
    cell = newRow.insertCell(2);
    cell.innerHTML = data.Addresse;
    cell = newRow.insertCell(3);
    cell.innerHTML = data.City;
    cell = newRow.insertCell(4);
    cell.innerHTML = data.Country;
    cell = newRow.insertCell(5);
    cell.innerHTML = data.PhoneNumber;
    cell = newRow.insertCell(6);
    cell.innerHTML = data.EmailAddresse;
    cell = newRow.insertCell(7);
}

function InsertRowCellCampaigns(data){
    
    var tr = $('<tr/>');
    var listTypes = {
        ID : tr.append("<td>" + data.ID + "</td>" ),
        LastName: tr.append("<td>" + data.Name + "</td>"),
        Description: tr.append("<td>" + data.Description + "</td>"),
        StartDate: tr.append("<td>" + data.StartDate + "</td>"),
        EndDate: tr.append("<td>" + data.EndDate + "</td>")       
    }
    $('tbody').append(listTypes);
    var table = document.getElementById("campaignList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell = newRow.insertCell(0);
    cell.innerHTML = data.ID;
    cell = newRow.insertCell(1);
    cell.innerHTML = data.Name;
    cell = newRow.insertCell(2);
    cell.innerHTML = data.Description;
    cell = newRow.insertCell(3);
    cell.innerHTML = data.StartDate;
    cell = newRow.insertCell(4);
    cell.innerHTML = data.EndDate;
    cell = newRow.insertCell(5);
}


function InsertRowCellPoints(data){
    
    var tr = $('<tr/>');
    var listTypes = {
        ID : tr.append("<td>" + data.ID + "</td>" ),
        LastName: tr.append("<td>" + data.Name + "</td>"),
        Address: tr.append("<td>" + data.Addresse + "</td>"),
        City: tr.append("<td>" + data.City + "</td>"),
        Country: tr.append("<td>" + data.Country + "</td>"),
        PhoneNumber: tr.append("<td>" + data.PhoneNumber + "</td>"),
        EmailAddresse: tr.append("<td>" + data.EmailAddresse + "</td>"),
        BankName : tr.append("<td>" + data.BankName + "</td>")

       
    }
    $('tbody').append(listTypes);
    var table = document.getElementById("pointsList").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell = newRow.insertCell(0);
    cell.innerHTML = data.ID;
    cell = newRow.insertCell(1);
    cell.innerHTML = data.Name;
    cell = newRow.insertCell(2);
    cell.innerHTML = data.Addresse;
    cell = newRow.insertCell(3);
    cell.innerHTML = data.City;
    cell = newRow.insertCell(4);
    cell.innerHTML = data.Country;
    cell = newRow.insertCell(5);
    cell.innerHTML = data.PhoneNumber;
    cell = newRow.insertCell(6);
    cell.innerHTML = data.EmailAddresse;
    cell = newRow.insertCell(7);
    cell.innerHTML = data.BankName;
    cell = newRow.insertCell(8);
    
}


function InsertRowCellCampaignsPoints(data){
    var tr = $('<tr/>');
    var listTypes = {
       
        CampaignName: tr.append("<td>" + data.CampaignName + "</td>"),
        Description: tr.append("<td>" + data.Description + "</td>"),
        StartDate: tr.append("<td>" + data.StartDate + "</td>"),
        EndDate: tr.append("<td>" + data.EndDate + "</td>") ,
        PointName: tr.append("<td>" + data.PointName + "</td>"),
        Addresse: tr.append("<td>" + data.Addresse + "</td>"),
        City: tr.append("<td>" + data.City + "</td>"),
        Country: tr.append("<td>" + data.Country + "</td>")         
    }
    $('tbody').append(listTypes);
    var table = document.getElementById("pontCampaigns").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell = newRow.insertCell(0);
    cell.innerHTML = data.CampaignName;
    cell = newRow.insertCell(1);
    cell.innerHTML = data.Description;
    cell = newRow.insertCell(2);
    cell.innerHTML = data.StartDate;
    cell = newRow.insertCell(3);
    cell.innerHTML = data.EndDate;
    cell = newRow.insertCell(4);
    cell.innerHTML = data.PointName;
    cell = newRow.insertCell(5);
    cell.innerHTML = data.Addresse;
    cell = newRow.insertCell(6);
    cell.innerHTML = data.City;
    cell = newRow.insertCell(7);
    cell.innerHTML = data.Country;

}

function InsertRowCellDonorPoints(data){

    var tr = $('<tr/>');
    var listTypes = {
       
        FirstName: tr.append("<td>" + data.FirstName + "</td>"),
        LastName: tr.append("<td>" + data.LastName + "</td>"),
        Type: tr.append("<td>" + data.Type + "</td>"),
        Birthday: tr.append("<td>" + data.Birthday + "</td>") ,
        PointName: tr.append("<td>" + data.PointName + "</td>"),
        PointAddresse: tr.append("<td>" + data.PointAddresse + "</td>"),
        PointCity: tr.append("<td>" + data.PointCity + "</td>"),
        PointCountry: tr.append("<td>" + data.PointCountry + "</td>") ,  
        PointEmail: tr.append("<td>" + data.PointEmail + "</td>")    ,     
        PointNumber: tr.append("<td>" + data.PointNumber + "</td>")         
      
    }
    $('tbody').append(listTypes);
    var table = document.getElementById("donorPoint").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(table.length);
    cell = newRow.insertCell(0);
    cell.innerHTML = data.FirstName;
    cell = newRow.insertCell(1);
    cell.innerHTML = data.LastName;
    cell = newRow.insertCell(2);
    cell.innerHTML = data.Type;
    cell = newRow.insertCell(3);
    cell.innerHTML = data.Birthday;
    cell = newRow.insertCell(4);
    cell.innerHTML = data.PointName;
    cell = newRow.insertCell(5);
    cell.innerHTML = data.PointAddresse;
    cell = newRow.insertCell(6);
    cell.innerHTML = data.PointCity;
    cell = newRow.insertCell(7);
    cell.innerHTML = data.PointCountry;
    cell = newRow.insertCell(8);
    cell.innerHTML = data.PointEmail;
    cell = newRow.insertCell(9);
    cell.innerHTML = data.PointNumber;

}
