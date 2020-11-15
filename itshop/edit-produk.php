<?php
    session_start();
    include 'db.php';
    if($_SESSION['status_login'] != true){
        echo '<script>window.location="login.php" </script>';
    }

    $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_id = '".$_GET['id']."' ");
    if(mysqli_num_rows($produk) == 0){
        echo '<script>window.location="data-produk.php"</script>';
    }
    $p = mysqli_fetch_object($produk);    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ITshop</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
</head>
<body>
    <header>
        <div class="container">
            <h1><a href="dashboard.php">ITshop</h1>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="profil.php">Profile</a></li>
                <li><a href="data-kategori.php">Data Kategori</a></li>
                <li><a href="data-produk.php">Data Produk</a></li>
                <li><a href="keluar.php">Keluar</a></li>
            </ul>
        </div>
    </header>

    <!--content-->
    <div class="section">
        <div class="container">
            <h3>Edit Data Product</h3>
            <div class="box">
               <form action="" method="POST" enctype="multipart/form-data">
                   <select class="input-control" name="kategori" require>
                       <option value=""> ---PILIH---</option>
                       <?php
                       $kategori = mysqli_query($conn, "SELECT * FROM tb_category ORDER BY category_id");
                       while($r = mysqli_fetch_array($kategori)){
                       ?>
                       <option value="<?php echo $r['category_id']?>" <?php echo ($r['category_id']== $p->category_id)?'selected':'';?>><?php echo $r['category_name']?></option>
                       <?php }?>
                   </select>
                    <input type="text" name="nama" class="input-control" placeholder="Nama Product" require value="<?php echo $p->product_name?>">
                    <input type="text" name="harga" class="input-control" placeholder="Harga" require value="<?php echo $p->product_price?>">
                    <img src="produk/<?php echo $p->product_image?>" width="200px">
                    <input type="hidden" name="foto" value="<?php echo $p->product_image?>">
                    <input type="file" name="gambar" class="input-control">
                    <textarea class="input-control" name="deskripsi" placeholder="Deskripsi"> <?php echo $p->product_description?></textarea><br>
                    <select class="input-control" name="status">
                        <option value="">---PILIH---</option>
                        <option value="1" <?php echo($p->product_status == 1)?'selected':'';?>>Aktif</option>
                        <option value="0" <?php echo($p->product_status == 0)?'selected':'';?>>Tidak Aktif</option>
                    </select>
                    <input type="submit" name="submit" value="Submit" class="btn">
               </form>
              <?php
                if(isset($_POST['submit'])){
                    
                    //data inputan dari form
                    $kategori = $_POST['kategori'];
                    $nama = $_POST['nama'];
                    $harga = $_POST['harga'];
                    $deskripsi = $_POST['deskripsi'];
                    $status = $_POST['status'];
                    $foto = $_POST['foto'];
                    //tampung data gambar yang baru
                    $filename = $_FILES['gambar']['name'];
                    $tmp_name = $_FILES['gambar']['tmp_name'];

                    $type1 = explode('.', $filename);
                    $type2 = $type1[1];

                    $newname = 'produk'.time().'.'.$type2;
                    //menampung data format file yang diizinkan
                    $tipe_diizinkan = array( 'jpg', 'jpeg', 'png', 'gif');
                    //jika admin ganti gambar
                    if($filename != ''){

                        if(!in_array($type2,$tipe_diizinkan)){
                            //jika format file tidak sesuai dengan yang ada di dalam array tipe diizinkan
                            echo '<script>alert("Format file tidak diizinkan")</script>';
                            //echo 'gagal'.mysqli_error($conn);
                        }else{
                            unlink('./produk/'.$foto);
                            move_uploaded_file($tmp_name,'./produk/'.$newname);
                            $namagambar = $newname;
                        }

                    }else{
                        //jika admin tidak ganti gambar

                        $namagambar =$foto;
                    }

                    //query data produk
                    $update = mysqli_query($conn, "UPDATE tb_product SET
                                            category_id = '".$kategori."',
                                            product_name = '".$nama."',
                                            product_price = '".$harga."',
                                            product_description = '".$deskripsi."',
                                            product_image = '".$namagambar."',
                                            product_status = '".$status."' 
                                            WHERE product_id = '".$p->product_id."' ");
                    if($update){
                        echo '<script>alert("Update data berhasil")</script>';
                        echo '<script>window.location="data-produk.php"</script>';
                       
                         
                     }else{
                         echo 'gagal'.mysqli_error($conn);
                     }
                }
              
              ?>
            </div>

        </div>
    </div>

    <!--Footer-->
    <footer>
        <div class="container">
            <small>Copyright &copy; ITshop 2020 | Wendy Noer Isnaeni</small>
        </div>
    </footer>
    <script>
            CKEDITOR.replace( 'deskripsi' );
    </script>
</body>
</html>