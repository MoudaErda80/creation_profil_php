<?php
session_start();
require'../db/connectiondb.php';
$sms="";
if (isset($_SESSION['id']) AND $_SESSION['id']>0) {
	$requser=$connectdb->prepare('SELECT * FROM contact WHERE id=?');
	$requser->execute(array($_SESSION['id']));
	$user=$requser->fetch();
	if (isset($_POST['newpseudo']) AND !empty($_POST['newpseudo']) AND $_POST['newpseudo']!= $user['pseudo']){
		$newpseudo=htmlspecialchars($_POST['newpseudo']);
		$updateNewpseudo=$connectdb->prepare('UPDATE contact SET pseudo=? WHERE id=?');
		$updateNewpseudo->execute(array($newpseudo,$_SESSION['id']));
		header('location:../profil/profil.php? id='.$_SESSION['id']);	
	}
	if (isset($_POST['newparcours']) AND !empty($_POST['newparcours'])) {
		$newparcours=htmlspecialchars($_POST['newparcours']);
		$updateNewparcours=$connectdb->prepare('UPDATE contact SET parcours=? WHERE id=?');
		$updateNewparcours->execute(array($newparcours,$_SESSION['id']));
		header('location:../profil/profil.php? id='.$_SESSION['id']);	
	}
	if (isset($_POST['newmail']) AND !empty($_POST['newmail'])){
		$newmail=htmlspecialchars($_POST['newmail']);
		$updatenewmail=$connectdb->prepare('UPDATE contact SET mail=? WHERE id=?');
		$updatenewmail->execute(array($newmail,$_SESSION['id']));
		header('location:../profil/profil.php? id='.$_SESSION['id']);	
	}
	if (isset($_POST['newpassword']) AND !empty($_POST['newpassword']) AND isset($_POST['newpassword2']) AND !empty($_POST['newpassword2'])){
			$newpassword=sha1($_POST['newpassword']);
			$newpassword2=sha1($_POST['newpassword2']);
			if ($newpassword===$newpassword2){
				$updatenewpassword=$connectdb->prepare('UPDATE contact SET password=? WHERE id=?');
				$updatenewpasswordok=$updatenewpassword->execute(array($newpassword,$_SESSION['id']));
				header('location:../profil/profil.php? id='.$_SESSION['id']);
			}else{
				$sms="vos mots de passes ne correspondent pas";
			}
	}
	if (isset($_FILES['file']['name']) AND !empty($_FILES['file']['name'])) {
		$avatar=$_FILES['file']['name'];
		$tailleMax=2097152;
		$extensionValide=array('png','jpg','jpeg','gif');
		if ($_FILES['file']['size']<=$tailleMax) {
			$extensionUpload=strtolower(substr(strrchr($avatar, '.'), 1));
			if (in_array($extensionUpload, $extensionValide)) {
				$chemindef='upload/'.$_SESSION['id'].'.'.$extensionUpload;
				$resultatok=move_uploaded_file($_FILES['file']['tmp_name'], $chemindef);
				if ($resultatok) {
					$updatefile=$connectdb->prepare('UPDATE contact SET avatar=:avatar WHERE id=:id');
					$updatefile->execute(array(
						':avatar'=>$_SESSION['id'].'.'.$extensionUpload,
						':id'=>$_SESSION['id']
						));
					if ($updatefile) {
						header('location:../profil/profil.php? id='.$_SESSION['id']);
					}
				}else{
					$sms="le fichier n'a pas été uploadé";
				}
			}else{
				$sms="votre fichier doit être du type png, jpg, jpeg ou gif";
			}
		}else{
			$sms="votre photo doit être inferieur a 2MO";
		}
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>La page de profil</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="../public/css/app.css">
	<link rel="stylesheet" type="text/css" href="../public/css/header.css">
	<link rel="stylesheet" type="text/css" href="../public/css/sidebar.css">
	<link rel="stylesheet" type="text/css" href="membres_main.css">
</head>
<body>
	<header class="topbar">
	    <a href="" class="topbar-logo">logo</a>
	    <nav class="topbar-nav">
	        <a href="../public/index.php">Accueil</a>
	        <a href="connection.php">Forum</a>
	        <a href="">News</a>
	        <a href="">A propos du site</a>
	        <a href="">Aide</a>
	    </nav>
	</header>
	<div class="container site">
		<main class="main">
			<article class="card">
					<form action="#" method="post" enctype="multipart/form-data" class="card-form">
						<h1 style="text-align: center;font-size: 30px;">Edition du profil</h1>
				           	<h3><?php
									if ($sms) {
										echo $sms;
									}
									?>
								</h3>
							<div class="form-file">
								<input type="file" name="file" id="filename">
							</div>
						<div class="card-pseudo">
							<label for="pseudo">Modifier</label>
							<input type="text" name="newpseudo"  placeholder="pseudo" id="pseudo">
						</div>
						<div class="card-matricule">
							<label for="matricule">Modifier</label>
							<input type="text" name="newmatricule" placeholder="Matricule" id="matricule">
						</div>
						<div class="card-niveau">
							<label for="Niveau">Modifier</label>
							<input type="text" name="newparcours" placeholder="parcours et niveau" id="niveau">
						</div>
						<div class="card-mail">
							<label for="mail">Modifier</label>
							<input type="mail" name="newmail" placeholder="votre E-mail" id="mail">
						</div>
						<div class="card-mdp">
							<label for="password">Modfier</label>
							<input type="password" name="newpassword" placeholder="votre mot de passe" id="password">
						</div>
						<div class="card-mdp2">
							<label for="password2">Modifier</label>
							<input type="password" name="newpassword2" placeholder="Retapez votre mot de passe" id="password2">
						</div>
						<div class="card-btn">
							<input type="submit" name="valider" value="Mettre à jour">
						</div>
					</form>
				</article>
			</main>
		</div>
	</body>
</html>
<?php
}
?>
