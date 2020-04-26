window.onload = function(){
    buildForm();
}

function buildForm(){
    var bodyElement = document.body;
    var formElement = document.createElement('form');
        
    formElement.append(setTitlePage("Hello"), getDonorButton(), getCampaignButton(), getPointButton(), 
    getBankButton());
    bodyElement.appendChild(formElement);
}

function setTitlePage(title){
    var divElement = document.createElement('div');
    var padElement = document.createElement('h1');

    padElement.innerText = title;

    divElement.appendChild(padElement);

    return divElement;
    
}
function getDonorButton(){
    var divElement = document.createElement('div');
    var button = document.createElement('input');
    button.setAttribute('type', 'button');
    button.setAttribute('value', 'Donor');
    button.setAttribute('style', 'color: red');

    button.window.onclick

    button.onclick = function (){
        alert("Go to donors page");
    }

    divElement.appendChild(button);
    return divElement;
}

function getCampaignButton(){
    var divElement = document.createElement('div');
    var button = document.createElement('input');
    button.setAttribute('type', 'button');
    button.setAttribute('value', 'Campaign');
    button.setAttribute('style', 'color: red');

    button.onclick = function (){
        alert("Go to camaigns page");
    }

    divElement.appendChild(button);
    return divElement;
}

function getPointButton(){
    var divElement = document.createElement('div');
    var button = document.createElement('input');
    button.setAttribute('type', 'button');
    button.setAttribute('value', 'Point');
    button.setAttribute('style', 'color: red');

    button.onclick = function (){
        alert("Go to collection points  page");
    }

    divElement.appendChild(button);
    return divElement;
}

function getBankButton(){
    var divElement = document.createElement('div');
    var button = document.createElement('input');
    button.setAttribute('type', 'button');
    button.setAttribute('value', 'Bank');
    button.setAttribute('style', 'color: red');

    button.onclick = function (){
        alert("Go to banks page");
    }

    divElement.appendChild(button);
    return divElement;
}

