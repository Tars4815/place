<?php
$connection = pg_connect("host=localhost port=5432 dbname=bridges user=postgres password=mysecretpassword");

if (!$connection) {
    echo json_encode(["error" => "An error occurred while connecting to the database."]);
    exit;
}

$group = $_GET['group'] ?? '';

if ($group) {
    // Prepare and execute your query to search for the group
    $result = pg_query_params($connection, "SELECT * FROM structural_elements WHERE name = $1", array($group));

    if (!$result) {
        echo json_encode(["error" => "An error occurred while executing the query."]);
    } else {
        $data = pg_fetch_all($result);
        echo json_encode($data);
    }
} else {
    echo json_encode(['error' => 'No group specified']);
}

// Close the database connection
pg_close($connection);
?>
