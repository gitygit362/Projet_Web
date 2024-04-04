//Entreprises




function requeteFiltre(event, recherche){
        event.preventDefault();

        localisation = document.getElementsByClassName('inputLieu');

        if (recherche == 1){
            var nom = document.getElementById('rechercheNom').value;
        }
        else if(recherche == 2){
            var nom = document.getElementById('inputEntreprise').value;
        }
        var activite = document.getElementById('inputActivite').value;
        var pays = localisation[0].value;
        var ville = localisation[1].value;
        var adresse = localisation[2].value;
        
        var filter1Param = document.getElementById('evaluationFilter1').checked ? 1 : 0;
        var filter2Param = document.getElementById('evaluationFilter2').checked ? 1 : 0;
        var filter3Param = document.getElementById('evaluationFilter3').checked ? 1 : 0;
        var filter4Param = document.getElementById('evaluationFilter4').checked ? 1 : 0;
        var filter5Param = document.getElementById('evaluationFilter5').checked ? 1 : 0;
        var filter6Param = document.getElementById('evaluationFilter6').checked ? 1 : 0;
        var noteAsc = document.getElementById('NoteAsc').checked ? 1 : 0;
        var noteDesc = document.getElementById('NoteDesc').checked ? 1 : 0;
        var likeAsc = document.getElementById('LikeAsc').checked ? 1 : 0;
        var likeDesc = document.getElementById('LikeDesc').checked ? 1 : 0;
       var type = 'filtres';

        var params = new URLSearchParams();

        params.append('nom', nom);
        params.append('activite', activite);
        params.append('pays', pays);
        params.append('ville', ville);
        params.append('adresse', adresse);
        params.append('evaluationFilter1', filter1Param);
        params.append('evaluationFilter2', filter2Param);
        params.append('evaluationFilter3', filter3Param);
        params.append('evaluationFilter4', filter4Param);
        params.append('evaluationFilter5', filter5Param);
        params.append('evaluationFilter6', filter6Param);
        params.append('NoteAsc', noteAsc);
        params.append('NoteDesc', noteDesc);
        params.append('LikeAsc', likeAsc);
        params.append('LikeDesc', likeDesc);
        
        var url = 'entreprisesFiltres.php?type=' + type + '&' + params.toString();
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    window.location.href = url;
                } else {
                    alert('Erreur lors de la requête AJAX');
                }
            }
        };
        xhr.onerror = function () {
            alert("Erreur lors de la requête masquer");
        };
        //var userData = JSON.stringify(data);
        xhr.send();//userData
    }


    function voirEntreprise(index,recherche, url){
        var id = index;
        if (recherche === 1) {
            window.location.href = "entreprises.php?id="+ id + "&s=TopEntreprise";
        }
        else if (recherche == 0){
            window.location.href = "entreprises.php?id="+ id + "&s=Onload";
        }
        else if (recherche == 2){
            window.location.href = url + "&id="+ id + "&s=Filtres";
        }
        return false;
    }


    function redirectToPrecPageEnt() {
        var pagePrecedente = document.referrer;
            window.location.href = pagePrecedente;
    }
    







// ----------------------- Filtres ------------------------------------


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



// -------------- Créer Entreprise --------------------

function redirectToAccueilGE_FromCreate(event){
    event.preventDefault();
    var name_ent = document.getElementById("nom_entreprise").value;
    var sect_ent = document.getElementById("secteur_entreprise").value;
    var logo_ent = document.getElementById("logo_entreprise").value;
    var note_ent = document.getElementById("note_entreprise").value;

    if(name_ent == ""){
        alert("Veuillez entrer un nom d'entreprise");
        return false;
    }
    else if(sect_ent == ""){
        alert("Veuillez entrer un secteur d'entreprise");
        return false;
    }
    else if(adr_ent == ""){
        alert("Veuillez entrer au moins une localité pour l'entreprise");
        return false;
    }
    else if(ville_ent == ""){
        alert("Veuillez entrer au moins une localité pour l'entreprise");
        return false;
    }
    else if(pays_ent == ""){
        alert("Veuillez entrer au moins une localité pour l'entreprise");
        return false;
    }
    else{        
        var data1 = {
            nom: name_ent,
            secteur: sect_ent,
            logo: logo_ent,
            note: note_ent
        };
    
        var xhr = new XMLHttpRequest();
        xhr.open("POST","../../Controler/entrepriseGestion.php?action=creerEntreprise",false);
        xhr.setRequestHeader('Content-Type', 'application/json');
        var response1 = '';
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                response1 = xhr.responseText;
                alert(response1);
                if (response1 !== '') {
                    alert("entreprise créé avec succès");
                    return true;
                } else {
                    alert("Erreur : l'entreprise n'a pas été créé");
                }
            } else {
                alert ("Erreur : Impossible de contacter le serveur");
                alert (xhr.status);
            }
        };
        xhr.onerror = function () {
            alert("Erreur : Impossible de charger la requete");
        };
        xhr.send(JSON.stringify(data1));
        alert(response1);
        for(i=1; i <= nbLocalites; i++){

            var adr_ent = document.getElementById("Adresse"+i+"_entreprise").value;
            var ville_ent = document.getElementById("Ville"+i+"_entreprise").value;
            var pays_ent = document.getElementById("Pays"+i+"_entreprise").value;
            var data2 = {
                id: response1,
                adresse: adr_ent,
                ville: ville_ent,
                pays: pays_ent
            };
            var xhr = new XMLHttpRequest();
            xhr.open("POST","../../Controler/entrepriseGestion.php?action=creerEntrepriseAdresse",false);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    var response = xhr.responseText;
                    alert(response);
                    if (response === 'true') {
                        alert("adresse "+ i +" créé avec succès");
                        if(i == nbLocalites){
                            window.location.href = "GE_accueil.html";
                        }
                    } else {
                        alert("Erreur : Adresse" + i);
                    }
                } else {
                    alert ("Erreur : Impossible de contacter le serveur" + i);
                    alert (xhr.status);
                }
            };
            xhr.onerror = function () {
                alert("Erreur : Impossible de charger la requete" + i);
            };
            xhr.send(JSON.stringify(data2));
        
        }
    }
}


// ------------- Masquer Entreprise -------------------

function redirectToAccueilGE_FromSuprr(event){
    event.preventDefault();
    var nom1_ent = document.getElementById("nom1").value;
    var nom2_ent = document.getElementById("nom2").value;
    var data = {
        nom1: nom1_ent,
        nom2: nom2_ent,
    };
    var xhr = new XMLHttpRequest();
    xhr.open("POST","../../Controler/entrepriseGestion.php?action=masquerEntreprise",false);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var response = xhr.responseText;
            if (response === 'true') {
                alert("entreprise masquée avec succès");
                window.location.href = "GE_accueil.html";
            } else {
                alert("Erreur : impossible de masquer cette entreprise. Veuillez vérifier le nom entré.");
            }
        } else {
            alert ("Erreur : Impossible de contacter le serveur");
        }
    };
    xhr.onerror = function () {
        alert("Erreur : Impossible de charger la requête");
    };
    xhr.send(JSON.stringify(data));
}





// ------------- Modifier Entreprise -------------------


function redirectToGE_modification(event, page){
    event.preventDefault();

if (page == 1){
    var name_ent = document.getElementById("nom_entreprise").value;
    if(name_ent == ""){
        alert("Veuillez entrer un nom d'entreprise");
        return false;
   }
    else{
        var data = {
            nom: name_ent
        };
        var xhr = new XMLHttpRequest();
        xhr.open("POST","../../Controler/entrepriseGestion.php?action=aModifierEntreprise",true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                response = xhr.responseText;
                alert(response);
                if (response == true) {
                    alert(response);
                    window.location.href = "../../Controler/entrepriseGestion.php?action=aModifierEntreprise";
                } else {
                    alert("Erreur : Veuillez entrer une entreprise valide.");
                }
            } else {
                alert ("Erreur : Impossible de contacter le serveur");
            }
        };
        xhr.onerror = function () {
            alert("Erreur : Impossible de charger la requête");
        };
        xhr.send(JSON.stringify(data));
    }
}
    else if (page == 2){

        //requete pour modifier 

    }
    
}









// ------------- redirections -----------------------

function redirectToAccueilGE(){
    window.location.href = "GE_accueil.html";
}

function redirectToCrerEnt_GE(){
    window.location.href = "GE_creation.html";    
}

function redirectToSuppEnt_GE(){
    window.location.href = "GE_suppression.html";
}

function redirectToEditEnt_GE(){
    window.location.href = "GE_a_modifier.html";
}





// ----------------------------------------------- API RESTFULL EXTERNE -----------------------------------------------------------------


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


function addEventListenersToLocation(index) {
    var Element = "CP" + index + "_entreprise";
    var ElementSelect = "selectVilles" + index;

    document.getElementById(Element).addEventListener("input", function () {
        var codePostal = this.value;
        var xhr = new XMLHttpRequest(); 
        xhr.open("GET", "https://apicarto.ign.fr/api/codes-postaux/communes/" + codePostal, true);
        xhr.onload = function () { 
            if (xhr.status == 200) {
                var response = JSON.parse(xhr.responseText); 
                if (response.length > 1) { 
                    var selectVilles = document.getElementById(ElementSelect);
                    selectVilles.innerHTML = ""; 
                    selectVilles.size = Math.min(response.length, 6);
                    for (var i = 0; i < response.length; i++) {
                        var option = document.createElement("option");
                        option.value = response[i]["nomCommune"];
                        option.textContent = response[i]["nomCommune"];
                        selectVilles.appendChild(option);
                    }
                    selectVilles.style.display = 'block';
                }
                else if (response.length == 1){
                    var ElementVille = "Ville" + index + "_entreprise";
                    document.getElementById(ElementVille).value = response[0]["nomCommune"];
                } else {
                    alert("Aucune ville trouvée pour ce code postal.");
                }
            }
        };
        xhr.send();
    });

    var selectVilles = document.getElementById(ElementSelect);

    selectVilles.addEventListener("change", function() {
        var ElementVille = "Ville" + index + "_entreprise";
        document.getElementById(ElementVille).value = this.value;
        this.style.display = 'none';   
    });
}
