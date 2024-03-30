//Entreprises

function EntrepriseFilter(){
    let option1 = document.getElementById('hideEntreprise');
    let option2 = document.getElementById('inputEntreprise');
    if(option1.style.display == 'none'){
        option1.style.display ='block';
        option2.style.display ='block';
    }
    else {
        option1.style.display = 'none';
        option2.style.display = 'none';
    }
}

function NotesFilter(){
    let options = document.getElementsByClassName("hideNote");
    for(let i = 0; i < options.length; i++) {
        let element = options[i];
        if (element.style.display == 'none') {
            element.style.display = 'block';
        } else {
            element.style.display = 'none';
        }
    }
}

function ActiviteFilter(){
    let option = document.getElementById('inputActivite');
    if(option.style.display == 'none'){    
        option.style.display ='block';
    }
    else {
        option.style.display = 'none';
    }
}

function LieuFilter(){
    let options1 = document.getElementsByClassName('hideLieu');
    let options2 = document.getElementsByClassName('inputLieu');
    let variables = [options1, options2];
    for(let j = 0; j < variables.length; j++){
        let elements = variables[j];
        for(let i = 0; i < elements.length; i++){
            let element = elements[i];
            if(element.style.display == 'none'){
                element.style.display ='block';
            }
            else {
                element.style.display = 'none';
            }
        }
    }
}

function TrierFilter(){
    let trier = document.getElementsByClassName('trier');
    for(let i = 0; i < trier.length; i++) {
        let element = trier[i];
        if (element.style.display == 'none') {
            element.style.display = 'block';
        } else {
            element.style.display = 'none';
        }
    }
}









/* Prochaines fonctions en lien avec le backend */


function voirEntreprise(){
    window.location.href = "presentation_entreprise.html";
    return false;
}




//gestion entreprise

var nbLocalites = 1;

function AddLocaliteEnt() {
    nbLocalites += 1;
    var newDiv = document.createElement("div");
    var index = nbLocalites;

    newDiv.innerHTML = "<div style='margin-top:5rem'> <label for='Adresse" + index + "_entreprise'>Adresse " + index + " :</label><input type='text' id='Adresse" + index + "_entreprise' name='Adresse" + index + "_entreprise' required> </div>";
    newDiv.innerHTML += "<div><label for='CP" + index + "_entreprise'>Code Postal :</label><input type='number' id='CP" + index + "_entreprise' name='CP" + index + "_entreprise' required></div>";
    newDiv.innerHTML += "<div> <label for='Ville" + index + "_entreprise'>Ville :</label><input type='text' id='Ville" + index + "_entreprise' name='Ville" + index + "_entreprise' required><div class='CP_API'><select id='selectVilles" + index + "' class='selectVilles'></select></div></div>";
    newDiv.innerHTML += "<div><label for='Pays" + index + "_entreprise'>Pays :</label><input type='text' id='Pays" + index + "_entreprise' name='Pays" + index + "_entreprise' required></div>";

    document.getElementById("LocaliteSupp").appendChild(newDiv);

    // Ajoute les écouteurs d'événements à la nouvelle localité
    addEventListenersToLocation(index);

}


document.addEventListener("DOMContentLoaded", function() {

    // Le code postal 5202 n'est pas répertorié 

            var Element = "CP1_entreprise";
            document.getElementById(Element).addEventListener("input", function () {
                var codePostal = this.value;
                var xhr = new XMLHttpRequest(); 
                xhr.open("GET", "https://apicarto.ign.fr/api/codes-postaux/communes/" + codePostal, true);
                xhr.onload = function () { //quand on charge la réponse de la requete 
                    if (xhr.status == 200) {
                        var response = JSON.parse(xhr.responseText); //analyse la réponse JSON reçue du serveur en un objet JavaScript. 
                        if (response.length > 1) { // Vérifie si la réponse contient des données
                            var ElementSelect = "selectVilles1";
                            var selectVilles = document.getElementById(ElementSelect);
                            selectVilles.innerHTML = ""; // Vide le contenu précédent du select
                            selectVilles.size = Math.min(response.length, 6);
                            for (var i = 0; i < response.length; i++) {// Boucle pour parcourir toutes les communes dans la réponse
                                var option = document.createElement("option");
                                option.value = response[i]["nomCommune"];
                                option.textContent = response[i]["nomCommune"];
                                selectVilles.appendChild(option);
                            }
                            selectVilles.style.display = 'block';
                        }
                        else if (response.length == 1){
                            var ElementVille = "Ville1_entreprise";
                            document.getElementById(ElementVille).value = response[0]["nomCommune"];
                        } 
                            
                        else { //si pas de donnée dans la réponse
                            alert("Aucune ville trouvée pour ce code postal.");
                        }
                    }
                };
                xhr.send(); //Envoi de la requête au serveur (asynchrone par défaut)
            });

            // Gestionnaire d'événement pour mettre à jour la valeur de l'input de la ville
            var selectVilles = document.getElementById("selectVilles1");
            selectVilles.addEventListener("change", function() {
                var ElementVille = "Ville1_entreprise";
                document.getElementById(ElementVille).value = this.value;
                this.style.display = 'none';   
            });
});