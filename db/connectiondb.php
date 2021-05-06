<?php
// connexion à la base de donnée Erda_db
$dn='mysql: host=localhost;dbname=profil_tp;charset=utf8';
$user='root';
$mdp='weegaouba';
try
{
	$connectdb=NEW PDO($dn,$user,$mdp);
	$connectdb->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e){
	die('connexion a été echouée'.$e->getMessage());
}
?>