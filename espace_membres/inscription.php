<?php
#session_start();
require'../db/connectiondb.php';
$sms="";
if (isset($_POST['valider'])) {
	$pseudo=htmlspecialchars($_POST['pseudo']);
	$matricule=htmlspecialchars($_POST['matricule']);
	$parcours=htmlspecialchars($_POST['parcours']);
	#$prenom=htmlspecialchars($_POST['prenom']);
	$mail=htmlspecialchars($_POST['mail']);
	#$mail2=htmlspecialchars($_POST['mail2']);
	$password=sha1($_POST['password']);
	$password2=sha1($_POST['password2']);
	$sex=htmlspecialchars($_POST['sex']);
	if (!empty($pseudo)  AND !empty($mail) AND !empty($password) AND !empty($password2) AND !empty($sex) AND !empty($parcours) AND !empty($matricule)){
		$strlenpseudo=strlen($pseudo);
		if ($strlenpseudo<=255){
			#if ($mail=$mail2) {
				if (filter_var($mail,FILTER_VALIDATE_EMAIL)) {
					$pdostatment=$connectdb->prepare('SELECT * FROM contact WHERE mail=?');
					$pdostatment->execute(array($mail));
					$mailExiste=$pdostatment->rowcount();
					if ($mailExiste==0){
						if ($password==$password2){
								$insert=$connectdb->prepare('INSERT INTO contact(id,pseudo,matricule,parcours,mail,password,sex,date_ins,avatar)  VALUES(NULL,?,?,?,?,?,?,NOW(),NULL)');
								$insertOK=$insert->execute(array($pseudo,$matricule,$parcours,$mail,$password,$sex));
								if($insertOK){
									$sms="votre compte a été crée avec succés cliquez <a href=\"connection.php\"> ici</a> pour connecter ";
								}else{
									$sms="une erreur est survenue pouvez-vous ressayer s\'il vous plait";
							}
							
						}else{
							$sms="les deux mots de passe ne correspondent pas";
						}
					}else{
						$sms="ce compte déja existe! cliquez<a href=\"connection.php\">ici</a> pour connecter";
					}
				}
			#}else{
				#$sms="les deux emails ne correspondent pas";
			#}
		}else{
			$sms="la taille de votre pseudo doit être inferieur à 255";
		}

	}else{
		$sms="vos champs ne doivent pas être vides";
	}
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>creation d'un profil</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../public/css/app.css">
	<link rel="stylesheet" type="text/css" href="../public/css/header.css">
	<link rel="stylesheet" type="text/css" href="../public/css/sidebar.css">
	<link rel="stylesheet" type="text/css" href="membres_main.css">
</head>
<body>
	<header class="topbar">
	    <a href="" class="topbar-logo">logo</a>
	    <nav class="topbar-nav">
	        <a href="../public/index.php">ACCUEIL</a>
	        <a href="connection.php">CONNEXION</a>
	        <a href="">INSCRIPTION</a>
	        <a href="">CONTACT</a>
	        <a href="">A PROPOS DE NOUS</a>
	    </nav>
	</header>
	<div class="container site">
		      <main class="main">
		        <article class="card">

		           <form method="POST" action="#" class="card-form">
		           	<h1 style="text-align: center;font-size: 30px;">INSCRIPTION</h1>
		           	<h3><?php
							if ($sms) {
								echo $sms;
							}
							?>
					</h3>
		           		<div class="card-pseudo">
							<label for="pseudo">pseudo: *</label>
							<input type="text" name="pseudo" required="true" placeholder="pseudo" id="pseudo">
						</div>
						<div class="card-matricule">
							<label for="matricule">Matricule:*</label>
							<input type="text" name="matricule" required="true" placeholder="Matricule" id="matricule">
						</div>
						<div class="card-niveau">
							<label for="Niveau">parcours:*</label>
							<input type="text" name="parcours" required="true" placeholder="parcours et niveau" id="niveau">
						</div>
						<div class="card-mail">
							<label for="mail">E-mail: *</label>
							<input type="mail" name="mail" required="true" placeholder="votre E-mail" id="mail">
						</div>
						<div class="card-mdp">
							<label for="password">password: *</label>
							<input type="password" name="password" required="true" placeholder="votre mot de passe" id="password">
						</div>
						<div class="card-mdp2">
							<label for="password2">Retapez: *</label>
							<input type="password" name="password2" required="true" placeholder="Retapez votre mot de passe" id="password2">
						</div>
						<div class="card-mdp2">
							<label >civilité:*</label>
							<input type="radio" name="sex" value="M" class="sex" id="sex">
							<label for="sex">Masculin</label>
							<input type="radio" name="sex" value="F" class="sex" id="sex">
							<label for="sex">Femme</label>
						</div>
						<div class="card-btn">
							<a href="connection.php">j'ai déja un compte</a>
							<input type="submit" name="valider" value="S'inscrit">
						</div>
				   </form>
		        </article>
		    </main>
	</div>
</body>
</html>
<?php

?>