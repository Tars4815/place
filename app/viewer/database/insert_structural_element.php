<?php
$connection = pg_connect("host=localhost port=5432 dbname=bridges user=postgres password=mysecretpassword");

if (!$connection) {
    echo "An error occurred with the connection.<br>";
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and validate input
    $elementType = isset($_POST["elementType"]) ? pg_escape_string($connection, $_POST["elementType"]) : '';
    $material = isset($_POST["material"]) ? pg_escape_string($connection, $_POST["material"]) : '';
    $scalarField = isset($_POST["scalarField"]) ? (int)$_POST["scalarField"] : 0;

    // Use prepared statements to prevent SQL injection
    $query = "INSERT INTO structural_elements (name, material, scalarfield) VALUES ($1, $2, $3) RETURNING id";    
    $result = pg_query_params($connection, $query, array(
        $elementType, $material, $scalarField
    ));

    if (!$result) {
        error_log("Error inserting data: " . pg_last_error($connection));
        echo "Error inserting data: " . pg_last_error($connection);
    } else {
        // Fetch the inserted ID and echo it in the response
        $insertedRow = pg_fetch_assoc($result);
        $insertedId = $insertedRow['id'];
        echo $insertedId;
    }
}

pg_close($connection);
?>
