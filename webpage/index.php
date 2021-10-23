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
    <link rel="stylesheet" href="/start/css/bootstrap.min.css">
    <script src="/start/js/jquery-3.6.0.min.js"></script>
    <script src="/start/js/popper.min.js"></script>
    <script src="/start/js/bootstrap.min.js"></script>
</head>
<body>
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

    <div _ngcontent-wmi-c48="" class="container-fluid">
        <div class="col-md-6 offset-md-3" style="margin-top: 9rem;">
           <div class="card">
               <h4 class="card-header text-center bg-primary text-white">Configuración WiFi</h4>
               <div class="card-body">
                   <form action="/start/" class="ng-untouched ng-pristine ng-invalid">
                   <div class="form-group">
                       <label for="mySSID">SSID</label>
                       <select formcontrolname="mySSID" name="SSID" class="form-control ng-untouched ng-pristine ng-invalid">
				<?php
				$list = array_unique(explode("\n", shell_exec('sudo listssid.sh')));
				  foreach($list as &$ssid) {
				    if ($ssid != '') {
				      echo "             <option" . ($ssid == $SSID_sel ? " SELECTED" : "") . ">$ssid</option>\n";
				    }
				  }
				?>
                     </select>
                     <button class="btn btn-secondary" onClick='window.location.reload(true);'>Recargar</button>
                   </div>
                   <div class="form-group">
                       <label for="password">Contraseña</label>
                       <input type="password" id="myInput" formcontrolname="password" name="pass" class="form-control ng-untouched ng-pristine ng-invalid">
                       <div>
                          <input type="checkbox" class="ng-untouched ng-pristine ng-invalid" onclick="myFunction()">Mostrar
                       </div>
                   </div>
                   <br _ngcontent-wmi-c46="">
                   <div class="d-grid gap-2 col-6 mx-auto">
                       <input type="submit" class="btn btn-primary" value="Guardar" />
                   </div>
                   </form>
               </div>
           </div>
       </div>
   </div>
</body>
</html>
