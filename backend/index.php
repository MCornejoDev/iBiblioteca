<?php
require_once 'vendor/autoload.php';

$db = new mysqli('localhost', 'root', '', 'ibiblioteca');
mysqli_set_charset($db, "utf8");

$app = new \Slim\Slim();

//Configuración de cabeceras
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

$method = $_SERVER['REQUEST_METHOD'];
if ($method == "OPTIONS") {
    die();
}

$app->get("/libros", function () use($app,$db) {
    
    $query = 'SELECT * FROM libros ORDER BY id ASC';
    $select = $db->query($query);
    $libros = array();

    while($libro = $select->fetch_assoc()){
        $libros[] = $libro;
    }

    $result = array(
        'status' => 'success',
        'code' => 200,
        'data' => $libros
    );
    echo json_encode($result);
});

$app->get('/libro/:id',function($id) use ($app,$db){

    $query = 'SELECT * FROM libros WHERE id = '. $id;
    $select = $db->query($query);

    $result = array(
        'status' => 'error',
        'code' => 404,
        'message' => 'Error'
    );
    if ($select->num_rows == 1) {
        $result = array(
            'status' => 'success',
            'code' => 200,
            'data' => $select->fetch_assoc()
        );
    }
    echo json_encode($result);

});


$app->run();
