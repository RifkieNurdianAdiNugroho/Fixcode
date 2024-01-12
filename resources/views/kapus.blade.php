@extends('layouts.dashboard.header')
@section('content')
    <div class="content d-flex flex-column" id="kt_content">
        <div class="toolbar" id="kt_toolbar">
            <div id="kt_toolbar_container" class="container-fluid d-flex flex-stack">
                <div data-kt-swapper="true" data-kt-swapper-mode="prepend"
                    data-kt-swapper-parent="{default: '#kt_content_container', 'lg': '#kt_toolbar_container'}"
                    class="page-title d-flex align-items-center flex-wrap me-3 mb-5 mb-lg-0">
                    <h1 class="d-flex align-items-center text-dark fw-bolder fs-3 my-1">Dashboard</h1>
                    <span class="h-20px border-gray-300 border-start mx-4"></span>
                    <ul class="breadcrumb breadcrumb-separatorless fw-bold fs-7 my-1">
                        <li class="breadcrumb-item text-muted">
                            <a href="{{ url('home') }}" class="text-muted text-hover-primary">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <span class="bullet bg-gray-300 w-5px h-2px"></span>
                        </li>
                        <li class="breadcrumb-item text-dark">Dashboard</li>
                    </ul>
                </div>
            </div>
        </div>

        <!--begin::Post-->
        <div class="post d-flex" id="kt_post">
            <!--begin::Container-->
            <div id="kt_content_container" class="container-xxl">
                <!--begin::Row-->
                
                <p align="center" style="font-size: 20px;font-weight: bold;">Rekaptulasi Data Umum</p>
                    <div class="row gy-5 g-xl-8">
                        <div class="col bg-primary px-6 py-8 rounded-2 me-3 mb-7">
                            <div class="row">
                                <div class="col-6">
                                    <span class="svg-icon svg-icon-3x svg-icon-white d-block mt-5 mb-2">
                                        <i class="fa fa-heartbeat fs-1 text-white"></i>
                                    </span>
                                    <a href="{{ url('/user/ahli_gizi') }}" class="text-white fw-bold fs-6">Ahli Gizi</a>
                                </div>
                                <div class="col-6 d-flex align-items-center">
                                    <h1 class="text-white">
                                        {{$data['ahli_gizi']}}
                                    </h1>
                                </div>
                            </div>
                        </div>
                        <div class="col bg-info px-6 py-8 rounded-2 me-3 mb-7">
                            <div class="row">
                                <div class="col-6">
                                    <span class="svg-icon svg-icon-3x svg-icon-white d-block mt-5 mb-2">
                                        <i class="fa fa-stethoscope fs-1 text-white"></i>
                                    </span>
                                    <a href="/user/bidan" class="text-white fw-bold fs-6">Bidan</a>
                                </div>
                                <div class="col-6 d-flex align-items-center">
                                    <h1 class="text-white">{{$data['bidan']}}</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col bg-warning px-6 py-8 rounded-2 me-3 mb-7">
                            <div class="row">
                                <div class="col-6">
                                    <span class="svg-icon svg-icon-3x svg-icon-white d-block mt-5 mb-2">
                                        <i class="fa fa-user-md fs-1 text-white"></i>
                                    </span>
                                    <a href="/user/kapus" class="text-white fw-bold fs-6">Kepala Puskesmas</a>
                                </div>
                                <div class="col-6 d-flex align-items-center">
                                    <h1 class="text-white">
                                        {{$data['kapus']}}
                                    </h1>
                                </div>
                            </div>
                        </div>
                        <div class="col bg-danger px-6 py-8 rounded-2 me-3 mb-7">
                            <div class="row">
                                <div class="col-6">
                                    <span class="svg-icon svg-icon-3x svg-icon-white d-block mt-5 mb-2">
                                        <i class="fas fa-baby fs-1 text-white"></i>
                                    </span>
                                    <a href="/data/balita" class="text-white fw-bold fs-6">Balita</a>
                                </div>
                                <div class="col-6 d-flex align-items-center">
                                    <h1 class="text-white">{{$data['balita']}}</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col bg-success px-6 py-8 rounded-2 me-3 mb-7">
                            <div class="row">
                                <div class="col-6">
                                    <span class="svg-icon svg-icon-3x svg-icon-white d-block mt-5 mb-2">
                                        <i class="fa fa-medkit fs-1 text-white"></i>
                                    </span>
                                    <a href="/data/posyandu" class="text-white fw-bold fs-6">Posyandu</a>
                                </div>
                                <div class="col-6 d-flex align-items-center">
                                    <h1 class="text-white">{{$data['pos']}}</h1>
                                </div>
                            </div>
                        </div>

                    </div>

                   <p align="center" style="font-size: 20px;font-weight: bold;">Data Statistik</p>
                        <div id="chartContainer" style="height: 300px; width: 100%;"></div>

                        <div class="row">
                            @foreach($data['posyandu_handling'] as $key => $item)
                            <div class="col-md-6 pt-2">
                                <div id="chartContainer{{$key+1}}" style="height: 300px; width: 100%;"></div>
                            </div>
                            @endforeach
                        </div>
            </div>
            <!--end::Container-->
        </div>
        <!--end::Post-->
    </div>
@endsection
@section('scriptcustom')
    <script src="https://use.fontawesome.com/f2fc9ac3b2.js"></script>
        <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
    
    <script>
    window.onload = function() {
    var chart = new CanvasJS.Chart("chartContainer", 
    {
        animationEnabled: true,
        theme: "light2", 
        title:{
            text: "Data Balita Per Bidan"
        },
        axisY: {
            title: "Data Balita Yang Ditangani"
        },
        data: [{        
                type: "column",  
                showInLegend: true, 
                legendMarkerColor: "grey",
                legendText: "Nama Bidan",
                dataPoints: <?php echo json_encode($data['bidan_handling'], JSON_NUMERIC_CHECK); ?>
            }]
        });
        chart.render();


    <?php foreach ($data['posyandu_handling'] as $keyCure => $cureItem): ?>
        var chart<?php echo $keyCure+1?> = new CanvasJS.Chart("chartContainer<?php echo $keyCure+1?>", {
        animationEnabled: true,
        theme: "light2", 
        title:{
            text: "Data Balita Pos <?php echo $cureItem['nama']?>"
        },
        axisY: {
            title: "Data Gizi Balita Pada Pos <?php echo $cureItem['nama']?>"
        },
        data: [{        
                type: "column",  
                showInLegend: true, 
                legendMarkerColor: "grey",
                legendText: "Status Gizi",
                dataPoints: [      
                    { y: <?php echo $cureItem['gizi_baik']?>, label: "Gizi Baik" },
                    { y: <?php echo $cureItem['gizi_lebih']?>,  label: "Gizi Lebih" },
                    { y: <?php echo $cureItem['gizi_sedang']?>,  label: "Gizi Sedang" },
                    { y: <?php echo $cureItem['gizi_buruk']?>,  label: "Gizi Buruk" },
                    { y: <?php echo $cureItem['gizi_kurang']?>,  label: "Gizi Kurang" }
                ]
            }]
        });
        chart<?php echo $keyCure+1?>.render();
    <?php endforeach; ?>
}
</script>
@endsection
