<?php
session_start();
include 'koneksi.php';
?>
<?php
$idproduk = $_GET["id"];
$ambil = $koneksi->query("SELECT*FROM produk WHERE idproduk='$idproduk'");
$detail = $ambil->fetch_assoc();
$kategori = $detail["idkategori"];
?>
<?php include 'header.php'; ?>
<section class="hero-wrap hero-wrap-2" style="background-image: url('foto/bgutama.jpg');" data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center">
			<div class="col-md-9 ftco-animate mb-5 text-center">
				<p class="breadcrumbs mb-0"><span class="mr-2"><a>Home <i class="fa fa-chevron-right"></i></a></span><span>Detail Produk <i class="fa fa-chevron-right"></i></span></p>
				<h2 class="mb-0 bread">Detail Produk</h2>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 mb-5 ftco-animate">
				<a href="images/prod-1.jpg" class="image-popup prod-img-bg"><img src="foto/<?php echo $detail["fotoproduk"]; ?>" class="img-fluid" alt="Colorlib Template"></a>
			</div>
			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
				<h3><?php echo $detail["namaproduk"] ?></h3>
				<p class="price"><span>Rp. <?php echo number_format($detail["hargaproduk"]); ?></span></p>
				<br>
				<span style="color: #000;font-size:15pt !important;"><?php echo $detail["deskripsiproduk"]; ?></span>
				<div class="row mt-4">
					<div class="w-100"></div>
					<div class="col-md-12">
						<p style="color: #000;font-size:15pt !important;">Sisa Produk : <?php echo number_format($detail["stokproduk"]); ?></p>
					</div>
				</div>
				<form method="post">
					<div class="form-group">
						<label>Beli Produk</label>
						<input type="number" placeholder="Jumlah" min="1" class="form-control" name="jumlah" max="<?php echo number_format($detail["stokproduk"]); ?>" required></input>
						<br>
						<button class="btn btn-success float-right" name="beli"><i class="fa fa-shopping-cart"></i> Beli</button>
					</div>
				</form>
				<?php
				if (isset($_POST["beli"])) {
					$jumlah = $_POST["jumlah"];
					$_SESSION["keranjang"][$idproduk] = $jumlah;
					echo "<script> alert('Produk Masuk Ke Keranjang');</script>";
					echo "<script> location ='keranjang.php';</script>";
				}
				?>
				<br>
			</div>
		</div>
	</div>
</section>

<?php
include 'footer.php';
?>