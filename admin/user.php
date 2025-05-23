<?php
require_once "../koneksi.php";
session_start();


if (empty($_SESSION['EMAIL'])) {
  header("Location: ../login.php");
}

$user = mysqli_query($koneksi, "SELECT
    u.id AS user_id,
    u.name AS user_name,
    u.id,
    u.email,
    u.password,
    u.is_active,
    r.name AS role_name
FROM
    users u
LEFT JOIN
    user_role ur ON u.id = ur.user_id
LEFT JOIN
    roles r ON ur.role_id = r.id
ORDER BY
    u.id DESC");
$rows = mysqli_fetch_all($user, MYSQLI_ASSOC);

// Query untuk mengambil semua roles tetap diperlukan jika Anda membutuhkannya untuk keperluan lain di halaman ini
$role = mysqli_query($koneksi, "SELECT * FROM roles");
$rowRoles = mysqli_fetch_all($role, MYSQLI_ASSOC);


if (isset($_GET['idDel'])) {

  $id = $_GET['idDel'];

  
  $del = mysqli_query($koneksi, "DELETE FROM users WHERE id = $id");
    if ($del) {
      header("Location: user.php");
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
      <h1>Admin</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
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
              <h5 class="card-title">User</h5>
              <div class="table table-responsive">
                <a class="btn btn-primary mb-2" href="edit-user.php">CREATE</a>
                <table class="table table-bordered">
                  <tr>
                    <th>No</th>
                    <th>Role</th>
                    <th>Nama</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                  <?php
                  $no = 1;
                  foreach ($rows as $row) {
                  ?>
                    <tr>
                      <td><?= $no++ ?></td>
                      <td><?= $row['role_name'] ?></td>
                      <td><?= $row['user_name'] ?></td>
                      <td><?= $row['email']?></td>
                      <td><?= $row['password'] ?></td>
                      <td><?= $row['is_active'] ?></td>
                      <td>
                      <a href="add-roleuser.php" class="btn btn-primary btn-sm">add role</i></i></a>
                      <a href="edit-user.php?Edit=<?php echo $row['id'] ?>" class="btn btn-success btn-sm"><i class="bi bi-pencil-fill"></i></a>
                      <a onclick="return confirm ('Yakin ingin menghapus?')" href="user.php?idDel=<?php echo $row['id'] ?>" class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></a>
                       
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