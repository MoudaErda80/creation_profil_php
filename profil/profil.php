<?php
session_start();

require_once'../db/connectiondb.php';
  
if (isset($_GET['id']) AND $_GET['id']>0){
	$getid=intval($_GET['id']);
	$requser=$connectdb->prepare('SELECT* FROM contact WHERE id=?');
	$requser->execute(array($getid));
	$userinfo=$requser->fetch();
	$avatarHomme="<img src=\"../espace_membres/upload/avatarhomme.png\" width=\"60\" height=\"60\" class=\"card-avatar\">";
	$avatarFemme="<img src=\"../espace_membres/upload/avatarfemme.jpg\" width=\"45\" height=\"45\" class=\"card-avatar\">";
	?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<title>Profil de <?php echo ''.$userinfo['pseudo'].''; ?></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font Awesome -->
<!--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">-->
<!-- Google Fonts-->
<!--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">-->
<!-- Bootstrap core CSS -->
<!--<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">-->
<!-- Material Design Bootstrap -->
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<!--<link rel="stylesheet" type="text/css" href="css/profil.css">-->
	<!--<link rel="stylesheet" type="text/css" href="css/espaceheader.css">-->
	<link rel="stylesheet" type="text/css" href="../public/css/sidebar.css">
	<link rel="stylesheet" type="text/css" href="css/profil_main.css">
	<link rel="stylesheet" type="text/css" href="../public/css/header.css">  
</head>
<body>
	<header class="topbar">
		<nav class="topbar-nav">
			<a href="" class="topbar-logo">logo</a>
			<a href="../public/index.php" class="m-link" title="page d'accueil">Accueil</a>
			<a href="../formation/formation.php?id=<?php #echo $_SESSION['id']; ?>" class="m-link " title="formation">connection</a>
			<a href="../espace_membres/inscription.php" class="m-link" title="forum">inscription</a>
			<a href="#A_propos" class="m-link" title="A propos de Nous">contact</a>
		</nav>
	</header>
	<div class="container site">
		<?php require'../public/header.php'; ?>
		<div class="main">
			 <article class="card-left">
			 	<?php 
				if(isset($userinfo['id']) AND !empty($userinfo['id'])){
						if($userinfo['sex']==='M' AND $userinfo['avatar']===NULL){?>
				<header class="card-header card-header-avatar">	
				  		<a href="#"><?php echo $avatarHomme ;?></a>			
						<?php
						}elseif($userinfo['sex']==='F' AND $userinfo['avatar']===NULL) {?>
						<a href=""><?php echo $avatarFemme ;?></a>
						 <?php
						}else{?>
							<img src="../upload/<?php echo $userinfo['avatar']; ?>" width="45" height="45" class="card-avatar">
					<?php
						}
					?>
					<div class="card-title"><?php echo $userinfo['pseudo'];?></div>
		    		<div class="card-date">Il y a 10 minutes</div>
 				</header>
                <div class="card-body">
								<div class="mt-3">
									<h4>pseudo: <?php echo $userinfo['pseudo']?></h4>
									<a href="">Accueil</a>
									<a href="">Forum</a>
									<a href="">Securité</a>
									<a href="">parametre</a>
									<a href="../espace_membres/edition.php?id=<?php echo $_GET['id']?>">éditer mon profil</a>
									<a href="connection.php">déconnecter</a>
								</div>
                </div>
       		</article>
       		<article class="card-right">
				<h3>Pseudo: <a href=""><?php echo $userinfo['pseudo'];?></a></h3>
				<h3>Matricule: <a href=""><?php echo $userinfo['matricule'];?></a></h3>
				<h3>Parcours et niveau: <a href=""><?php echo $userinfo['parcours'];?></a></h3>
				<h3>E-mail: <a href=""><?php echo $userinfo['mail'];?></a></h3>
				<h3><a href="">déconnecter</a></h3>
	       		<?php
	          	}?>
		</div>
	</div>	
</body>
</html>
<?php
}
?>