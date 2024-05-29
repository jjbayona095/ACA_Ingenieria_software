<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

<head>
    <meta charset="UTF-8">
    <link rel="icon" href="{{ url('images/small_logo.png')}}" type="image/png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" value="{{ csrf_token() }}" />
    <title>Intuition Business</title>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ url('assets/css/nucleo-icons.css')}}" rel="stylesheet">
    <link href="{{ url('assets/css/nucleo-svg.css')}}" rel="stylesheet">
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link id="pagestyle" href="{{ url('assets/css/soft-ui-dashboard.css?v=1.0.7')}}" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
</head>

<body>
    <div id="app">
        <router-view></router-view>
    </div>
</body>
<script type="text/javascript" src="{{ asset('/js/app.js')}}"></script>
<script src="{{url('assets/js/core/popper.min.js')}}"></script>
<script src="{{url('assets/js/core/bootstrap.min.js')}}"></script>
<script src="{{url('assets/js/plugins/perfect-scrollbar.min.js')}}"></script>
<script src="{{url('assets/js/plugins/smooth-scrollbar.min.js')}}"></script>
<script src="{{url('assets/js/plugins/chartjs.min.js')}}"></script>
<script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
<script src="{{url('assets/js/soft-ui-dashboard.min.js?v=1.0.7')}}"></script>
<script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>

</html>