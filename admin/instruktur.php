<?php
session_start();
include '../koneksi.php';


if (empty($_SESSION['EMAIL'])) {
  header("Location: ../login.php");
}

$instruktur = mysqli_query($koneksi, "SELECT * FROM instructors");
$rows = mysqli_fetch_all($instruktur, MYSQLI_ASSOC);
$major = mysqli_query($koneksi, "SELECT * FROM majors");
$rowMajors = mysqli_fetch_all($major, MYSQLI_ASSOC);
$user = mysqli_query($koneksi, "SELECT * FROM users");
$rowUsers = mysqli_fetch_all($user, MYSQLI_ASSOC);

if (isset($_GET['idDel'])) {
  $id = $_GET['idDel'];

  $cekFOTO = mysqli_query($koneksi, "SELECT foto FROM about WHERE id = $id");
  $rowcekFoto = mysqli_fetch_assoc($cekFOTO);
  if ($rowcekFoto && file_exists("../assets/uploads/" . $fotoLama['foto'])) {
    unlink("../assets/uploads/" . $rowcekFoto['foto']);
    $delete = mysqli_query($koneksi, "DELETE FROM about WHERE id = $id");
    if ($delete) {
      header("Location: instruktur.php");
    }
  }

}

?>
<!DOCTYPE html>
<html lang="en">

<?php include '../inc/head.php'; ?>

<body>

  <!-- ======= Header ======= -->
  <?php  include "../inc/header.php"; ?>
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <?php  include "../inc/sidebar.php"; ?>
  <!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>About</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard.php">About</a></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active">Blank</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">About</h5>
              <div class="table table-responsive">
                <a class="btn btn-primary mb-2" href="edit-instruktur.php">CREATE</a>
                <table class="table table-bordered">
                  <tr>
                    <th>No</th>
                    <th>Major</th>
                    <th>User</th>
                    <th>Tittle/Gelar</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Photo</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                  <?php
                  $no = 1;
                  foreach ($rows as $row) {
                  ?>
                    <tr>
                      <td><?= $no++ ?></td>
                      <td><?= $row['majors_id'] ?></td>
                      <td><?= $row['user_id'] ?></td>
                      <td><?= $row['title'] ?></td>
                      <td><?= $row['gender'] ?></td>
                      <td><?= $row['address'] ?></td>
                      <td><?= $row['phone']?></td>
                      <td><img width="150" src="../assets/uploads/<?= $row['foto'] ?>" alt=""></td>
                      <td><?= $row['is_active'] ?></td>
                      <td><a href="edit-instruktur.php?Edit=<?php echo $row['id'] ?>" class="btn btn-success btn-sm">Edit</a>
                      <a onclick="return confirm ('Yakin ingin menghapus?')" href="instruktur.php?idDel=<?php echo $row['id'] ?>" class="btn btn-danger btn-sm">Delete</a>
                      </td>
                    </tr>
                  <?php
                  } ?>
                </table>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <?= include '../inc/footer.php'; ?>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../assets/vendor/echarts/echarts.min.js"></script>
  <script src="../assets/vendor/quill/quill.js"></script>
  <script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

</body>

</html>