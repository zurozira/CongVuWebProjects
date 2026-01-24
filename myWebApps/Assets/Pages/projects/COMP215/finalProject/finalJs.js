window.onload = function () {
    radioSelect(); // To hide input elements when load the page
}

// Load projects
function loadDoc() {
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        myFunction(this);
    }
    xhttp.open("GET", "myProject.xml");
    xhttp.send();
}

function myFunction(xml) {
    const xmlDoc = xml.responseXML;
    const x = xmlDoc.getElementsByTagName("LAB");
    let table = "<tr><th>Title</th><th>Link</th></tr>";
    for (let i = 0; i < x.length; i++) {
        const title = x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue;
        const link = x[i].getElementsByTagName("LINK")[0].childNodes[0].nodeValue;

        table += "<tr><td>" + title + "</td><td>" +
            "<a class='btn' href='" + link + "'>View Project</a>" +
            "</td></tr>";
    }
    document.getElementById("demo").innerHTML = table;
}


// Get weather data
function radioSelect() {
    document.getElementById("cityOption").style.display = "none";
    document.getElementById("postalOption").style.display = "none";
    document.getElementById("lolaOption").style.display = "none";

    const selectedValue = document.querySelector('input[name="searchType"]:checked').value;
    if (selectedValue === 'city') {
        document.getElementById("cityOption").style.display = "block";
    } else if (selectedValue === "postal") {
        document.getElementById("postalOption").style.display = "block";
    } else if (selectedValue === "lola") {
        document.getElementById("lolaOption").style.display = "block";
    }
}

function searchWeather() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var SearchResponse = this.responseText;
            //document.getElementById("ResponseText").innerHTML = SearchResponse;
            var obj = JSON.parse(SearchResponse);
            var city_name = obj["name"];
            var country_name = obj["sys"]["country"];
            var weather_description = obj["weather"][0]["description"];
            var temp = obj["main"]["temp"];

            let feels_like = obj["main"]["feels_like"];
            var wind_speed = obj["wind"]["speed"];
            var SearchResultsHTML = "City: " + city_name + "<br />" +
                "Country: " + country_name + "<br />"
                +
                "Weather: " + weather_description +
                "<br />" +
                "Temperature: " + temp + " °Celcius" + "<br />" +
                "Feels like: " + feels_like + " °Celcius" + "<br />" +
                "Wind Speed: " + wind_speed + " m/h";
            $("#SearchResults").html(SearchResultsHTML);
        }
        ;
    }
    var apiKey = "652e5516b1c87d1ae0a7990d25dc5267"; // My personal API of OpenWeather

    var SearchString = "";
    const selectedValue = document.querySelector('input[name="searchType"]:checked').value;

    if (selectedValue === 'city') {
        var CityName = $("#CityNameTextbox").val();
        var CountryCode = $("#CountryCodeTextbox").val();
        SearchString = "https://api.openweathermap.org/data/2.5/weather"
            + "?q=" + CityName + "," + CountryCode
            + "&units=metric"
            + "&APPID=" + apiKey;
    } else if (selectedValue === 'postal') {
        let PostalCode = $('#PostalCodeTextbox').val();
        let CountryCode = $("#PostalCountryCodeTextbox").val();
        SearchString = "https://api.openweathermap.org/data/2.5/weather"
            + "?zip=" + PostalCode + "," + CountryCode
            + "&units=metric"
            + "&APPID=" + apiKey;
    } else if (selectedValue === "lola") {
        let Longitude = $("#LongitudeTextbox").val();
        let Latitude = $("#LatitudeTextbox").val();
        SearchString = "https://api.openweathermap.org/data/2.5/weather"
            + "?lat=" + Latitude + "&lon=" + Longitude
            + "&units=metric"
            + "&APPID=" + apiKey;
    }


    xhttp.open("GET", SearchString, true);
    xhttp.send();
}

// Get NEWS from API
function getRandomHotNews() {
    var apiKey = "pub_8e9cd7e147b54dd1961de65a528b77e1";
    var apiURL = "https://newsdata.io/api/1/latest?apikey="
        + apiKey
        + "&country=ca&language=en" /* "&country=vi&language=vi" */;

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var response = JSON.parse(this.responseText);
            var articles = response.results;

            // Pick a random article
            var randomIndex = Math.floor(Math.random() * articles.length);
            var article = articles[randomIndex];

            // Display the random article
            var newsHTML = '<div class="hot-news">'
                + '<h5>' + article.title + '</h5>'
                + '<p>' + (article.description || 'No description available') + '</p>'
                + '<a class="btn" href="' + article.link + '" target="_blank">Read full article</a>'
                + '<p><small>Source: '
                + article.source_id + ' | ' + article.pubDate + '</small></p>'
                + '</div>';

            document.getElementById("randomNews").innerHTML = newsHTML;
        }
    };

    xhttp.open("GET", apiURL, true);
    xhttp.send();
}