<?php

use Dotenv\Dotenv;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv::createImmutable(__DIR__);  // __DIR__ apunta al directorio del script actual
$dotenv->load();

$dotenv->required(['DB_HOST', 'DB_PORT', 'DB_DATABASE', 'DB_USERNAME', 'DB_PASSWORD'])->notEmpty();


$db = new mysqli($_ENV['DB_HOST'], $_ENV['DB_USERNAME'], $_ENV['DB_PASSWORD'], $_ENV['DB_DATABASE']);
mysqli_set_charset($db, "utf8");

$app = AppFactory::create();


$app->addRoutingMiddleware();
$errorMiddleware = $app->addErrorMiddleware(true, true, true);

//Configuración de cabeceras
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");

$method = $_SERVER['REQUEST_METHOD'];
if ($method == "OPTIONS") {
    die();
}

$app->get("/", function ($request, $response, $args) {
    $response->getBody()->write("It is ok");
    return $response;
});


$app->get("/books", function ($request, $response, $args) use ($db) {
    $query = 'SELECT * FROM books ORDER BY id ASC';
    $select = $db->query($query);
    $books = array();

    while ($book = $select->fetch_assoc()) {
        $books[] = $book;
    }

    $result = array(
        'status' => 'success',
        'code' => 200,
        'data' => $books
    );

    $response->getBody()->write(json_encode($result));
    return $response->withHeader('Content-Type', 'application/json');
});

$app->get('/book/{id}', function ($request, $response, $args) use ($db) {
    $id = $args['id']; // Obtén el ID de los parámetros de la URL

    $query = 'SELECT * FROM books WHERE id = ?';
    $stmt = $db->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $select = $stmt->get_result();

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

    $response->getBody()->write(json_encode($result));
    return $response->withHeader('Content-Type', 'application/json');
});



$app->run();
