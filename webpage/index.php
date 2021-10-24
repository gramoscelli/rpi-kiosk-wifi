<html>
<head>
    <link rel="stylesheet" href="/start/css/bootstrap.min.css">
    <script src="/start/js/jquery-3.6.0.min.js"></script>
    <script src="/start/js/popper.min.js"></script>
    <script src="/start/js/bootstrap.min.js"></script>
</head>
<body>
<script>
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

setTimeout(function() {
    UrlExists('https://www.remonet.ar/pwa', function (status) {
        if (status === 200) {
            window.location='https://www.remonet.ar/pwa';
	} else {
	    window.location='https://127.0.0.1/config.php';
	}
    });
    }, 3000);
</script>
    <div _ngcontent-wmi-c48="" class="container-fluid">
        <div class="col-md-6 offset-md-3" style="margin-top: 9rem;">
           <div class="card">
               <h4 class="card-header text-center bg-primary text-white">Iniciando</h4>
               <div class="card-body">
		   <br />
		   <br />
		   <br />
		   <br />
		   <br />
		   <br />
               </div>
           </div>
       </div>
   </div>
</body>
</html>
