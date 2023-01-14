<!DOCTYPE html>
<html>
<head>
	<title><?php echo isset($title) ? "BERKAH SELALU &middot; ".$title: 'Halaman Baru'; ?></title>

	<link rel="stylesheet" type="text/css" href="assets/style.css">
</head>
<body>
	<div class="navbar">
		<div class="pull-right">
			<li class="loggedAs">Halo, <?php echo $data['NamaLengkap']; ?></li>
			<li><a href="index.php?process=logout">Logout</a></li>
		</div>
	</div>
	<div class="sidebar">
		<li class="brand">
			<a href="">BERKAH SELALU</a>
		</li>
		<?php 
			if($data['Level'] == "Pelanggan") {
		?>
		<li><a href="index.php?pages=home-pelanggan">Dashboard</a></li>
		<li><a href="index.php?pages=tagihan" <?php echo $_GET['pages'] == "tagihan" ? 'class="active"': ''; ?>>Tagihan</a></li>
		<li><a href="index.php?pages=pembayaran" <?php echo $_GET['pages'] == "pembayaran" ? 'class="active"': ''; ?>>Pembayaran</a></li>
		<?php	
			} else {
		?>
		<li><a href="index.php?pages=home-admin">Dashboard</a></li>
		<li><a href="index.php?pages=tarif" <?php echo $_GET['pages'] == "tarif" ? 'class="active"': ''; ?>>Tarif</a></li>
		<li><a href="index.php?pages=pelanggan" <?php echo $_GET['pages'] == "pelanggan" ? 'class="active"': ''; ?>>Pelanggan</a></li>
		<li><a href="index.php?pages=tagihan" <?php echo $_GET['pages'] == "tagihan" ? 'class="active"': ''; ?>>Tagihan</a></li>
		<li><a href="index.php?pages=pembayaran" <?php echo $_GET['pages'] == "pembayaran" ? 'class="active"': ''; ?>>Pembayaran</a></li>
		<?php
			}
		?>
	</div>

	<div class="content">
		
		
	