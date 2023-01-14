<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
	<!--  If you want to help us go here https://www.bootdey.com/help-us -->
    <title>BERKAH SELALU &middot; Regist</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<?php
$connect = mysqli_connect("localhost", "root", "", "listrik_pascabayar");

$result = mysqli_query($connect, 'SELECT COUNT(*) AS NoPelanggan FROM tb_pelanggan');
$row = mysqli_fetch_array($result);
$NoPelanggan = $row['NoPelanggan'];

if($_SERVER['REQUEST_METHOD'] === "POST") {
    	$NoPelanggan = $_POST['NoPelanggan'];
		$Password = $_POST['Password'];
		$NoMeter = $_POST['NoMeter'];
		$KodeTarif = $_POST['KodeTarif'];
		$NamaLengkap = $_POST['NamaLengkap'];
		$Telp = $_POST['Telp'];
		$Alamat = $_POST['Alamat'];

		$insertQuery 	= mysqli_query($connect, "INSERT INTO tb_login VALUES('','$NoPelanggan','$Password','$NamaLengkap','Pelanggan')");
		
		if($insertQuery) {
			$insertPelanggan = mysqli_query($connect, "INSERT INTO tb_pelanggan VALUES('','$NoPelanggan','$Password','$NoMeter','$KodeTarif','$NamaLengkap','$Telp','$Alamat')");
			
            if($insertPelanggan){
                echo"data berhasil ditambahakan";
            }else{
                echo"data tidak berhasil ditambahakan";
            }
            
        }else{
            echo"data berhasil ditambahakan";
        }
}else{


?>
<div id="main-wrapper" class="container">
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card border-0 mb-3">
                <div class="card-body p-0">
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="mb-5">
                                    <h3 class="h4 font-weight-bold text-theme">Register</h3>
                                </div>

                                <h6 class="h5 mb-0">Welcome back!</h6>
                                <p class="text-muted mt-2 mb-5">Regist to Login at website.</p>

                                <form action="" method="POST">
									<div class="form-group">
				                		<label for="NoPelanggan">No Pelanggan</label>
				                		<input type="text" class="form-control" name="NoPelanggan" value="<?php echo "PLG".$NoPelanggan ?>" id="NoPelanggan" readonly required>
			                		</div>
									<div class="form-group">
                                		<label for="Password">Password</label>
                                	<input type="text" class="form-control" id="Password" name="Password" required>
                            </div>
							
			                <div class="form-group">
				                <label for="NoMeter">No Meter</label>
                                <input type="text" class="form-control" id="NoMeter" name="NoMeter" required>
                            </div>
                            <div class="form-group">
                                <label for="KodeTarif">Daya / Tarif Per Kwh</label>
                                <select name="KodeTarif" class="form-control" id="KodeTarif" required>
                                    <option value="">Pilih Tarif</option>
                                    <?php 
                                    //Select Tarif
                                    $selectQueryTarif = mysqli_query($connect, "SELECT * FROM tb_tarif ORDER BY KodeTarif DESC");
                                    if(mysqli_num_rows($selectQueryTarif) > 0) {
                                        while($tarif = mysqli_fetch_assoc($selectQueryTarif)) {
                                            echo '<option value="'.$tarif['KodeTarif'].'">'.$tarif['Daya'].' Watt / Rp '.number_format($tarif['TarifPerKwh'], 0, '', '.').'</option>';
                                        }
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="NamaLengkap">Nama Lengkap</label>
                                <input type="text" class="form-control" id="NamaLengkap" name="NamaLengkap" required>
                            </div>
                            <div class="form-group">
                                <label for="Telp">Telp</label>
                                <input type="text" class="form-control" id="Telp" name="Telp" required>
                            </div>
                            <div class="form-group">
                                <label for="Alamat">Alamat</label>
                                <textarea name="Alamat" id="Alamat" class="form-control" cols="30" rows="2" required></textarea>			
                            </div>
                                    
                                    <button type="submit" class="btn btn-theme">Regist</button>
								</form>
                            </div>
                        </div>

                        <div class="col-lg-6 d-none d-lg-inline-block">
                            <div class="account-block rounded-right">
                                <div class="overlay rounded-right"></div>
                                <div class="account-testimonial"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end card-body -->
            </div>
            <!-- end row -->

        </div>
        <!-- end col -->
    </div>
    <!-- Row -->
</div>

<style type="text/css">
body{
    margin-top:20px;
    background: #f6f9fc;
}
.account-block {
    padding: 0;
    background-image: url(https://i.pinimg.com/564x/8a/d0/c8/8ad0c8d6aeddc0c0c09f16854f756e13.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    height: 100%;
    position: relative;
}
.account-block .overlay {
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.4);
}
.account-block .account-testimonial {
    text-align: center;
    color: #fff;
    position: absolute;
    margin: 0 auto;
    padding: 0 1.75rem;
    bottom: 3rem;
    left: 0;
    right: 0;
}

.text-theme {
    color: #5369f8 !important;
}

.btn-theme {
    background-color: #5369f8;
    border-color: #5369f8;
    color: #fff;
}
</style>

<script type="text/javascript">

</script>
<?php } ?>
</body>
</html>
