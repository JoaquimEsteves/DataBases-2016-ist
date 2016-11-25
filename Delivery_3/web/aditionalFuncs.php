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

register_shutdown_function('ShutdownHandler');

// ----------------------------------------------------------------------------------------------------
// - Error Handler
// ----------------------------------------------------------------------------------------------------

$old_error_handler = set_error_handler("ErrorHandler");

//ACTUAL PHP CODE BELLOW

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
    //echo"<p>Validating credentials of " . $input_username ."</p>\n";
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
            return FALSE;
            //exit;
        }
        echo "<p>Valid Credentials! </p>\n";
        //Give the session the variables
        $_SESSION['username'] = $input_username; 
        $_SESSION['nif'] = $input_nif;
        $_SESSION['phone_number'] = $input_phone; 
        return TRUE;
        //<script type="text/javascript"> 
        //     window.location.href = "cool.html";
        //</script>
        // 
    }
    catch(Exception $e) {
        echo "<p>Invalid credentials! Exit!</p>\n";
        echo("<form action='login.html'>
        <input type='submit' value='Try again' />
        </form>");
        $db = null;
        return FALSE;
        //exit;
    }
}

function listSpaces($connection) {
    /*
    morada varchar(50),
    codigo integer,
    */
    try{
        $sql = "SELECT * FROM Espaco;";
        $result = $connection->query($sql);
        echo("<script>hide('ListSpaces');</script>");
        echo("<div id=\'SpaceTable'>");
        echo("<table id='QueryTables' border=\"0\" cellspacing=\"5\">\n");
        echo("<tr><td>--Address--</td><td>--Code--</td></tr>\n");
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
        echo("<button style=\"display:inline;\" id=\"hide\" onclick=\"hide('QueryTables');hide('hide');\">Hide</button>");
        }
        catch(PDOException $e) {
            echo("<p>ERROR: {$e->getMessage() } </p>");
        }
}

function listBuildings($connection) {
    /*
    morada varchar(50),
    */
    try {
        $sql = "SELECT * FROM Edificio;";
        $result = $connection->query($sql);
        echo("<div>");
        echo("<table id='QueryTables'border=\"0\" cellspacing=\"5\">\n");
        echo("<tr><td>--Address--</td></tr>\n");
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
        
        echo("<button style=\"display:inline;\" id=\"hide\" onclick=\"hide('QueryTables');hide('hide');\">Hide</button>");
    }
    catch(PDOException $e) {
        echo("<p>ERROR: {$e->getMessage() } </p>");
    }
}

function listPosts($connection) {
    /*
    morada varchar(50),
    codigo integer,
    codigo_espaco integer,
    */
    try{
        $sql = "SELECT * FROM Posto;";
        $result = $connection->query($sql);
        echo("<div>");
        echo("<table id='QueryTables'border=\"0\" cellspacing=\"5\">\n");
        echo("<tr><td>--Address--</td><td>--Code--</td><td>--Space Code--</td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row['morada']}</td>\n");
            echo("<td>{$row['codigo']}</td>\n");
            echo("<td>{$row['codigo_espaco']}</td>\n");
            //echo("<td><a href=\"balance.php?account_number={$row['account_number']}\">Change balance</a></td>\n");
            echo("</tr>\n");
        }
        echo("</table>\n");
        echo("</div>\n");
        //onclick="this.parentNode.style.display = 'none'"
        
        echo("<button style=\"display:inline;\" id=\"hide\" onclick=\"hide('QueryTables');hide('hide');\">Hide</button>");
    }
    catch(PDOException $e) {
        echo("<p>ERROR: {$e->getMessage() } </p>");
    }
}
function listReservations($connection) {
/*
numero integer,
*/
    try {
        $sql = "SELECT * FROM Reserva;";
        $result = $connection->query($sql);
        echo("<div>");
        echo("<table id='QueryTables'border=\"0\" cellspacing=\"5\">\n");
        echo("<tr><td>--Reservation Number--</td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row['numero']}</td>\n");
            //echo("<td>{$row['balance']}</td>\n");
            //echo("<td><a href=\"balance.php?account_number={$row['account_number']}\">Change balance</a></td>\n");
            echo("</tr>\n");
        }
        echo("</table>\n");
        echo("</div>\n");
        //onclick="this.parentNode.style.display = 'none'"
        
        echo("<button style=\"display:inline;\" id=\"hide\" onclick=\"hide('QueryTables');hide('hide');\">Hide</button>");
    }
    catch(PDOException $e) {
        echo("<p>ERROR: {$e->getMessage() } </p>");
    }


}
function listOffers($connection) {
/*
morada varchar(50),
codigo integer,
data_inicio date,
data_fim date,
tarifa double,
*/
    try {
        $sql = "SELECT * FROM Oferta;";
        $result = $connection->query($sql);
        echo("<div>");
        echo("<table id='QueryTables'border=\"0\" cellspacing=\"5\">\n");
        echo("<tr><td>--Address--</td><td>--Code--</td><td>--Start-Date--</td><td>--Final-Date--</td><td>Tariff</td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row['morada']}</td>\n");
            echo("<td>{$row['codigo']}</td>\n");
            echo("<td>{$row['data_inicio']}</td>\n");
            echo("<td>{$row['data_fim']}</td>\n");
            echo("<td>{$row['tarifa']}</td>\n");
            //echo("<td><a href=\"balance.php?account_number={$row['account_number']}\">Change balance</a></td>\n");
            echo("</tr>\n");
        }
        echo("</table>\n");
        echo("</div>\n");
        //onclick="this.parentNode.style.display = 'none'"
        
        echo("<button style=\"display:inline;\" id=\"hide\" onclick=\"hide('QueryTables');hide('hide');\">Hide</button>");
    }
    catch(PDOException $e) {
        echo("<p>ERROR: {$e->getMessage() } </p>");
    }

}


?>

