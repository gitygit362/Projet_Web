
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