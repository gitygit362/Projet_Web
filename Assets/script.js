// redirections 


function redirectToAccueilFromConnexion() {
    // Exécuter la vérif des données entrées avant la redirection 
    // ...
    let user = document.connexion.user.value;
    let password = document.connexion.password.value;

    if(user === "test" && password === "123"){
    // Rediriger vers la page accueil.html
    window.location.href = "accueil.html";
    return false;
    }
    else {
    // Empêcher l'envoi standard du formulaire
    alert("Identifiant ou mot de passe incorrect!");
    return false;
    }
}

function redirectToAccueil(){
    window.location.href = "../accueil.html";
}
function redirectToAccueilGE(){
    window.location.href = "GE_accueil.html";
}

function redirectToAccueilGE_FromCreate(){
    var name_ent = document.getElementById("nom_entreprise").value;
    var sect_ent = document.getElementById("secteur_entreprise").value;
    var local_ent = document.getElementById("localite1_entreprise").value;
    if(name_ent == ""){
        alert("Veuillez entrer un nom d'entreprise");
        return false;
    }
    else if(sect_ent == ""){
        alert("Veuillez entrer un secteur d'entreprise");
        return false;
    }
    else if(local_ent == ""){
        alert("Veuillez entrer au moins une localité pour l'entreprise");
        return false;
    }
    else{
        window.location.href = "GE_accueil.html";
        return true;
    }
}


function redirectToAccueilGE_FromSuprr(){
    var name_ent = document.getElementById("nom_entreprise").value;
    var confirm_name_ent = document.getElementById("confirm_nom_entreprise").value;
    if(name_ent == ""){
        alert("Veuillez entrer un nom d'entreprise");
        return false;
    }
    else if(confirm_name_ent == ""){
        alert("Veuillez confirmer le nom de l'entreprise");
        return false;
    }
    else{
        window.location.href = "GE_accueil.html";
        return true;
    }
}


function redirectToPostulation() {
    window.location.href = "candidature.html";
    
}

function redirectToPrecPage() {
    window.location.href = "offres_stages.html";
}

function redirectToCreerOffre() {
    window.location.href = "creer_offre.html";
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

function redirectToGE_modification(){
     var name_ent = document.getElementById("nom_entreprise").value;
     if(name_ent == ""){
         alert("Veuillez entrer un nom d'entreprise");
         return false;
    }
     else{
         alert("test");
        window.location.href = "GE_modification.html";
         return true;
    }
}

//gestion pilote redirection
function redirectToAccueilGP(){
    window.location.href = "GP_accueil.html";
}

function redirectToAccueilGE_FromCreate(){
    var name_pil = document.getElementById("nom_pilote").value;
    var fname_pil = document.getElementById("prenom_pilote").value;
    var centre_pil = document.getElementById("centre_pilote").value;
    var local_pil = document.getElementById("promo_pilote").value;
    if(name_ent == ""){
        alert("Veuillez entrer un nom d'entreprise");
        return false;
    }
    else if(sect_ent == ""){
        alert("Veuillez entrer un secteur d'entreprise");
        return false;
    }
    else if(local_ent == ""){
        alert("Veuillez entrer au moins une localité pour l'entreprise");
        return false;
    }
    else{
        window.location.href = "GE_accueil.html";
        return true;
    }
}

function redirectToCrer_GP(){
    window.location.href = "GP_creation.html";
}

function redirectToSupp_GP(){
    window.location.href = "GP_suppression.html";
}

function redirectToEdit_GP(){
    window.location.href = "GP_a_modifier.html";
}

function redirectToRecherche_GP(){
    window.location.href = "GP_recherche.html";
}

function redirectToGP_modification(){
    window.location.href = "GP_modification.html";
}

// gestion etudiant redirection
function redirectToAccueilGETU(){
    window.location.href = "GETU_accueil.html";
}

function redirectToCrer_GETU(){
    window.location.href = "GETU_creation.html";
}

function redirectToSupp_GETU(){
    window.location.href = "GETU_suppression.html";
}

function redirectToEdit_GETU(){
    window.location.href = "GETU_a_modifier.html";
}

function redirectToGETU_modification(){
    window.location.href = "GETU_modification.html";
}

function redirectToRecherche_GETU(){
    window.location.href = "GETU_recherche.html";
}

function redirectToOffres(){
    window.location.href = "offres_stages.html";
}



// BACKEND AVEC LA DATABASE A FAIRE


function redirectToPresentationOffre(){
    window.location.href = "presentation_offre.html";

}

//-----------------------------------------------------------------------------------------------------------------------------------------------//

//affichage de deconnexion dans la navbar 

function showLogout() {
    var deconnexionLink = document.querySelector('.Deconnexion');
    deconnexionLink.style.visibility = 'visible';
}

function hideLogout() {
    var deconnexionLink = document.querySelector('.Deconnexion');
    deconnexionLink.style.visibility = 'hidden';
}




/* offres de stages */ 


function OpenFilters(){
    let doc = document.getElementById("colonne1");
    let options = doc.getElementsByClassName("divFiltre");
    for(let i = 0; i < options.length; i++) {
        let element = options[i];
        if (element.style.display == 'none') {
            element.style.display = 'block';
        } else {
            element.style.display = 'none';
        }
    }
}





    // Filtres 
    function filters(){
        let dureemin = document.getElementById("dureemin").value
        let dureemax = document.getElementById("dureemax").value
        let salairemin = document.getElementById("salairemin").value
        let salairemax = document.getElementById("salairemax").value

        if(dureemin == '0'){
            document.getElementById("dureemin").value = "";
        }
        if(dureemax == '0'){
            document.getElementById("dureemax").value = "";
        }
        if(salairemin == '0'){
            document.getElementById("salairemin").value = "";
        }
        if(salairemax == '0'){
            document.getElementById("salairemax").value = "";
        }
    }


    function PromotionFilter(){
        let options = document.getElementsByClassName("hidePromo");
        for(let i = 0; i < options.length; i++) {
            let element = options[i];
            if (element.style.display == 'none') {
                element.style.display = 'block';
            } else {
                element.style.display = 'none';
            }
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


    function DureeFilter(){
        let option1 = document.getElementsByClassName('hideDuree');
        let option2 = document.getElementsByClassName('inputDuree');
        let option3 = document.getElementsByClassName('outputDuree');
        let variables = [option1, option2, option3];
        for(let j = 0; j < variables.length; j++){
            let elements = variables[j];
            if(variables[j] == option1){
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
            else {
                for(let i = 0; i < elements.length; i++){
                    let element = elements[i];
                    if(element.style.display == 'none'){
                        element.style.display ='inline';
                    }
                    else {
                        element.style.display = 'none';
                    }
                }
            }
        }
    }


    function SalaireFilter(){
        let option1 = document.getElementsByClassName('hideSalaire');
        let option2 = document.getElementsByClassName('inputSalaire');
        let option3 = document.getElementsByClassName('outputSalaire');
        let variables = [option1, option2, option3];
        for(let j = 0; j < variables.length; j++){
            let elements = variables[j];
            if(variables[j] == option1){
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
            else {
                for(let i = 0; i < elements.length; i++){
                    let element = elements[i];
                    if(element.style.display == 'none'){
                        element.style.display ='inline';
                    }
                    else {
                        element.style.display = 'none';
                    }
                }
            }
        }
    }


    function PlacesFilter(){
        let option1 = document.getElementsByClassName('hidePlaces');
        let option2 = document.getElementsByClassName('inputPlaces');
        let variables = [option1, option2];
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



function verifNumber(inputElement){
    let value = inputElement.value;
    if(value == 0){
        inputElement.value = '';
    }
}




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



//Entreprises

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


/* Presentation Offre en fonction de l'utilisateur */

function LikeDislike() {
    var option = document.getElementById("like");
    option.classList.toggle("liked");
}

/*
function(user) {
    if (user vient de la table étudiant) {
        document.getElementById("masquer").syle.display = "none";
        document.PilotesFonctionsOffre.syle.display = "none";
    }
    else {
        document.getElementById("like").syle.display = "none";
        document.DivValidationButton.syle.display = "none";
    }
}
 */

function deleteOffre() {

}

function modifyOffre() {

}








//gestion entreprise


function ValidationCandidature(){
    var fichier1 = document.getElementById("file1").value;
    var fichier2 = document.getElementById("file2").value;
    var txt = document.getElementById("commentaire").value;
    if (txt == ""){
        alert("Veuillez entrer un text");
        return false;
    }
    else if(fichier1 == "" || fichier2 == ""){
        alert("Veuillez insérer vos fichiers");
        return false;
    }
    else {
        alert("Votre candidature à été envoyée");
        window.location.href = "presentation_offre.html"; // marche pas
        return false;
    }
}



function CreerOffre(){
    //var logo = document.getElementById("logoCreerOffre").value;
    var titre = document.getElementById("titreCreerOffre").value;
    var description = document.getElementById("descriptionCreerOffre").value;
    //var competences = document.getElementById("competencesCreerOffre").value;
    /*if(logo == ""){
        alert("Veuillez insérer le logo de l'entreprise");
        return false;
    }
    else*/ if (titre == ""){
        alert("Veuillez entrer un titre pour votre offre");
        return false;
    }
    else if (description == ""){
        alert("Veuillez entrer la description de l'offre");
        return false;
    }
    else {
        // creer l'offre 
    }
}

var nbcompetences = 1;

function AddCompetence() {
    var newInput = document.createElement("input");
    newInput.className = "Candidatureinput";
    newInput.type = "text";
    nbcompetences += 1;
    newInput.id = "competence" + nbcompetences; 

    document.getElementById("AddCompetences").appendChild(newInput);
}


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









/* Prochaines fonctions en lien avec le backend */

function voirOffre(numOffre){
    //var offre = numOffre;
    //ce sera du backend pour le l'affichage des bonnes données
    window.location.href = "presentation_offre.html";
    return false;
}

function voirEntreprise(){
    window.location.href = "presentation_entreprise.html";
    return false;
}

function redirectToProfil() {
    // Exécuter la vérif des données entrées avant la redirection 
    //pour la bonne page profile
    alert("pilote");
    window.location.href = "profil_utilisateur_pilote.html";
    //
//backend php

}

function redirectToOffreFromEnt(){
    window.location.href = "offres_stages.html";
    // avec le filtre de recherche du nom de l'entreprise pour seulement afficher les offres de celle ci 
}

/*
CheckFiltresOffre()
//permet de check les filtres sélectionnés pour trouver les offres liées 

document.addEventListener(getElementById("chercher_offre")).onchange
*/

function EvaluateETU() {
    var elementParent = document.getElementById("EvaluationDiv");
    document.getElementById("EvaluationETU").style.display = 'none';
    elementParent.innerHTML ="<br>";
    elementParent.innerHTML += "<input type='number' max='5' min='0' placeholder='note'>";
    elementParent.innerHTML += "<center><button id='Evaluation' class='Profil' type='button' onclick='EvaluationETU()'>Valider</button></center>";
}

function EvaluationETU(){
    var element = document.getElementById("EvaluationDiv");
    element.style.display="none";
    //rajouter l'envoie de la note au php
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

    var selectVilles = document.getElementById(ElementSelect); // Déplacer cette ligne ici

    selectVilles.addEventListener("change", function() {
        var ElementVille = "Ville" + index + "_entreprise";
        document.getElementById(ElementVille).value = this.value;
        this.style.display = 'none';   
    });
}
