<?php
$mysql_host = getenv('MYSQL_HOST');
$mysql_user = getenv('MYSQL_USER');
$mysql_pass = getenv('MYSQL_PASSWORD');
$mysql_db   = getenv('MYSQL_DB');

$mongo_uri = getenv('MONGO_URI');
// Connect to MySQL
try {
    $mysql = new PDO("mysql:host=$mysql_host;dbname=$mysql_db", $mysql_user, $mysql_pass);
    $mysql->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $mysqlData = $mysql->query('SELECT "MySQL Connection Successful" AS msg')->fetch();
} catch (PDOException $e) {
    $mysqlData = ['msg' => $e->getMessage()];
}

// Connect to MongoDB using MongoDB\Driver\Manager
try {
    $manager = new MongoDB\Driver\Manager($mongo_uri);
    $query = new MongoDB\Driver\Query([]); // Empty filter to fetch all documents
    $cursor = $manager->executeQuery("testdb.test", $query);

    $mongoData = [];
    foreach ($cursor as $document) {
        $mongoData[] = (array) $document;
    }
} catch (Exception $e) {
    $mongoData = [['msg' => $e->getMessage()]];
}

// Display data
echo "<h1>Database Connections</h1>";

echo "<h2>MySQL</h2>";
echo "<p>{$mysqlData['msg']}</p>";

echo "<h2>MongoDB</h2>";
if (!empty($mongoData)) {
    foreach ($mongoData as $doc) {
        echo "<p>" . htmlspecialchars(json_encode($doc)) . "</p>";
    }
} else {
    echo "<p>No data found.</p>";
}
?>
