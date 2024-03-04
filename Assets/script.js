

function redirectToAccueil() {
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

function redirectToProfil() {
    // Exécuter la vérif des données entrées avant la redirection 
    //pour la bonne page profile
}

function redirectToPostulation() {
    window.location.href = "candidature.html";
}



/* offres de stages */ 

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


function voirOffre(numOffre){
    //var offre = numOffre;
    //ce sera du backend pour le l'affichage des bonnes données
    window.location.href = "presentation_offre.html";
    return false;
}











