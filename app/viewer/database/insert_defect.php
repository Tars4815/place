<?php
$connection = pg_connect("host=localhost port=5432 dbname=bridges user=postgres password=mysecretpassword");

if (!$connection) {
    echo "An error occurred with the connection.<br>";
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and validate input
    $description = isset($_POST["description"]) ? pg_escape_string($connection, $_POST["description"]) : '';
    $pos_x = isset($_POST["pos_x"]) ? (float)$_POST["pos_x"] : 0.0;
    $pos_y = isset($_POST["pos_y"]) ? (float)$_POST["pos_y"] : 0.0;
    $pos_z = isset($_POST["pos_z"]) ? (float)$_POST["pos_z"] : 0.0;
    $defectType = isset($_POST["defectType"]) ? pg_escape_string($connection, $_POST["defectType"]) : '';
    $severityLev = isset($_POST["severityLev"]) ? (int)$_POST["severityLev"] : 0;
    $structuralEl = isset($_POST["structuralEl"]) ? (int)$_POST["structuralEl"] : 0;

    // Debugging: log the received data
    error_log("Received data: description=$description, pos_x=$pos_x, pos_y=$pos_y, pos_z=$pos_z, defectType=$defectType, structuralEl=$structuralEl");

    // Query to get the elementfk
    $elementQuery = "SELECT id FROM structural_elements WHERE scalarfield = $1 AND fkStructure = 1";
    $elementResult = pg_query_params($connection, $elementQuery, array($structuralEl));

    if (!$elementResult) {
        error_log("Error fetching elementfk: " . pg_last_error($connection));
        echo "Error fetching elementfk: " . pg_last_error($connection);
        exit;
    }

    $elementRow = pg_fetch_assoc($elementResult);
    if (!$elementRow) {
        error_log("No structural element found with scalarfield = $structuralEl");
        echo "No structural element found with scalarfield = $structuralEl";
        exit;
    }

    $elementfk = $elementRow['id'];

    // Use prepared statements to prevent SQL injection
    $query = "INSERT INTO defects (x, y, z, type, severity, note, fkElement) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id";
    $result = pg_query_params($connection, $query, array(
        $pos_x, $pos_y, $pos_z, $defectType, $severityLev, $description, $elementfk
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
