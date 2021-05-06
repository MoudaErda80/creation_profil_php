<?php
session_start();
$sms='';
require'../db/connectiondb.php';
if (isset($_POST['valider'])) {
	$mailcon=htmlspecialchars($_POST['mailcon']);
	$passwordcon=sha1($_POST['passwordcon']);
	#$passwordcon=sha1($_POST['passwordcon']);
	if (!empty($mailcon) AND
	 !empty($passwordcon)) {
		$requser=$connectdb->prepare('SELECT * FROM contact WHERE mail=? AND password=?');
		$requser->execute(array($mailcon,$passwordcon));
		$userexist=$requser->rowcount();
		if ($userexist==1) {
			$userinfo=$requser->fetch();
			$_SESSION['id']=$userinfo['id'];
			$_SESSION['pseudo']=$userinfo['pseudo'];
			$_SESSION['mail']=$userinfo['mail'];
			#header('location:../profil/profil.php?id='.SESSION['id']);
			echo '<meta http-equiv="refresh" content="0;URL=../profil/profil.php?id='.$_SESSION['id'].'">';	
		}else{
			$sms="vous n'avez pas encore un compte ?<br> si vous voulez créer cliquez <a href=\" inscription.php\">ici</a> ";
		}
		
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
	        <a href=""></a>
	        <a href="inscription.php">INSCRIPTION</a>
	        <a href="">CONTACT</a>
	        <a href="">PROFIL</a>
	    </nav>
	</header>
	<div class="container site">
		      <main class="main">
		        <article class="card">
		           <form method="post" action="#" class="card-form">
		           	<h1 style="text-align: center;font-size: 30px;">CONNECTION</h1>
		           	<h3><?php
							if ($sms) {
								echo $sms;
							}
							?>
					</h3>
						<div class="card-mail">
							<label for="mail">E-mail: *</label>
							<input type="mail" name="mailcon" required="true" placeholder="votre E-mail" id="mail">
						</div>
						<div class="card-mdp">
							<label for="password">password: *</label>
							<input type="password" name="passwordcon" required="true" placeholder="votre mot de passe" id="password">
						</div>
						<div class="card-btn">
							<a href="inscription.php">je n'ai pas un compte</a>
							<input type="submit" name="valider" value="se connecter">
						</div>
				   </form>
		        </article>
		    </main>
	</div>
</body>
</html>
<?php

?>s