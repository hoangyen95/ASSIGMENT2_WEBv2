<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Đăng nhập</title>

  <!-- Bootstrap Core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../css/font-awesome.min.css">
  <!-- Custom CSS -->
  <link href="../css/heroic-features.css" rel="stylesheet">
  <link href="../css/register.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

</head>

<body>
  <?php require_once '../src/header.php' ?>
  
  <div class="container">
    <ol class="breadcrumb">
      <li><a href="index.php">Trang chủ</a></li>
      <li><a href="#">Đăng nhập</a></li>

    </ol>
  </div>
  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <div class="col-md-12 col-sm-12">

      <div class="content-form-page">
        <div class="row">
          <div class="col-md-7 col-sm-7">
            <form class="form-horizontal form-without-legend" action="../action/do_login.php" method="POST">
              <h2 style="color: blue; font-size: 30px;">Thông tin đăng nhập</h2>
              <div class="form-group">
                <label for="email" class="col-lg-4 control-label">Email <span class="require">*</span></label>
                <div class="col-lg-8">
                  <input type="text" class="form-control" id="email" name="email">
                </div>
              </div>
              <div class="form-group">
                <label for="password" class="col-lg-4 control-label">Mật khẩu <span class="require">*</span></label>
                <div class="col-lg-8">
                  <input type="text" class="form-control" id="password" name="password">
                </div>
              </div>
              <div class="row">
                <div class="col-lg-8 col-md-offset-4 padding-left-0">
                  <a href="page-forgotton-password.html">Quên mật khẩu?</a>
                </div>
              </div>
              <br>
              <div class="row">
                <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
                  <input type="submit" name="submit" style="font-weight:bold" class="btn btn-primary" value="ĐĂNG NHẬP" onclick="myFunction()">
                </div>
              </div>

            </form>
          </div>
          <div class="col-md-4 col-sm-4 pull-right">
            <div class="form-info">
              <p><img style="height: 8em;width: 8em" src="../img/avt.png"></p>

              <button type="button" style="font-weight:bold" class="btn btn-info">Thuận</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <br><br><br><br>
  
  <?php include '../src/footer.php' ?>


  <!-- /.container -->

  <!-- jQuery -->


  <script type="text/javascript" src="../js/login.js"></script>

</body>

</html>
