//Entreprises
/*
document.addEventListener('DOMContentLoaded', function() {
    // Sélectionnez tous les liens de page dans la pagination
    var pageLinks = document.querySelectorAll('.pagination a');

    // Parcourez chaque lien de page et ajoutez un gestionnaire d'événements de clic
    pageLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            // Empêchez le comportement par défaut du lien
            event.preventDefault();

            paginationChildren.forEach(function(child) {
                // Faites quelque chose avec chaque enfant, par exemple :
                console.log(child); // Affiche chaque enfant dans la console
            });
            // Supprimez la classe 'active' de tous les liens de page
            pageLinks.forEach(function(link) {
                link.classList.remove('active');
            });

            // Ajoutez la classe 'active' au lien de page cliqué
            this.classList.add('active');
        });
    });
});*/












document.getElementById('masquerInput').addEventListener('change', function () {
    var isChecked = document.getElementById('masquerInput').checked;

    // Si la case à cocher est cochée
    if (isChecked) {
        // Effectuer une requête AJAX en utilisant GET pour appeler la méthode MasquerEntreprise
        var xhr = new XMLHttpRequest();
        xhr.open('PUT', 'entreprises.php?action=MasquerEntreprise', true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    alert("Vous avez masqué cette entreprise. Elle ne sera plus visible dans la recherche.");
                } else {
                    // Erreur lors de la requête AJAX
                    console.error('Erreur lors de la requête AJAX');
                }
            }
        };
        xhr.onerror = function () {
            alert("Erreur lors de la requête masquer");
        };
        xhr.send();
    }
    else {
        var xhr = new XMLHttpRequest();
        xhr.open('PUT', 'entreprises.php?action=VisibleEntreprise', true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    alert("Vous allez rendre visible cette entreprise pour les étudiants. \nCes informations seront prisent en compte dans les statistiques de recherche.");
                } else {
                    // Erreur lors de la requête AJAX
                    console.error('Erreur lors de la requête AJAX');
                }
            }
        };
        xhr.onerror = function () {
            alert("Erreur lors de la requête masquer");
        };
        xhr.send();
    }
}
);





















document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('filtresForm');
    form.addEventListener('submit', function(event) {
        event.preventDefault();

        localisation = document.getElementsByClassName('inputLieu');


        var nom = document.getElementById('inputEntreprise').value.trim() == '' ? 'all' : document.getElementById('inputEntreprise').value;
        var activite = document.getElementById('inputActivite').value.trim() == '' ? 'all' : document.getElementById('inputActivite').value;
        var pays = localisation[0].value.trim() == '' ? 'all' : localisation[0].value.trim();
        var ville = localisation[1].value.trim() == '' ? 'all' : localisation[1].value.trim();
        var adresse = localisation[2].value.trim() == '' ? 'all' : localisation[2].value;
        
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
       
      /*  var data = {
            type: 'filtre',
            nom: nom,
            activite: activite,
            pays: pays,
            ville: ville,
            adresse: adresse,
            evaluationFilter1: filter1Param,
            evaluationFilter2: filter2Param,
            evaluationFilter3: filter3Param,
            evaluationFilter4: filter4Param,
            evaluationFilter5: filter5Param,
            evaluationFilter6: filter6Param,
            NoteAsc: noteAsc,
            NoteDesc: noteDesc,
            LikeAsc: likeAsc,
            LikeDesc: likeDesc

        }*/

        params.append('type', 'filtres');
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
        
        var url = 'entreprises.php?' + params.toString();
       
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);//POST
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    alert("Requête réussie");
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
    });
});





































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




function redirectToPrecPageEnt() {
    var pagePrecedente = document.referrer;
        window.location.href = pagePrecedente;
}




/* Prochaines fonctions en lien avec le backend */


function voirEntreprise(index,recherche){
    var id = index;
    if (recherche === 1) {
        window.location.href = "entreprises.php?id="+ id + "&s=TopEntreprise";
    }
    else if (recherche == 0){
        window.location.href = "entreprises.php?id="+ id + "&s=Onload";
    }
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