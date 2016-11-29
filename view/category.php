<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Sản phẩm theo loại</title>

  <!-- Bootstrap Core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../css/font-awesome.min.css">
  <!-- Custom CSS -->
  <link href="../css/heroic-features.css" rel="stylesheet">
  <link href="../css/register.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

      </head>

      <body>
       <?php include '../src/header.php' ?>

        <div class="container">
          <ol class="breadcrumb">
            <li><a href="index.php">Trang chủ</a></li>
            <?php
              include '../libs/connect.php';
              $mysqli = new mysqli("localhost","root","","webdata5");
              $conn->set_charset("utf8");
              $getdata = "select count(productID) as total from product";
         $query1 = $mysqli->query($getdata);

         $row1 = mysqli_fetch_assoc($query1);
         $total_records = $row1['total'];

        //TÌM LIMIT VÀ CURRENT_PAGE
         $current_page = isset($_GET['page']) ? $_GET['page'] : 1;
         $limit = 6;

        //TÍNH TOÁN TOTAL_PAGE VÀ START
        // tổng số trang
         $total_page = ceil($total_records / $limit);

        // Giới hạn current_page trong khoảng 1 đến total_page
         if ($current_page > $total_page){
          $current_page = $total_page;
        }
        else if ($current_page < 1){
          $current_page = 1;
        }

        // Tìm số record bắt đầu của mỗi trang
        $start = ($current_page - 1) * $limit;

        //lấy dữ liệu cho từng trang
        $sql = "select * from product order by productID desc LIMIT $start, $limit";
        $query = $mysqli->query($sql);
        

              $id=isset($_GET['idcatogory']) ? $_GET['idcatogory'] : 1;
              $sql="select * from category  where categoryID=($id)";
              $query=$mysqli->query($sql);
              if(mysqli_num_rows($query) > 0)
              {
                $row=mysqli_fetch_array($query);
                echo "<li><a href='category.php?idcatogory=$row[categoryID]'>$row[categoryName]</a></li>";
              }
            ?>
            
          </ol>
        </div>
        
        <div class="container">
          <div class="row">
            <div class="col-xs-12 col-sm-12 col-lg-9 col-md-9">
              <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Sản phẩm HOT</a></li>
                <li><a data-toggle="tab" href="#discount">Khuyến mãi</a></li>
                <li><a data-toggle="tab" href="#new">Sản phẩm mới</a></li>
              </ul>
            </div>
          </div>
          <!-- Title -->
          <div class="tab-content ">
            <div id="home" class="tab-pane fade in active">
              <div class="row">
                <div class=" col-xs-12 col-sm-12 col-lg-9 col-md-9">
                  <br>
                  <!--1-->
                  <?php
                  if (isset($_GET['idcatogory']))
                  { 
                    $mysqli->set_charset("utf8");
                    $sql="select * from product p, category c where p.categoryID=c.categoryID and c.categoryID=($id)";
                    $query=$mysqli->query($sql);
                    if(mysqli_num_rows($query) > 0)
                    {
                      while($row=mysqli_fetch_array($query))
                      {

                        echo "<div class=' col-lg-4 col-md-4 col-sm-6 hero-feature'>";
                        echo "<div class='product-item'>";
                        echo "<div class='img-wrapper' style='height:25em'>";
                        echo "<img src='../img/$row[image]'class='img-responsive' alt='iphone'>";
                        echo "<div>";
                        echo "<br>";
                        $id = (int)$row['productID'];
                        $sql1 = "select * from thongso where productID = $id";
                        $query1 = mysqli_query($conn, $sql1);
                        while($row1 = mysqli_fetch_array($query1)){
                          echo "<p style='padding-left:10px;text-align:left; color: white'>Màn Hình: " . $row1['manhinh'] . "</p>";
                          echo "<p style='padding-left:10px;text-align:left; color: white'>HDD: " . $row1['HDD'] . "</p>";
                          echo "<p style='padding-left:10px;text-align:left; color: white'>Camera: " . $row1['CMRTruoc'] . ", </p>";
                          echo "<p style='padding-left:10px;text-align:left; color: white'>selfe: " . $row1['CMRSau'] . "</p>";
                          echo "<p style='padding-left:10px;text-align:left; color: white'>RAM: " . $row1['RAM'] . "</p>";
                          echo "<p style='padding-left:10px;text-align:left; color: white'>ROM: " . $row1['ROM'] . "</p>";
                          echo "<p style='padding-left:10px;text-align:left; color: white'>Thẻ sim: " . $row1['thesim'] . "</p>";
                          echo "<p style='padding-left:10px;text-align:left; color: white'>Dung lượng Pin: " . $row1['dungluongPIN'] . "</p>";
                        }
                        echo "<br>";
                        echo "<a href='detail.php?item=$row[productID]' class='btn btn-default fancybox-fast-view'>Chi tiết</a>";
                        echo "</div>";
                        echo "</div>";
                        echo "<h3><a href='detail.php?item=$row[productID]'>$row[productName]</a></h3>";
                        echo "<div class='price'>$row[price]"."đ</div>";
                        echo "<a href='../action/addcart.php?item=$row[productID]' class='btn btn-default add'>MUA NGAY</a>"   ; 
                        echo "</div>";
                        echo "</div>";
                      }

                    }
                  }
                  ?>

                <div class="col-xs-12 col-sm-12 col-lg-9 col-md-9">
          <ul class="pager">
            
        
            <?php 
            //HIỂN THỊ PHÂN TRANG
            // nếu current_page > 1 và total_page > 1 mới hiển thị nút prev
             if ($current_page > 1 && $total_page > 1){
              echo '<li><a href="category.php?page='.($current_page-1).'">Trang trước</a></li>';
            }

            // Lặp khoảng giữa
            for ($i = 1; $i <= $total_page; $i++){
                // Nếu là trang hiện tại thì hiển thị thẻ span
                // ngược lại hiển thị thẻ a
              if ($i == $current_page){
                echo '<li><a><span>'.$i.'</span></a></li>';
              }
              else{
                echo '<li><a href="category.php?page='.$i.'">'.$i.'</a></li>';
              }
              
            }

            // nếu current_page < $total_page và total_page > 1 mới hiển thị nút prev
            if ($current_page < $total_page && $total_page > 1){
              echo '<li><a href="category.php?page='.($current_page+1).'">Trang sau</a></li>';
            }
            ?>

        </ul>
      </div>
    </div>  

                <div class=" col-xs-12 col-sm-12 col-lg-3 col-md-3">
      <div class="single-product-widget">
        <div class="list-group">
          <a href="#" class="list-group-item active">Bán chạy nhất</a>
          <div class="list-group-item">
            <?php 
            $sql="select * from product order by soluongbanduoc desc";
            $query=$mysqli->query($sql);
            if(mysqli_num_rows($query) > 0)
            {
              $count=0;
              while(($row=mysqli_fetch_array($query)) && $count<3)
              {
                $count++;
                echo "<div class='single-wid-product'>";
                echo "<a href='detail.php?item=$row[productID]'><img src='../img/$row[image]' alt='' class='product-thumb'></a>";
                echo "<h2><a href='detail.php?item=$row[productID]'>$row[productName]</a></h2>";
                echo "<div class='product-wid-rating'>";
                echo "<i class='fa fa-star'></i>";
                echo "<i class='fa fa-star'></i>";
                echo "<i class='fa fa-star'></i>";
                echo "<i class='fa fa-star'></i>";
                echo "<i class='fa fa-star'></i>";
                echo "</div>";
                echo "<div class='product-wid-price'>";
                echo "<p>$row[price]"."đ</p>";
                echo "</div>  ";                          
                echo "</div>";
                echo "<hr>";
              }
            }
            ?>
          </div>
        </div>
      </div>

      <br>

      <div class="list-group">
        <a href="#" class="list-group-item active">Sản phẩm mới</a>
        <div class="list-group-item">
          <?php 
          $sql="select * from product order by productID desc";
          $query=$mysqli->query($sql);
          if(mysqli_num_rows($query) > 0)
          {
            $count=0;
            while(($row=mysqli_fetch_array($query)) && $count<3)
            {
              $count++;
              echo "<div class='single-wid-product'>";
              echo "<a href='detail.php?item=$row[productID]'><img width='2em' height='2em' src='../img/$row[image]' alt='' class='product-thumb'></a>";
              echo "<h2><a href='detail.php?item=$row[productID]'>$row[productName]</a></h2>";
              echo "<div class='product-wid-rating'>";
              echo "<i class='fa fa-star'></i>";
              echo "<i class='fa fa-star'></i>";
              echo "<i class='fa fa-star'></i>";
              echo "<i class='fa fa-star'></i>";
              echo "<i class='fa fa-star'></i>";
              echo "</div>";
              echo "<div class='product-wid-price'>";
              echo "<p>$row[price]"."đ</p>";
              echo "</div>  ";                          
              echo "</div>";
              echo "<hr>";
            }
          }
          ?>
        </div>
      </div>                     
    </div>
  </div>
</div>

            <div id="discount" class="tab-pane fade">
              <div class="row">
                <div class=" col-xs-12 col-sm-12 col-lg-9 col-md-9">
                 <br>
                 <!--1-->
                 <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>


                <div class="col-md-12 col-sm-12 col-xs-12 hero-feature">
                  <ul class="pager">
                    <li><a href="#">Trang trước</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3 </a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">Trang sau</a></li>
                  </ul>
                </div>
              </div>

              <div class=" col-xs-12 col-sm-12 col-lg-3 col-md-3">
                <div class="single-product-widget">
                  <div class="list-group">
                    <a href="#" class="list-group-item active">Bán chạy nhất;</a>
                    <div class="list-group-item">
                      <div class="single-wid-product">
                        <a href="detail.php"><img src="img/sony.jpg" alt="" class="product-thumb"></a>
                        <h2><a href="detail.php">Xperia Utral</a></h2>
                        <div class="product-wid-rating">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                          <p>$400.00</p>
                        </div>                            
                      </div>
                      <hr>
                      <div class="single-wid-product">
                        <a href="detail.php"><img src="img/iphone6.jpg" alt="" class="product-thumb"></a>
                        <h2><a href="detail.php">iPhone</a></h2>
                        <div class="product-wid-rating">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                          <p>$400.00</p>
                        </div>                            
                      </div>
                      <hr>
                      <div class="single-wid-product">
                        <a href="detail.php"><img src="img/lumia.png" alt="" class="product-thumb"></a>
                        <h2><a href="detail.php">Lumia</a></h2>
                        <div class="product-wid-rating">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                          <p>$400.00</p>
                        </div>
                        <br>                            
                      </div>
                    </div>
                  </div>
                </div>

                <br>

                <div class="list-group">
                  <a href="#" class="list-group-item active">Sản phẩm mới</a>
                  <div class="list-group-item">
                    <div class="single-wid-product">
                      <a href="detail.php"><img src="img/asus.jpg" alt="" class="product-thumb"></a>
                      <h2><a href="detail.php">Zenfone</a></h2>
                      <div class="product-wid-rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </div>
                      <div class="product-wid-price">
                        <p>$400.00</p>
                      </div>                            
                    </div>
                    <hr>
                    <div class="single-wid-product">
                      <a href="detail.php"><img src="img/iphone6s.png" alt="" class="product-thumb"></a>
                      <h2><a href="detail.php">iPhone 7 Plus</a></h2>
                      <div class="product-wid-rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </div>
                      <div class="product-wid-price">
                        <p>$400.00</p>
                      </div>                            
                    </div>
                    <hr>
                    <div class="single-wid-product">
                      <a href="detail.php"><img src="img/samsung1.jpg" alt="" class="product-thumb"></a>
                      <h2><a href="detail.php">Samsung</a></h2>
                      <div class="product-wid-rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </div>
                      <div class="product-wid-price">
                        <p>$400.00</p>
                      </div> 
                      <br>
                    </div>
                  </div>
                </div>                     
              </div>
            </div>
          </div>

          <div id="new" class="tab-pane fade">
            <div class="row">
              <div class=" col-xs-12 col-sm-12 col-lg-9 col-md-9">
                <br>
                <!--1-->
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                <div class=" col-lg-4 col-md-4 col-sm-6 col-xs-12 hero-feature">
                  <div class="product-item">
                    <div class="img-wrapper">
                      <img src="img/iphone.png" class="img-responsive" alt="iphone">
                      <div>
                        <a href="detail.php" class="btn btn-default fancybox-fast-view">Chi tiết</a>
                      </div>
                    </div>
                    <h3><a href="detail.php">Iphone</a></h3>
                    <div class="price">$29.00</div>
                    <a href="#" class="btn btn-default add">MUA NGAY</a>    
                  </div>
                </div>
                

                <div class="col-md-12 col-sm-12 col-xs-12 hero-feature">
                  <ul class="pager">
                    <li><a href="#">Trang trước</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3 </a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">Trang su</a></li>
                  </ul>
                </div>
              </div>

              <div class=" col-xs-12 col-sm-12 col-lg-3 col-md-3">
                <div class="single-product-widget">
                  <div class="list-group">
                    <a href="#" class="list-group-item active">Bán chạy nhất</a>
                    <div class="list-group-item">
                      <div class="single-wid-product">
                        <a href="detail.php"><img src="img/sony.jpg" alt="" class="product-thumb"></a>
                        <h2><a href="detail.php">Xperia Utral</a></h2>
                        <div class="product-wid-rating">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                          <p>$400.00</p>
                        </div>                            
                      </div>
                      <hr>
                      <div class="single-wid-product">
                        <a href="detail.php"><img src="img/iphone6.jpg" alt="" class="product-thumb"></a>
                        <h2><a href="detail.php">iPhone</a></h2>
                        <div class="product-wid-rating">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                          <p>$400.00</p>
                        </div>                            
                      </div>
                      <hr>
                      <div class="single-wid-product">
                        <a href="detail.php"><img src="img/lumia.png" alt="" class="product-thumb"></a>
                        <h2><a href="detail.php">Lumia</a></h2>
                        <div class="product-wid-rating">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                          <p>$400.00</p>
                        </div>
                        <br>                            
                      </div>
                    </div>
                  </div>
                </div>

                <br>

                <div class="list-group">
                  <a href="#" class="list-group-item active">Sản phẩm mới</a>
                  <div class="list-group-item">
                    <div class="single-wid-product">
                      <a href="detail.php"><img src="img/asus.jpg" alt="" class="product-thumb"></a>
                      <h2><a href="detail.php">Zenfone</a></h2>
                      <div class="product-wid-rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </div>
                      <div class="product-wid-price">
                        <p>$400.00</p>
                      </div>                            
                    </div>
                    <hr>
                    <div class="single-wid-product">
                      <a href="detail.php"><img src="img/iphone6s.png" alt="" class="product-thumb"></a>
                      <h2><a href="detail.php">iPhone 7 Plus</a></h2>
                      <div class="product-wid-rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </div>
                      <div class="product-wid-price">
                        <p>$400.00</p>
                      </div>                            
                    </div>
                    <hr>
                    <div class="single-wid-product">
                      <a href="detail.php"><img src="img/samsung1.jpg" alt="" class="product-thumb"></a>
                      <h2><a href="detail.php">Samsung</a></h2>
                      <div class="product-wid-rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </div>
                      <div class="product-wid-price">
                        <p>$400.00</p>
                      </div> 
                      <br>
                    </div>
                  </div>
                </div>                     
              </div>
            </div>
          </div>
          <!-- /.row -->
          <hr>
        </div>
      </div>
      <!-- Footer -->
      <?php include '../src/footer.php' ?>

      <!-- /.container -->

      <!-- jQuery -->
      <script src="js/jquery.js"></script>

      <!-- Bootstrap Core JavaScript -->
      <script src="js/bootstrap.min.js"></script>

      <script type="text/javascript" src="js/bxslider.min.js"></script>
      <script type="text/javascript" src="js/script.slider.js"></script>

    </body>

    </html>

