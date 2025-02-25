<?php
$connection = pg_connect("host=localhost port=5432 dbname=bridges user=postgres password=mysecretpassword");

if (!$connection) {
    echo "An error occurred.<br>";
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST["id"];
    // s$newTitle = $_POST["newTitle"];
    $newDescription = $_POST["newDescription"];
    $newPositionArray = explode(',', $_POST["newPositionArray"]);
    $defectType = $_POST["defectType"];
    $defectSeverity = $_POST["defectSeverity"];

    // Update data in the defects table using parameterized query to prevent SQL injection
    $query = "UPDATE defects SET
        note = $1, 
        x = $2,
        y = $3,
        z = $4,
        type = $5,
        severity = $6
        WHERE id = $7";

    $result = pg_query_params($connection, $query, array(
        $newDescription,
        $newPositionArray[0],
        $newPositionArray[1],
        $newPositionArray[2],
        $defectType,
        $defectSeverity,
        $id
    ));

    $result = pg_query($connection, $query);

    if (!$result) {
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