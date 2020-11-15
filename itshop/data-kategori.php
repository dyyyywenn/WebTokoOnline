<?php
    session_start();
    include 'db.php';
    if($_SESSION['status_login'] != true){
        echo '<script>window.location="login.php" </script>';
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ITshop</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">

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
            <h3>Data Kategori</h3>
            <div class="box">
                <p><a href="tambah-kategory.php">Tambah Data</a></p>
                <table border="1" cellspacing="0" class="tabel">
                    <thead>
                        <tr>
                            <th width="60px">No</th>
                            <th>Kategori</th>
                            <th width="150px">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $no = 1;
                            $kategori = mysqli_query($conn , "SELECT * FROM tb_category ORDER BY category_id DESC");
                            if(mysqli_num_rows($kategori)>0){

                            
                            while($row = mysqli_fetch_array($kategori)){

                            
                        ?>
                        <tr>
                            <td><?php echo $no++ ?></td>
                            <td><?php echo $row['category_name']?></td>
                            <td>
                                <a href="edit-kategory.php?id=<?php echo $row['category_id']?>">Edit</a> || <a href="proses-hapus.php?idk=<?php echo $row['category_id']?>" onclick="return confirm('Yakin ingin Hapus?')">Hapus</a>
                            </td>
                        </tr>
                            <?php }}else{?>
                                <tr>
                                    <td colspan="3">Data Kosong!</td>
                                </tr>
                          <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!--Footer-->
    <footer>
        <div class="container">
            <small>Copyright &copy; ITshop 2020 | Wendy Noer Isnaeni</small>
        </div>
    </footer>
</body>
</html>