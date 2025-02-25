<?php
$connection = pg_connect("host=localhost port=5432 dbname=bridges user=postgres password=mysecretpassword");

if (!$connection) {
    echo "An error occurred.<br>";
    exit;
}

// Fetch existing element groups from db
$query = "SELECT name, COUNT(*) FROM structural_elements GROUP BY name";
$result = pg_query($connection, $query);

$elementGroups = array();
while ($row = pg_fetch_assoc($result)) {
    $elementGroups[] = $row;
}

// Close the database connection
pg_close($connection);

// Return the annotations as JSON
echo json_encode($elementGroups);
?>