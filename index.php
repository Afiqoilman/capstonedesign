<?php
session_start();
include 'koneksi.php';
?>

<?php include 'header.php'; ?>
<div class="hero-wrap" style="background-image: url('foto/bgutama.jpg');" data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-8 ftco-animate d-flex align-items-end">
				<div class="text w-100 text-center">
					<h1 class="mb-4">Selamat<span> Datang</span> Di <span>Roti Bakar 15</span>.</h1>
					<p><a href="produk.php" class="btn btn-primary py-2 px-4">Menu Kami</a></p>
				</div>
			</div>
		</div>
	</div>
</div>

<section class="ftco-intro">
	<div class="container">
		<div class="row no-gutters">
			<div class="col-md-6 d-flex">
				<div class="intro color-1 d-lg-flex w-100 ftco-animate">
					<div class="icon">
						<span class="flaticon-cashback"></span>
					</div>
					<div class="text">
						<h2>Harga Terjangkau</h2>
						<p>Nikmati roti bakar lezat kami dengan harga mulai dari Rp15.000 per porsi, dan pilihan topping spesial mulai dari Rp20.000.</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 d-flex">
				<div class="intro color-2 d-lg-flex w-100 ftco-animate">
					<div class="icon">
						<span class="flaticon-shopping-bag"></span>
					</div>
					<div class="text">
						<h2>Roti Bakar Berkualitas</h2>
						<p>Kami hanya menggunakan roti dan bahan-bahan terbaik untuk menghasilkan rasa yang sempurna dan memuaskan.</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="ftco-section ftco-no-pb">
	<div class="container">
		<div class="row">
			<div class="col-md-6 img img-3 d-flex justify-content-center align-items-center">
				<img src="foto/bgkiri.jpg" width="100%" style="border-radius: 10px">
			</div>
			<div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5">
				<div class="heading-section">
					<h3 class="mt-4">Tentang Kami</h3>
					<p>Roti Bakar 15 adalah tempat favorit untuk menikmati roti bakar dengan rasa autentik dan beragam topping lezat. Berlokasi strategis di Jalan Raya Pasar Sedati Mojokerto, kami hadir untuk memenuhi keinginan Anda akan camilan yang nikmat, terjangkau, dan berkualitas.</p>
				</div>

			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center pb-5">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">Menu</span>
				<h2>Menu Kami</h2>
			</div>
		</div>
		<div class="row">
			<?php
			$ambil = $koneksi->query("SELECT * FROM produk LEFT JOIN kategori ON produk.idkategori=kategori.idkategori ORDER BY idproduk DESC LIMIT 3");
			while ($perproduk = $ambil->fetch_assoc()) {
				// Validasi apakah gambar ada
				$gambarPath = 'foto/' . $perproduk['fotoproduk'];
				$gambarExists = file_exists($gambarPath) && !empty($perproduk['fotoproduk']);
			?>
				<div class="col-md-4 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center" style="background-image: url('<?php echo $gambarExists ? $gambarPath : 'foto/default.jpg'; ?>');">
							<div class="desc">
								<p class="meta-prod d-flex">
									<a href="detail.php?id=<?php echo $perproduk['idproduk']; ?>" class="d-flex align-items-center justify-content-center">
										<span class="flaticon-visibility"></span>
									</a>
								</p>
							</div>
						</div>
						<div class="text text-center">
							<span class="category"><?= $perproduk['namakategori'] ?></span>
							<h2><?php echo $perproduk["namaproduk"] ?></h2>
							<p class="mb-0">
								<span class="price">Rp <?php echo number_format($perproduk['hargaproduk']) ?></span>
							</p>
						</div>
					</div>
				</div>
			<?php } ?>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-4">
				<a href="produk.php" class="btn btn-primary d-block">Lihat Semua Menu <span class="fa fa-long-arrow-right"></span></a>
			</div>
		</div>
	</div>
</section>

<?php
include 'footer.php';
?>