<html>
<body>
<head>
<meta charset="UTF-8"/>
</head>
<script>
//Because jQuery is garbage
function hide(obj) {

    var el = document.getElementById(obj);

        el.style.display = 'none';

}
function show(obj) {
    var el = document.getElementById(obj);

    el.style.display = 'inline';
}
</script>
<?php 
//DEBUG FEATURES
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
	if (!isset($_SESSION['EXPIRES']) || $_SESSION['EXPIRES'] < time()+3600) {
		// Unset all of the session variables.
		$_SESSION = array();

		// If it's desired to kill the session, also delete the session cookie.
		// Note: This will destroy the session, and not just the session data!
		if (ini_get("session.use_cookies")) {
			$params = session_get_cookie_params();
			setcookie(session_name(), '', time() - 42000,
				$params["path"], $params["domain"],
				$params["secure"], $params["httponly"]
			);
		}

		// Finally, destroy the session.
		session_destroy();
	}
	$_SESSION['EXPIRES'] = time() + 3600;
	$_SESSION['errors'] = array();
	//Connection to DB
	$host="db.ist.utl.pt";
	$user="ist177020"; // Replace if needed
	$password="fuckyou"; //TODO: FIX THIS DON'T EVEN THINK ABOUT SENDING IT TO THE PROF LIKE THIS IMPORTANT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	$dbname = $user;
	// $connection = new PDO("mysql:host=$host;dbname=$dbname", $user, $password); 
	$connection = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
	$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	//$_SESSION['logged_in'] = FALSE;

	echo("<p>Welcome to InstantOffice</p>\n");
	// array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
	echo("<p>Connected to MySQL database $dbname on $host as user $user</p>\n");
	
    //Include aditional functions here!
    include 'aditionalFuncs.php';   
    
	showLoginInformation();
	
	//switch utiliza a funçao get_post_action com os names dos metodos post neste caso atualizar
	switch (get_post_action('login','ListSpaces','ListBuildings','ListPosts','ListOffers','ListReservations','deleteBuilding','deleteSpace','deletePost',
							'insertBuilding','insertSpace','insertPost')) {
		
		//Quando o utilizador faz login, as variaveis deste são passadas para as do php
		case'login':
			$username = $_POST["username"];
			$nif = $_POST["nif"];
			$phone_number = $_POST["phone_number"];
			//From aditional funcs
			$_SESSION['logged_in'] = testLogin($username,$nif,$phone_number,$connection);
			//Show extra information if logged in!
			   //forms
			if(!$_SESSION['logged_in']) {
				header('Location: loginFail.html');
			}
			//end of extra information
			
			break; 

        case'ListSpaces':
            listSpaces($connection);
            break;
		case'ListBuildings':
            listBuildings($connection);
            break;
        case 'ListPosts':
            listPosts($connection);
            break;
        case 'ListOffers':
            listOffers($connection);
            break;
        case 'ListReservations':
            listReservations($connection);
            break;
        case 'deleteBuilding':
            deleteBuilding($connection,$_POST['addrToDelete']);
            break;
        case 'deleteSpace':
            deleteSpace($connection , $_POST['addrToDelete'], $_POST['codeToDelete']) ;
            break;
        case 'deletePost':
            deletePost($connection,$_POST['addrToDelete'],$_POST['codeToDelete'],$_POST['codeToCodeSpace']);
            break;
		case 'deleteOferta':
			deleteOferta($connection,$_POST['addrToDelete'],$_POST['codeToDelete'],$_POST['startToDelete'],$_POST['endToDelete'],$_POST['priceToDelete']);
			break;
		case 'insertBuilding':
			insertBuilding($connection,$_POST['addrToInsert']);
			break;
		case 'insertSpace':
			insertSpace($connection , $_POST['addrToInsert'], $_POST['codeToInsert']);
			break;
		case 'insertPost':
			insertPost($connection , $_POST['addrToInsert'], $_POST['codeToInsert'],$_POST['codeSpaceToInsert']);
			break;
		case 'insertOferta':
			insertOferta($connection,$_POST['addrToInsert'],$_POST['codeToInsert'],$_POST['startToInsert'],$_POST['endToInsert'],$_POST['priceToInsert']);
			break;
		case 'insertPayment':
			insertPayment($connection,$_POST['numberToInsert'],$_POST['dateToInsert'],$_POST['methodeToInsert']);
			break;
	
}
catch(Exception $e ) {
	if ($e instanceof PDOException) {
		$_SESSION['errors'] = $e->getMessage();
		echo("<p>ERROR: {$e->getMessage() } </p>");
    } else {
        $_SESSION['errors'] = "GENERAL ERROR";
		header('Location: error_login.php');
    }
	
}
?>

</body>
</html>
