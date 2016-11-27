<?php

//session_start();

$xmldoc = new DomDocument( '1.0' );
$xmldoc->preserveWhiteSpace = false;
$xmldoc->formatOutput = true;

if(isset($_POST['submit'])) {

  $thongbaoloi = array();
  $firstname = $_POST['ten'];
  $lastname = $_POST['hodem'];
  $email = $_POST['email'];
  $phone = $_POST['dienthoai'];
  $addr = $_POST['diachi'];
  $gender = $_POST['gioitinh'];
  $productName = "iPhone 7";
  $productNum = "2";
  $price = "300$";
  $sumPrice = "600$";
  $series = "273xxxx";

  if(empty($firstname))
{
    $thongbaoloi[] = "Họ đệm không được bỏ trống.";
}
if(empty($lastname))
{
    $thongbaoloi[] = "Tên không được bỏ trống.";
}
if((strlen($firstname) > 50) || (strlen($lastname > 50)))
{
    $thongbaoloi[] ="Họ đệm và tên quá dài.";
}
if(empty($email))
{
    $thongbaoloi[] = "Email không được bỏ trống.";
}
else if(filter_var($email, FILTER_VALIDATE_EMAIL) == false)
{
    $thongbaoloi[] = "Email không hợp lệ.<br/>";
}
if(empty($phone))
{
    $thongbaoloi[] = "Điện thoại không được bỏ trống.<br/>";
}
else if(is_numeric($phone) && strlen($phone) > 11)
{
    $thongbaoloi[] = "Số điện thoại không hợp lệ.";
}
if(empty($addr))
{
    $thongbaoloi[] = " Địa chỉ không được bỏ trống.";
}
else if(strlen($addr) > 500)
{
    $thongbaoloi[] = "Địa chỉ không được lớn hơn 500 ký tự.";
}

if(count($thongbaoloi) > 0)
{
    include 'cart.php';
    exit();
}
if (isset($_POST['giotinh']['Nam'])) {
    $gender = 1;
} 
else {
    $gender = 0;
}

  // if(isset($_SESSION['submit'])) 
  //   $_SESSION['submit'] = $_SESSION['submit']+1;
  // else 
  //   $_SESSION['submit'] = 1;

  if( $xml = file_get_contents( 'main.xml') ) {
    $xmldoc->loadXML( $xml, LIBXML_NOBLANKS );

    // find the headercontent tag
    $root = $xmldoc->getElementsByTagName('headercontent')->item(0);

    // create the <donHang> tag
    $donHang = $xmldoc->createElement('DonHang');
    $numAttribute = $xmldoc->createAttribute("num");
    $numAttribute->value = $series;
    $donHang->appendChild($numAttribute);

    // add the donHang tag before the first element in the <headercontent> tag
    $root->insertBefore( $donHang, $root->firstChild );

    // create other elements and add it to the <product> tag.

    $informationElement = $xmldoc->createElement('information');
    $donHang->appendChild($informationElement);
    //firstname tag
    $fnameElement = $xmldoc->createElement('firstname');
    $informationElement->appendChild($fnameElement);
    $fnameText = $xmldoc->createTextNode($firstname);
    $fnameElement->appendChild($fnameText);

    //lastname tag
    $lnameElement = $xmldoc->createElement('lastname');
    $informationElement->appendChild($lnameElement);
    $lnameText = $xmldoc->createTextNode($lastname);
    $lnameElement->appendChild($lnameText);

    //email tag
    $emailElement = $xmldoc->createElement('email');
    $informationElement->appendChild($emailElement);
    $emailText = $xmldoc->createTextNode($email);
    $emailElement->appendChild($emailText);

    //phone tag
    $phoneElement = $xmldoc->createElement('phone');
    $informationElement->appendChild($phoneElement);
    $phoneText = $xmldoc->createTextNode($phone);
    $phoneElement->appendChild($phoneText);

    //gender tag
    $genderElement = $xmldoc->createElement('gender');
    $informationElement->appendChild($genderElement);
    $genderText = $xmldoc->createTextNode($gender);
    $genderElement->appendChild($genderText);

    //addres tag
    $addrElement = $xmldoc->createElement('address');
    $informationElement->appendChild($addrElement);
    $addrText = $xmldoc->createTextNode($addr);
    $addrElement->appendChild($addrText);

    $productListElement = $xmldoc->createElement('productList');
    $donHang->appendChild($productListElement);
    
    for ($i=1; $i<3; $i++) {
    $productElement = $xmldoc->createElement('product');
    $numAttr = $xmldoc->createAttribute("num");
    $numAttr->value = $i;
    $productListElement->appendChild($productElement);

    //productname tag
    $pNameElement = $xmldoc->createElement('productName');
    $productElement->appendChild($pNameElement);
    $pNameText = $xmldoc->createTextNode($productName);
    $pNameElement->appendChild($pNameText);

    //productNum tag
    $pNumElement = $xmldoc->createElement('productNum');
    $productElement->appendChild($pNumElement);
    $pNumText = $xmldoc->createTextNode($productNum);
    $pNumElement->appendChild($pNumText);

    //price tag
    $priceElement = $xmldoc->createElement('price');
    $productElement->appendChild($priceElement);
    $priceText = $xmldoc->createTextNode($price);
    $priceElement->appendChild($priceText);
    }

    //sumPrices tag
    $sumPriceElement = $xmldoc->createElement('sumPrice');
    $donHang->appendChild($sumPriceElement);
    $sumPriceText = $xmldoc->createTextNode($sumPrice);
    $sumPriceElement->appendChild($sumPriceText);

    //save to file
    $xmldoc->save('main.xml');
    header('Location:checkout.php');
  }

}
?>