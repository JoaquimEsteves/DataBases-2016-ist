<html>
<body>
<?php 

session_start();

function get_post_action($name)
{	
    $params = func_get_args();

    foreach ($params as $name) {
        if (isset($_POST[$name])) {
            return $name;
        }
    }
}

function testLogin($input_username,$input_nif,$input_phone) {
	//Verify login credentials
	$DBusrn="";
	$DBphone = -1;
	echo("<p>Validating credentials of $input_username</p>\n");
	//Get name and phone number of the given user
	$sql = "SELECT * FROM User WHERE nif=" . $input_nif; 
	$result = $connection->query($sql);
	if (!$result) {
		echo("<p> ERROR:[Could not execute this query]:($sql)<p>");
		exit();
	}
	foreach($result as $i){
		$DBusrn = $i["nome"];
		$DBphone = $i["telefone"];
	}
	if ($DBusrn != $input_username OR empty($DBusrn) OR $DBphone != $input_phone OR $DBphone == -1) {
		echo "<p>Invalid credentials! Exit!</p>\n";
		echo("<form action='login.html'>
		<input type='submit' value='Try again' />
		</form>");
		$connection = null;
		exit;
	}
	echo "<p>Valid Credentials! </p>\n";
}

//Connection to DB
$host="db.ist.utl.pt";
$user="ist177020"; // Replace if needed
$password="fuckyou"; //TODO: FIX THIS DON'T EVEN THINK ABOUT SENDING IT TO THE PROF LIKE THIS IMPORTANT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
$dbname = $user;
echo("<p>Welcome to InstantOffice</p>\n");
$connection = new PDO("mysql:host=" . $host. ";dbname=" . $dbname, $user, $password, 
array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
echo("<p>Connected to MySQL database $dbname on $host as user $user</p>\n");

// switch utiliza a funçao get_post_action com os names dos metodos post neste caso atualizar
switch (get_post_action('login')) {
	
	//Quando o utilizador faz login, as variaveis deste são passadas para as do php
	case'login':
	$username = $_POST["username"];
	$nif = $_POST["nif"];
	$phone_number = $_POST["phone_number"];
	testLogin($username,$nif,$phone_number);
	// Give the session the variables
	$_SESSION['username'] = $username; 
	$_SESSION['nif'] = $nif;
	$_SESSION['phone_number'] = $phone_number; 
	break; 
}



/*#################### Alteraçao em relaçao ao codigo anterior##############################*/

// echo("<h2>Selecione a data dos leiloes na qual se pretende inscrever</h2>");
// começo da lista da dropbox para selecionar as datas de inicio dos leiloes
// echo("<form method='post' action='registo.php'>");
// echo "<select name=dia>"; 
//query para selecionar as datas em que existem leiloes para inscrição
// $sql = "SELECT DISTINCT L.dia FROM leilao L, leilaor LR WHERE L.tipo=1 AND L.nif = LR.nif AND L.dia = LR.dia AND L.nrleilaonodia = LR.nrleilaonodia AND DATEDIFF(ADDDATE(L.dia, LR.nrdias), CURDATE()) > 0"; 
// $result = $connection->query($sql);
// echo("<option value=''>Selecionar data:</option>");
// foreach($result as $row){
// echo "<option value=$row[dia]>$row[dia]</option>";
// }
// echo("</select>");
// echo("<input type='submit' name='escolha' value='Selecionar' />");
// echo("</form>");

?>
<!-- Metodo POST que permite ao utilizador fazer log out -->
<form action="login.html">
	<input type="submit" value="Logout" />
</form>

</body>
</html>
