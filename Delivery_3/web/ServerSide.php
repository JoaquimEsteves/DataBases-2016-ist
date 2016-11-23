<html>
<body>
<?php 

// ----------------------------------------------------------------------------------------------------
// - Display Errors
// ----------------------------------------------------------------------------------------------------
ini_set('display_errors', 'On');
ini_set('html_errors', 0);

// ----------------------------------------------------------------------------------------------------
// - Error Reporting
// ----------------------------------------------------------------------------------------------------
error_reporting(-1);

// ----------------------------------------------------------------------------------------------------
// - Shutdown Handler
// ----------------------------------------------------------------------------------------------------
function ShutdownHandler()
{
    if(@is_array($error = @error_get_last()))
    {
        return(@call_user_func_array('ErrorHandler', $error));
    };

    return(TRUE);
};

register_shutdown_function('ShutdownHandler');

// ----------------------------------------------------------------------------------------------------
// - Error Handler
// ----------------------------------------------------------------------------------------------------
function ErrorHandler($type, $message, $file, $line)
{
    $_ERRORS = Array(
        0x0001 => 'E_ERROR',
        0x0002 => 'E_WARNING',
        0x0004 => 'E_PARSE',
        0x0008 => 'E_NOTICE',
        0x0010 => 'E_CORE_ERROR',
        0x0020 => 'E_CORE_WARNING',
        0x0040 => 'E_COMPILE_ERROR',
        0x0080 => 'E_COMPILE_WARNING',
        0x0100 => 'E_USER_ERROR',
        0x0200 => 'E_USER_WARNING',
        0x0400 => 'E_USER_NOTICE',
        0x0800 => 'E_STRICT',
        0x1000 => 'E_RECOVERABLE_ERROR',
        0x2000 => 'E_DEPRECATED',
        0x4000 => 'E_USER_DEPRECATED'
    );

    if(!@is_string($name = @array_search($type, @array_flip($_ERRORS))))
    {
        $name = 'E_UNKNOWN';
    };

    return(print(@sprintf("%s Error in file \xBB%s\xAB at line %d: %s\n", $name, @basename($file), $line, $message)));
};

$old_error_handler = set_error_handler("ErrorHandler");

//ACTUAL PHP CODE BELLOW

try{
	session_start();
	
	//Connection to DB
	$host="db.ist.utl.pt";
	$user="ist177020"; // Replace if needed
	$password="fuckyou"; //TODO: FIX THIS DON'T EVEN THINK ABOUT SENDING IT TO THE PROF LIKE THIS IMPORTANT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	$dbname = $user;
	// $connection = new PDO("mysql:host=$host;dbname=$dbname", $user, $password); 
	$connection = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
	$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	echo("<p>Welcome to InstantOffice</p>\n");
	// array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
	echo("<p>Connected to MySQL database $dbname on $host as user $user</p>\n");
	
	function get_post_action($name)
	{	
		$params = func_get_args();

		foreach ($params as $name) {
			if (isset($_POST[$name])) {
				return $name;
			}
		}
	}

	function testLogin($input_username,$input_nif,$input_phone,$db) {
		// Verify login credentials
		$DBusrn="";
		$DBphone = -1;
		echo"<p>Validating credentials of " . $input_username ."</p>\n";
		// Get name and phone number of the given user
		try {
			$sql = "SELECT * FROM User WHERE nif=$input_nif"; 
			$result = $db->query($sql);
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
		catch(Exception $e) {
			echo "<p>Invalid credentials! Exit!</p>\n";
			echo("<form action='login.html'>
			<input type='submit' value='Try again' />
			</form>");
			$connection = null;
			exit;
		}
	}
	
	
	//switch utiliza a funçao get_post_action com os names dos metodos post neste caso atualizar
	switch (get_post_action('login')) {
		
		//Quando o utilizador faz login, as variaveis deste são passadas para as do php
		case'login':
		$username = $_POST["username"];
		$nif = $_POST["nif"];
		$phone_number = $_POST["phone_number"];
		testLogin($username,$nif,$phone_number,$connection);
		//Give the session the variables
		$_SESSION['username'] = $username; 
		$_SESSION['nif'] = $nif;
		$_SESSION['phone_number'] = $phone_number; 
		break; 
	}
}
catch(PDOException $e) {
	echo("<p>ERROR: {$e->getMessage() } </p>");
}
?>
<!-- Metodo POST que permite ao utilizador fazer log out -->
<form action="login.html">
	<input type="submit" value="Logout" />
</form>

</body>
</html>
