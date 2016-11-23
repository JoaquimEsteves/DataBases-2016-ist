<html>
 <body>
<?php
 try
 {
 $host = "db.ist.utl.pt";
 $user ="ist177020";
 $password = "fuckyou";
 $dbname = $user;

 $db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
 $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

 $sql = "SELECT * FROM User;";

 $result = $db->query($sql);

 echo("<table border=\"1\">\n");
 echo("<tr><td>nif</td><td>nome</td><td>telefone</td></tr>\n");
 foreach($result as $row)
 {
 echo("<tr><td>");
 echo($row['nif']);
 echo("</td><td>");
 echo($row['nome']);
 echo("</td><td>");
 echo($row['telefone']);
 echo("</td></tr>\n");
 }
 echo("</table>\n");

 $db = null;
 }
 catch (PDOException $e)
 {
 echo("<p>ERROR: {$e->getMessage()}</p>");
 }
?>
 </body>
</html>