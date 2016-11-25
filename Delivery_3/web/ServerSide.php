<html>
<body>
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
	
	//Connection to DB
	$host="db.ist.utl.pt";
	$user="ist177020"; // Replace if needed
	$password="fuckyou"; //TODO: FIX THIS DON'T EVEN THINK ABOUT SENDING IT TO THE PROF LIKE THIS IMPORTANT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	$dbname = $user;
	// $connection = new PDO("mysql:host=$host;dbname=$dbname", $user, $password); 
	$connection = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
	$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$logged_In = FALSE;
	echo("<p>Welcome to InstantOffice</p>\n");
	// array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
	echo("<p>Connected to MySQL database $dbname on $host as user $user</p>\n");
    //Include aditional functions here!
    include 'aditionalFuncs.php';
		
	//switch utiliza a funçao get_post_action com os names dos metodos post neste caso atualizar
	switch (get_post_action('login','ListSpaces','ListBuildings')) {
		
		//Quando o utilizador faz login, as variaveis deste são passadas para as do php
		case'login':
			$username = $_POST["username"];
			$nif = $_POST["nif"];
			$phone_number = $_POST["phone_number"];
			//From aditional funcs
			$_SESSION['logged_in'] = testLogin($username,$nif,$phone_number,$connection);
			//Give the session the variables
			$_SESSION['username'] = $username; 
			$_SESSION['nif'] = $nif;
			$_SESSION['phone_number'] = $phone_number; 
			break; 

        case'ListSpaces':
        
            $sql = "SELECT * FROM Espaco;";
        
            $result = $connection->query($sql);
        	echo("<div id=\'SpaceTable'>");
            echo("<table id='SpaceTables' border=\"0\" cellspacing=\"5\">\n");
            echo("<tr><td>morada</td><td>code</td></tr>\n");
            foreach($result as $row)
            {
                echo("<tr>\n");
                echo("<td>{$row['morada']}</td>\n");
                echo("<td>{$row['codigo']}</td>\n");
                //echo("<td>{$row['balance']}</td>\n");
                //echo("<td><a href=\"balance.php?account_number={$row['account_number']}\">Change balance</a></td>\n");
                echo("</tr>\n");
            }
            echo("</table>\n");
            echo("</div>\n");
            //onclick="this.parentNode.style.display = 'none'"
            echo("<button style=\"display:inline;\" id=\"hideS\" onclick=\"hide('SpaceTables');hide('hide');show('ListSpaces');\">Hide</button>");
            break;
		case'ListBuildings':
            $sql = "SELECT * FROM Edificio;";
        
            $result = $connection->query($sql);
        	echo("<div>");
            echo("<table id='BuildingTables'border=\"0\" cellspacing=\"5\">\n");
            echo("<tr><td>morada</td></tr>\n");
            foreach($result as $row)
            {
                echo("<tr>\n");
                echo("<td>{$row['morada']}</td>\n");
                //echo("<td>{$row['balance']}</td>\n");
                //echo("<td><a href=\"balance.php?account_number={$row['account_number']}\">Change balance</a></td>\n");
                echo("</tr>\n");
            }
            echo("</table>\n");
            echo("</div>\n");
            //onclick="this.parentNode.style.display = 'none'"
            echo("<button style=\"display:inline;\" id=\"hideB\" onclick=\"hide('BuildingTables');hide('hide');show('ListSpaces');\">Hide</button>");
            break;
	}
}
catch(PDOException $e) {
	echo("<p>ERROR: {$e->getMessage() } </p>");
}


if($_SESSION['logged_in']) {?>
<!-- Metodo POST que permite ao utilizador fazer log out -->
<form action="login.html">
	<input type="submit" value="Logout" style="position: fixed; bottom: 10;"/>
</form>
<form onSubmit="hide('ListSpaces');" id="ListSpaces" action="ServerSide.php" method="post" accept-charset="UTF-8">
<div>
    <p><input type="submit" value="ListSpaces" name="ListSpaces" style="display:flex;align-items:center;"/></p>
</div>
<form onSubmit="hide('ListBuildings');" id="ListBuildings" action="ServerSide.php" method="post" accept-charset="UTF-8">
<div>
    <p><input type="submit" value="ListBuildings" name="ListBuildings" style="display:flex;align-items:center;"/></p>
</div>
<?php
}
else { } 
?>


</body>
</html>
