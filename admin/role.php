<?php
require_once "../koneksi.php";
session_start();


if (empty($_SESSION['EMAIL'])) {
  header("Location: ../login.php");
}

$role = mysqli_query($koneksi, "SELECT * FROM roles");
$rows = mysqli_fetch_all($role, MYSQLI_ASSOC);

$userRole = mysqli_query($koneksi, "SELECT * FROM user_role");
$rowURoles = mysqli_fetch_all($userRole, MYSQLI_ASSOC);

$user = mysqli_query($koneksi, "SELECT * FROM users");
$rowUsers = mysqli_fetch_all($user, MYSQLI_ASSOC);

if (isset($_GET['idDel'])) {

  $id = $_GET['idDel'];

  
  $del = mysqli_query($koneksi, "DELETE FROM roles WHERE id = $id");
    if ($del) {
      header("Location: role.php");
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
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Role</h5>
              <div class="table table-responsive">
                <a class="btn btn-primary mb-2" href="edit-role.php">CREATE</a>
                <table class="table table-bordered">
                  <tr>
                    <th>No</th>
                    <th>Nama</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                  <?php
                  $no = 1;
                  foreach ($rows as $row) {
                  ?>
                    <tr>
                      <td><?= $no++ ?></td>
                      <td><?= $row['name'] ?></td>
                      <td><?= $row['is_active'] ?></td>
                      <td>
                      <a href="edit-role.php?Edit=<?php echo $row['id'] ?>" class="btn btn-success btn-sm"><i class="bi bi-pencil-fill"></i></a>
                      <a onclick="return confirm ('Yakin ingin menghapus?')" href="role.php?idDel=<?php echo $row['id'] ?>" class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></a>
                       
                      </td>
                    </tr>
                  <?php
                  } ?>
                </table>
              </div>
            </div>
          </div>

        </div>

        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">User Role</h5>
              <div class="mb-3 row">
                <div class="col-sm-3">
                  <label for="">User</label>
                </div>
                <div class="col-sm-5">
                  <select id="user_id" class="form-control" name="user">
                    <option value="0" hidden>Choose User</option>
                    <?php foreach ($rowUsers as $rowUser) { ?>
                      <option value="<?php echo $rowUser['id']?>"><?php echo $rowUser['name']?></option>
                    <?php } ?>

                  </select>
                </div>
              </div>

              
              <div class="mb-3 row">
                <div class="col-sm-3">
                  <label for="">Role</label>
                </div>
                <div class="col-sm-5">
                  <select name="role" id="role_id" class="form-control">
                    <option value="" hidden>Choose Role</option>
                    <?php foreach ($rows as $rowRole) { ?>
                      <option value="<?php echo $rowRole['id']?>"><?php echo $rowRole['name']?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
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