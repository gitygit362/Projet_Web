// redirections 
console.log("js connected");

function redirectToAccueilFromConnexion(event) {

    event.preventDefault();

    var identifiant = document.getElementById("user").value;
    var motdepasse = document.getElementById("password").value;

   var data = {
        user: identifiant,
        passwd: motdepasse
   }
   var xhr = new XMLHttpRequest();
   xhr.open('POST', '../Modèle/connexion.php', true);
   xhr.setRequestHeader('Content-Type', 'application/json');
   xhr.onload = function () {
    if (xhr.status >= 200 && xhr.status < 300) {
        //on rentre la 
        var response = xhr.responseText.trim();
        if (response === 'true') {
            alert("Authentification réussie");
            window.location.href = '../Modèle/accueil.php';
        } else {
            alert("Identifiant ou mot de passe incorrect");
        }
    } else {
        alert("Erreur lors de la requête1");
    }
};
   xhr.onerror = function () {
    alert("Erreur lors de la requête");
    };


   var userData = JSON.stringify(data);
   xhr.send(userData);
   return false;
}

function redirectToAccueilGPform(event){
    event.preventDefault();
    alert("test");
    var nom_pilote = document.getElementById("nom_pilote").value;
    var prenom_pilote = document.getElementById("prenom_pilote").value;
    var centre_pilote = document.getElementById("centre_pilote").value;
    var promo_pilote =  document.getElementById("promo_pilote").value;
    
    if (nom_pilote.trim() === '' || prenom_pilote.trim() === '' || centre_pilote.trim() === '' || promo_pilote.trim() === '') {
        alert("Veuillez remplir tous les champs.");
        return;
    }

    var data = {
        nom: nom_pilote,
        prenom: prenom_pilote,
        centre: centre_pilote,
        promo: promo_pilote
    };
    alert ("data = "+data)
    var xhr = new XMLHttpRequest();
    xhr.open("POST","../../Controler/users.php?action=createpilote",false);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var response = xhr.responseText;
            if (response === 'true') {
                alert("profil créé avec succès");
                window.location.href = 'GP_accueil.html';
            } else {
                alert("Erreur : le profil n'a pas été créé");
            }
        } else {
            alert ("Erreur : Impossible de contacter le serveur");
            alert (xhr.status);
        }
    };
    xhr.onerror = function () {
        alert("Erreur : Impossible de contacter le serveur");
    };
    xhr.send(JSON.stringify(data));
}










//utilisation php de page connexion

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

function redirectToPrecPageOffre() {
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

function redirectToAccueilGPEdit(event){
    event.preventDefault();
    var nom_pilote = document.getElementById("nom_pilote").value;
    var prenom_pilote = document.getElementById("prenom_pilote").value;
    var centre_pilote = document.getElementById("centre_pilote").value;
    var promo_pilote =  document.getElementById("promo_pilote").value;

    var url = new URL(window.location.href);
    var id_user = url.searchParams.get("id_user");  

    if (nom_pilote.trim() === '' || prenom_pilote.trim() === '' || centre_pilote.trim() === '' || promo_pilote.trim() === '') {
        alert("Veuillez remplir tous les champs.");
        return;
    }

    var data = {
        nom: nom_pilote,
        prenom: prenom_pilote,
        centre: centre_pilote,
        promo: promo_pilote,
        id: id_user
    };

    var xhr = new XMLHttpRequest();
    xhr.open("POST","../../Controler/users.php?action=editpilote",false);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var response = xhr.responseText;
            if (response === 'true') {
                alert("profil modifié avec succès");
                window.location.href = "GP_accueil.html";
            } else {
                alert("Erreur : le profil n'a pas pu être modifier");
            }
        } else {
            alert ("Erreur : Impossible de contacter le serveur");
            alert (xhr.status);
        }
    };
    xhr.onerror = function () {
        alert("Erreur : Impossible de contacter le serveur");
    };
    xhr.send(JSON.stringify(data));
}

function Profil_Pil(event){
    event.preventDefault();
    var nom_pilote = document.getElementById("nom_pilote").value;
    var prenom_pilote = document.getElementById("prenom_pilote").value;
    var centre_pilote = document.getElementById("centre_pilote").value;
    var promo_pilote =  document.getElementById("promo_pilote").value;

    if (nom_pilote.trim() === '' || prenom_pilote.trim() === '' || centre_pilote.trim() === '' || promo_pilote.trim() === '') {
        alert("Veuillez remplir tous les champs.");
        return;
    }
    
    var data = {
        nom: nom_pilote,
        prenom: prenom_pilote,
        centre: centre_pilote,
        promo: promo_pilote,
    };

    var xhr = new XMLHttpRequest();
    xhr.open("POST","../../Controler/users.php?action=recherchepilote",false);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var response = xhr.responseText;
            response = response.split('.');
            if (response[0] === 'true') {
                alert("profil trouvé avec succès");
                window.location.href = "../profil_utilisateur_pilote.html?id_user="+response[1];
            } else {
                alert("Erreur : le profil n'a pas pu être trouver");
            }
        } else {
            alert ("Erreur : Impossible de contacter le serveur");
            alert (xhr.status);
        }
    };
    xhr.onerror = function () {
        alert("Erreur : Impossible de contacter le serveur");
    };
    xhr.send(JSON.stringify(data));
}


function redirectToAccueilGPSuppr(event){
    event.preventDefault();
    var nom_pilote = document.getElementById("nom_pilote").value;
    var prenom_pilote = document.getElementById("prenom_pilote").value;
    var centre_pilote = document.getElementById("centre_pilote").value;
    var promo_pilote =  document.getElementById("promo_pilote").value;
    
    if (nom_pilote.trim() === '' || prenom_pilote.trim() === '' || centre_pilote.trim() === '' || promo_pilote.trim() === '') {
        alert("Veuillez remplir tous les champs.");
        return;
    }

    var data = {
        nom: nom_pilote,
        prenom: prenom_pilote,
        centre: centre_pilote,
        promo: promo_pilote
    };

    var xhr = new XMLHttpRequest();
    xhr.open("POST","../../Controler/users.php?action=supprpilote",false);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var response = xhr.responseText;
            alert(response);
            if (response === 'true') {
                alert("profil supprimé avec succès");
                window.location.href = 'GP_accueil.html';
            } else {
                alert("Erreur : le profil n'a pas pu être supprimer");
            }
        } else {
            alert ("Erreur : Impossible de contacter le serveur");
            alert (xhr.status);
        }
    };
    xhr.onerror = function () {
        alert("Erreur : Impossible de contacter le serveur");
    };
    xhr.send(JSON.stringify(data));
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


function redirectToGETU_modification(event){
    event.preventDefault();
    var nom_etudiant = document.getElementById("nom_etudiant").value;
    var prenom_etudiant = document.getElementById("prenom_etudiant").value;
    var centre_etudiant = document.getElementById("centre_etudiant").value;
    var promo_etudiant =  document.getElementById("promo_etudiant").value;
    
    if (nom_etudiant.trim() === '' || prenom_etudiant.trim() === '' || centre_etudiant.trim() === '' || promo_etudiant.trim() === '') {
        alert("Veuillez remplir tous les champs.");
        return;
    }
    var data = {
        nom: nom_etudiant,
        prenom: prenom_etudiant,
        centre: centre_etudiant,
        promo: promo_etudiant
    };

    var xhr = new XMLHttpRequest();
    xhr.open("POST","../../Controler/users.php?action=preeditetudiant",true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var response = xhr.responseText;
            response = response.split('.');
            alert(response);
            if (response[0] === 'true') {
                alert("profil trouvé avec succès");
                window.location.href = "GETU_modification.html?id_user="+response[1];
            } else {
                alert("Erreur : le profil est introuvable");
            }
        } else {
            alert ("Erreur : Impossible de contacter le serveur");
            alert (xhr.status);
        }
    };
    xhr.onerror = function () {
        alert("Erreur : Impossible de contacter le serveur");
    };
    xhr.send(JSON.stringify(data));
}




// gestion etudiant redirection
function redirectToAccueilGETU(){
    window.location.href = "GETU_accueil.html";
}





function redirectToAccueilGETUCreate(event){
    event.preventDefault();
    var nom_etudiant = document.getElementById("nom_etudiant").value;
    var prenom_etudiant = document.getElementById("prenom_etudiant").value;
    var centre_etudiant = document.getElementById("centre_etudiant").value;
    var promo_etudiant =  document.getElementById("promo_etudiant").value;
    
    if (nom_etudiant.trim() === '' || prenom_etudiant.trim() === '' || centre_etudiant.trim() === '' || promo_etudiant.trim() === '') {
        alert("Veuillez remplir tous les champs.");
        return;
    }

    var data = {
        nom: nom_etudiant,
        prenom: prenom_etudiant,
        centre: centre_etudiant,
        promo: promo_etudiant
    };

    var xhr = new XMLHttpRequest();
    xhr.open("POST","../../Controler/users.php?action=creeretudiant",false);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var response = xhr.responseText;
            if (response === 'true') {
                alert("profil créé avec succès");
                window.location.href = 'GETU_accueil.html';
            } else {
                alert("Erreur : le profil n'a pas été créé");
            }
        } else {
            alert ("Erreur : Impossible de contacter le serveur");
            alert (xhr.status);
        }
    };
    xhr.onerror = function () {
        alert("Erreur : Impossible de contacter le serveur");
    };
    xhr.send(JSON.stringify(data));
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


function redirectToGP_modification(event){
    event.preventDefault();
    var nom_pilote = document.getElementById("nom_pilote").value;
    var prenom_pilote = document.getElementById("prenom_pilote").value;
    var centre_pilote = document.getElementById("centre_pilote").value;
    var promo_pilote =  document.getElementById("promo_pilote").value;
    
    if (nom_pilote.trim() === '' || prenom_pilote.trim() === '' || centre_pilote.trim() === '' || promo_pilote.trim() === '') {
        alert("Veuillez remplir tous les champs.");
        return;
    }

    var data = {
        nom: nom_pilote,
        prenom: prenom_pilote,
        centre: centre_pilote,
        promo: promo_pilote
    };

    var xhr = new XMLHttpRequest();
    xhr.open("POST","../../Controler/users.php?action=preeditpilote",true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            var response = xhr.responseText;
            response = response.split('.');
            if (response[0] === 'true') {
                alert("profil trouvé avec succès");
                window.location.href = "GETU_modification.html?id_user="+response[1];
            } else {
                alert("Erreur : le profil est introuvable");
            }
        } else {
            alert ("Erreur : Impossible de contacter le serveur");
            alert (xhr.status);
        }
    };
    xhr.onerror = function () {
        alert("Erreur : Impossible de contacter le serveur");
    };
    xhr.send(JSON.stringify(data));
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

/* Prochaines fonctions en lien avec le backend */

// ------------------------ Acces au profil ----------------------------
function redirectToProfil(statut) {
    var Statut = statut;
    window.location.href = "../View/profil_utilisateur_" + Statut + ".html";
        // dans le profil on va chercher les infos 
}


function deconnexion(event) {
    event.preventDefault(); // Empêcher le comportement par défaut du lien
    
    var xhr = new XMLHttpRequest();

    xhr.open('GET', '../Controler/session.php?action=supprimerSession', true);

    xhr.onload = function() {
        if (xhr.status >= 200 && xhr.status < 300) {
            window.location.href = '../View/page_connexion.html';
        } else {
            console.error('Erreur lors de la requête : ' + xhr.status);
        }
    };
    xhr.send();
}














/* Prochaines fonctions en lien avec le backend */

function redirectToOffreFromEnt(){
    window.location.href = "offres_stages.html";
    // avec le filtre de recherche du nom de l'entreprise pour seulement afficher les offres de celle ci 
}
