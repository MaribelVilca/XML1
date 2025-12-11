<?php
$xml = simplexml_load_file('ies_db.xml') or die('Error: no se cargo el xml.Escribe correctamente el nombre del');
//echo $xml->pe_1->nombre."<br>";
//echo $xml->pe_2->nombre;
foreach ($xml as $i_pe => $pe){
    echo 'Codigo:'.$pe -> codigo.'<br>';
    echo 'Tipo:'.$pe -> tipo.'<br>';
    echo 'nombre:'.$pe -> nombre.'<br>';
    $consulta= "INSERT INTO sigi_programa_studios () VALUES ()";
    foreach ($pe->planes_estudio[0] as $i_ple => $plan){
        echo '--'.$plan->nombre.'<br>' ;
        echo '--'.$plan->resolucion.'<br>' ;
        echo '--'.$plan->registro.'<br>' ;
        foreach ($plan->modulos_formativos[0] as $id_mod =>$modulo){
            echo '----'.$modulo->descripcion.'<br>';
        }

    }
 
}
