<?php
  $SSID_sel = "";
  $pass = "";
  if (isset($_GET['SSID'])) {
    $SSID_sel = $_GET['SSID'];
    $pass = $_GET['pass'];
    shell_exec('sudo chwifi.sh "' . $SSID_sel . '" "' . $pass . '"');
  }
?>
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>
<div class="text-center">

<h3>Ingrese la red WiFi</h3>

<form action="/index.php" method="get">
<div class="row justify-content-center">
    <div class="col-auto">
<table>
  <tr>
    <td>SSID:</td>
    <td> <select name="SSID">
<?php
$list = array_unique(explode("\n", shell_exec('sudo listssid.sh')));
  foreach($list as &$ssid) {
    if ($ssid != '') {
      echo "             <option" . ($ssid == $SSID_sel ? " SELECTED" : "") . ">$ssid</option>\n";
    }
  }
?>
        </select><input type="button" onClick='window.location="http://127.0.0.1/"' value="Recargar" /></td>

  </tr>
  <tr>
    <td>Contraseña:</td>
    <td><input type="password" name="pass" value="<?= $pass ?>" id="myInput"/><input type="checkbox" onclick="myFunction()">Mostrar</td>
  <tr>
    <td colspan=2 class="text-center"><input type="submit" value="Acceder" /></td>
  </tr>
</table>
  </div>
</div>
</form>
</div>
</div>
</body>
<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
function UrlExists(url, cb) {
    $.ajaxSetup({ cache: false });
    $.ajax({
        url: url,
        dataType: 'text',
        type: 'GET',
        cache: false,
        complete: function (xhr) {
            if (typeof cb === 'function')
                cb.apply(this, [xhr.status]);
        }
    });
}

setInterval(function() {
			UrlExists('https://www.remonet.ar/pwa', function (status) {
                         	if (status === 200) {
                                     window.location='https://www.remonet.ar/pwa';
        			}
                            });
        		}, 3000);
</script>
</html>
