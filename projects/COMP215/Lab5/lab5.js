function getProduct() {
    var select = document.getElementById("productSelect");
    var selectedValue = select.value;
    if (selectedValue === "default") return 0;
    if (selectedValue === "Base Cabinets") return 1;
    if (selectedValue === "Wall Cabinets") return 2;
    if (selectedValue === "Counter Tops") return 3;
    return -1;
}

function getLine() {
    if (document.getElementById("eS").checked) return 1;
    else if (document.getElementById("kE").checked) return 2;
    else if (document.getElementById("gS").checked) return 3;
    return -1;
}

function getLineName() {
    let line = getLine();
    if (line === 1) return "Empire Standard";
    else if (line === 2) return "Kitchen Elite";
    else if (line === 3) return "Gold Star Plus";
    return "Line Empty!";
}

function changeProductImage() {
    var productType = getProduct();
    var img = document.getElementById("productImage");
    var cornerUnits = document.getElementById("CUnits");
    if (productType === 0) {
        img.src = "img/fromKitchen.gif";
        cornerUnits.style.visibility = '';
    }
    if (productType === 1) {
        img.src = "img/baseCabinet2.jpg";
        cornerUnits.style.visibility = '';
    }
    if (productType === 2) {
        img.src = "img/wallCabinet2.jpeg";
        cornerUnits.style.visibility = '';
    }
    if (productType === 3) {
        img.src = "img/counterTops.jpg";
        cornerUnits.style.visibility = 'hidden';
    }
}


function radioBorderChange() {
    let line = getLine();
    let border = document.getElementById("table1");
    if (line === 1) border.style.border = '2px dashed #d52bac';
    if (line === 2) border.style.border = '2px dashed #21ecae';
    if (line === 3) border.style.border = '2px dashed #e5892d';
}

function getLinearFootage() {
    if (document.getElementById("linearFootage").value < 3 || document.getElementById("linearFootage").value > 50) {
        return -1;
    }

    return document.getElementById("linearFootage").value;
}

function getCornerUnits() {
    return document.getElementById("cornerUnits").value;
}

function pricePerFoot() {
    let product = getProduct();
    var line = getLine();
    if (product === 2 && line === 1) return 99.99; //alert("wall cabinet & empire standard");
    else if (product === 2 && line === 2) return 179.00; //alert("wall cabinet & kitchen elite");
    else if (product === 2 && line === 3) return 200.99; //alert("wall cabinet & gold star plus");
    else if (product === 1 && line === 1) return 69.99; //alert("base cabinet & empire standard");
    else if (product === 1 && line === 2) return 79.00; //alert("base cabinet & kitchen elite");
    else if (product === 1 && line === 3) return 99.99; //alert("base cabinet & gold star plus");
    else if (product === 3 && line === 1) return 30.99; //alert("counter tops & empire standard");
    else if (product === 3 && line === 2) return 189.99; //alert("counter tops & kitchen elite");
    else if (product === 3 && line === 3) return 212.99; //alert("counter tops & gold star plus");
    return -1;
}

function pricePerCornerUnit() {
    let line = getLine();
    if (line === 1) return 50.99;
    else if (line === 2) return 79.99;
    else if (line === 3) return 89.99;
    return -1;
}

function calculate() {
    <!--Price = (pricePerFoot * linear Footage) + (pricePerCornerUnit * Corner Units)-->
    return (pricePerFoot() * getLinearFootage()) + (pricePerCornerUnit() * getCornerUnits());
}

function showTotalPrice() {
    let total = calculate().toFixed(2);
    if (total <= 0) {
        document.getElementById("txtTotalPrice").value = "";
    }
    document.getElementById("txtTotalPrice").value = "$ " + total;
}

function showError() {

    if (getProduct() === 0 || getProduct() === -1) {
        alert("ERROR: Please select Product type");
        return 1;
    }
    if (getLine() === -1) {
        alert("ERROR: Please select Product Line");
        return 1;
    }
    if (getLinearFootage() <= 0 || getLinearFootage() === null) {
        alert("Linear footage must be between 3 and 50 feet");
        return 1
    }
    if (getCornerUnits() < 0 || getCornerUnits() > 5) {
        alert("The number of Corner Units must be from 0 to 5");
        return 1;
    } else if (getCornerUnits() === "") {
        alert("The number of Corner Units must be from 0 to 5");
        return 1;
    }
    return 0;
}

function showDetail() {
    alert("Product: " + document.getElementById("productSelect").value
        + "\nLine: " + getLineName()
        + "\n-----"
        + "\nPrice per Foot: $" + pricePerFoot()
        + "\nLinear Footage: " + getLinearFootage()
        + "\nSubtotal: $" + (pricePerFoot() * getLinearFootage()).toFixed(2)
        + "\n-----"
        + "\nPrice per corner unit (" + getLineName() + "): $" + pricePerCornerUnit().toFixed(2)
        + "\nCorner Units: " + getCornerUnits()
        + "\nSubtotal: $" + pricePerCornerUnit() * getCornerUnits()
        + "\n-----"
        + "\nTOTAL PRICE: $" + calculate().toFixed(2));
}