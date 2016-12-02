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
//session_start();
function get_post_action($name)
{	
    $params = func_get_args();

    foreach ($params as $name) {
        if (isset($_POST[$name])) {
            return $name;
        }
    }
}

function testValidString($input_string) {
	if (ctype_space($input_string) || $input_string == '' || $input_string == NULL) {
		$error = 'String is empty!';
		throw new Exception($error);
	}
}

$global_nif = 0;

function testLogin($input_username,$input_nif,$input_phone,$db) {
    // Verify login credentials
    $DBusrn="";
    $DBphone = -1;
    //echo"<p>Validating credentials of " . $input_username ."</p>\n";
    // Get name and phone number of the given user
    try {
        $sql = "SELECT * FROM user WHERE nif=$input_nif"; 
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
        $global_nif = $input_nif;
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

function showLoginInformation() {
	?>
			<!-- Metodo POST que permite ao utilizador fazer log out -->
			<div>
			<form action="login.html">
				<input type="submit" value="Logout" style="position: fixed; bottom: 10; right:10"/>
			</form>
			</div>
			<div>
				<div id="ListSpaces" style="display: inline-block;">
					<form action="ServerSide.php" method="post" accept-charset="UTF-8">
					<p><input type="submit"  value="ListSpaces" name="ListSpaces"></p>
				</div>
				<div id="ListBuildings" style="display: inline-block;">
					<form action="ServerSide.php" method="post" accept-charset="UTF-8">
					<p><input type="submit"  value="ListBuildings" name="ListBuildings"></p>
				</div>
				<div id="ListPosts" style="display: inline-block;
					<form action="ServerSide.php" method="post" accept-charset="UTF-8">
					<p><input type="submit"  value="ListPosts" name="ListPosts"></p>
				</div>
				<div id="ListOffers" style="display: inline-block;">
					<form action="ServerSide.php" method="post" accept-charset="UTF-8">
					<p><input type="submit"  value="ListOffers" name="ListOffers"></p>
				</div>
				<div id="ListReservations" style="display: inline-block;">
					<form onSubmit="hide('ListReservations');"  action="ServerSide.php" method="post" accept-charset="UTF-8">
					<p><input type="submit"  value="ListReservations" name="ListReservations"></p>
				</div>
			</div>


	<?php
}

function listSpaces($connection) {
    /*
    morada varchar(50),
    codigo integer,
    */
    try{
        $sql = "SELECT * FROM espaco;";
        $result = $connection->query($sql);
        ?>
        <div id="postRemoval">
        <form action="ServerSide.php" method="post" accept-charset="UTF-8">
        <p>Introduza a morada do espaço a remover: <input type="text" name="addrToDelete" style="display:flex;align-items:center;"/></p>
        <p>Introduza o código do espaço a remover: <input type="text" name="codeToDelete" style="display:flex;align-items:center;"/></p>
        <p>
        <input type="submit"  value="Delete Space" name="deleteSpace" style="display:inline;">
        <input type="submit"  value="Insert Space" name="insertSpace" style="display:inline;">
        </p>
        </div>
        <?php
        //echo("<script>hide('ListSpaces');</script>");
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
        $sql = "SELECT * FROM edificio;";
        $result = $connection->query($sql);
        ?>
        <div id="buildingRemoval">
        <form action="ServerSide.php" method="post" accept-charset="UTF-8">
        <p>Introduza a morada do edificio a remover: <input type="text" name="addrToDelete" style="display:flex;align-items:center;"/></p>
        <p>
            <input type="submit"  value="Delete Building" name="deleteBuilding" style="display:inline;">
            <input type="submit"  value="Insert Building" name="insertBuilding" style="display:inline;">
        </p>
        </div>
        <?php
        echo("<div>");
        echo("<table id='QueryTables'border=\"0\" cellspacing=\"5\">\n");
        echo("<tr><td>--Address--</td><td>--Total Payment--</td></tr>\n");
		$payment = 0;
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row['morada']}</td>\n");
			$payment = totalPayment($connection,$row['morada']);
			foreach($payment as $p)
			{
			echo("<td>{$p['SUM(o.tarifa)*DATEDIFF(o.data_fim, o.data_inicio)']}</td>\n");
            }
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
        $sql = "SELECT * FROM posto;";
        $result = $connection->query($sql);
        ?>
        <div id="postRemoval">
        <form action="ServerSide.php" method="post" accept-charset="UTF-8">
        <p>Introduza a morada do posto: <input type="text" name="addrToDelete" style="display:flex;align-items:center;"/></p>
        <p>Introduza o código do posto: <input type="text" name="codeToDelete" style="display:flex;align-items:center;"/></p>
		<p>Introduza o código do espaço: <input type="text" name="codeSpaceToDelete" style="display:flex;align-items:center;"/></p>
        <p>
        <input type="submit"  value="Delete Post" name="deletePost" style="display:inline;">
        <input type="submit"  value="Insert Post" name="insertPost" style="display:inline;">
        </p>
        </div>
        <?php
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
        $sql = "SELECT * FROM aluga;";
        $result = $connection->query($sql);
        echo("<div>");
        echo("<table id='QueryTables'border=\"0\" cellspacing=\"5\">\n");
        echo("<tr><td>--Address--</td><td>--Code--</td><td>--Start Date--</td><td>--NIF--</td><td>--Reservation Number--</td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr>\n");
            echo("<td>{$row['morada']}</td>\n");
			echo("<td>{$row['codigo']}</td>\n");
			echo("<td>{$row['data_inicio']}</td>\n");
			echo("<td>{$row['nif']}</td>\n");
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
        throw $e;
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
        $sql = "SELECT * FROM oferta;";
        $result = $connection->query($sql);
        
        ?>
        <div id="offerListing">
        <form action="ServerSide.php" method="post" accept-charset="UTF-8">
        <p>Introduza a morada da oferta: <input type="text" name="addrToDelete" style="display:flex;align-items:center;"/></p>
        <p>Introduza o código da oferta: <input type="text" name="codeToDelete" style="display:flex;align-items:center;"/></p>
		<p>Introduza a data de inicio da oferta: <input type="text" name="startToDelete" style="display:flex;align-items:center;"/></p>
		<p>Introduza a data de fim da oferta: <input type="text" name="endToDelete" style="display:flex;align-items:center;"/></p>
        <p>Introduza a tarifa da oferta: <input type="text" name="priceToDelete" style="display:flex;align-items:center;"/></p>
        <p>
        <input type="submit"  value="Delete Offer" name="deleteOffer" style="display:inline;">
        <input type="submit"  value="Insert Offer" name="insertOffer" style="display:inline;">
        <input type="submit"  value="List Unreserved Offers" name="seeNonReservedOffers" style="display:inline;">
        </p>
        </div>
        <?php
        
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
        // $connection->query("rollback;");
        throw $e;
    }

}
//PHP a) edificio
function insertBuilding($connection,$addr) {
    try {
		testValidString($addr);
		$connection->query("start transaction;");
        //$sql = "INSERT INTO edificio (morada) VALUES ('$addr')";
        $sql = "CALL insertBuilding('$addr')"; 
        $connection->query($sql);
        $connection->query("commit");
        listBuildings($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}
//PHP a) edifico
function deleteBuilding($connection,$addr) {
    try {
		testValidString($addr);
		$connection->query("start transaction;");
        $sql = "DELETE FROM edificio WHERE morada='$addr'";
        $connection->query($sql);
        $connection->query("commit");
        listBuildings($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}

//PHP a) posto
function insertPost($connection,$addr,$code,$space_code) {
    try {
		testValidString($addr);
		testValidString($code);
		testValidString($space_code);
		$connection->query("start transaction;");
        $sql = "CALL insertPost('$addr','$code','$space_code')"; 
        //$sql = "INSERT INTO posto (morada, codigo, codigo_espaco) VALUES ('$addr','$code','$space_code')";
        $connection->query($sql);
        $connection->query("commit");
        listPosts($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}

//PHP a) posto
function deletePost($connection,$addr,$code,$space_code) {
    try {
		testValidString($addr);
		testValidString($code);
		$connection->query("start transaction;");
        $sql = "DELETE FROM posto WHERE morada='$addr' AND codigo ='$code';";
        $connection->query($sql);
        $connection->query("commit");
        listPosts($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}
//PHP a) espaco
function insertSpace($connection,$addr,$code) {
    try {
		testValidString($addr);
		testValidString($code);
		$connection->query("start transaction;");
        $sql = "CALL insertSpace('$addr','$code')";    
        $connection->query($sql);
        $connection->query("commit");
        listSpaces($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}
//PHP a) espaco
function deleteSpace($connection,$addr,$code) {
    try {
		testValidString($addr);
		testValidString($code);
		$connection->query("start transaction;");
        $sql = "DELETE FROM espaco WHERE morada='$addr' AND codigo ='$code'";
        $connection->query($sql);
        $connection->query("commit");
        listSpaces($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}

//PHP c)
function insertOffer($connection,$addr,$code,$start,$end,$price) {
    try {
		testValidString($addr);
		testValidString($code);
	    	testValidString($start);
	    	testValidString($end);
	   	testValidString($price);
		$connection->query("start transaction;");
        //$sql = "INSERT INTO oferta (morada, codigo, data_inicio, data_fim, tarifa) VALUES ('$addr','$code','$start','$end','$price')";
        $sql = 'CALL insertOffer($addr,$code,$start,$end,$price)';
	$connection->query($sql);
        $connection->query("commit");
        listOffers($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}

function deleteOffer($connection,$addr,$code,$start,$end,$price) {
    try {
		testValidString($addr);
		testValidString($code);
	    	testValidString($start);
	    	testValidString($end);
	   	testValidString($price);
		$connection->query("start transaction;");
        $sql = "DELETE FROM oferta WHERE morada='$addr' AND codigo='$code'AND data_inicio='$start' AND data_fim='$end' ANd tarifa='$price)";
        $connection->query($sql);
        $connection->query("commit");
        listOffers($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}
//PHP d)

function createReservation($connection,$numero,$date,$addr,$code,$nif) {
    try {
        $connection->query("start transaction;");
		$timestamp = date('Y-m-d G:i:s');
		$sql = "INSERT INTO reserva VALUES ('$numero');";
		$sql1 = "INSERT INTO aluga VALUES ('$addr','$code','$date','$nif','$numero');";
		$sql2 = "INSERT INTO estado VALUES ('$numero', '$timestamp','Aceite');";
        $connection->exec($sql);
        $connection->exec($sql1);
        $connection->exec($sql2);
        $connection->query("commit");
        seeNonReservedOffers($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}

function insertPayment($connection,$numero,$method) {
    try {
		testValidString($numero);
        testValidString($method);
		$connection->query("start transaction;");
		$timestamp = date('Y-m-d G:i:s');
        $sql2 = "INSERT INTO paga VALUES ('$numero', '$timestamp','$method');";
        $sql3 = "INSERT INTO estado VALUES ('$numero', '$timestamp','Paga');";
        $connection->exec($sql2);
        $connection->exec($sql3);
        $connection->query("commit");
        seeNonReservedOffers($connection);
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
    }
}
//PHP e)
function totalPayment($connection,$addr) {
    try {
		$connection->query("start transaction;");
        $sql = "SELECT SUM(o.tarifa)*DATEDIFF(o.data_fim, o.data_inicio) 
				FROM paga p  
				NATURAL JOIN oferta o 
				NATURAL JOIN espaco e  
				NATURAL JOIN aluga a 
				WHERE morada = '$addr' GROUP BY e.morada;";
		$result = $connection->query($sql);
        $connection->query("commit");
        return $result;
    }
    catch(PDOException $e) {
		$connection->query("rollback;");
        throw $e;
		return;
    }
	catch(Exception $e) {
		$connection->query("rollback;");
		throw $e;
	}
	
}

function seeNonReservedOffers($connection) {
    try {
		$connection->query("start transaction;");
        $sql = "SELECT * FROM oferta o WHERE o.morada NOT IN(SELECT morada FROM aluga);";
        $result = $connection->query($sql);
        $connection->query("commit");
        echo("<script>hide('QueryTables');</script>");
        //echo("<p>HERE'S THE FUCKING NIF "$_SESSION['nif']"</p>");
        //insertPayment($connection,$_POST['numberToInsert'],$_POST['dateToInsert'],$_POST['methodToInsert'],$_SESSION['nif'],$_POST['addrToInsert'],$_POST['codeToInsert']);
        ?>
        <div id="nonReserved">
        <form action="ServerSide.php" method="post" accept-charset="UTF-8">
        <p>Introduza a morada da oferta: <input type="text" name="addrToInsert" style="display:flex;align-items:center;"/></p>
        <p>Introduza o código da oferta: <input type="text" name="codeToInsert" style="display:flex;align-items:center;"/></p>
		<p>Introduza a data de inicio da oferta: <input type="text" name="dateToInsert" style="display:flex;align-items:center;"/></p>
		<p>Introduza o seu nif: <input type="text" name="nifToInsert" style="display:flex;align-items:center;"/></p>
		<p>Introduza o numero da reserva: <input type="text" name="numberToInsert" style="display:flex;align-items:center;"/></p>
		
		<!--<p>Introduza a data de fim da oferta: <input type="text" name="endToDelete" style="display:flex;align-items:center;"/></p>
        <p>Introduza a tarifa da oferta: <input type="text" name="priceToDelete" style="display:flex;align-items:center;"/></p>
        
        function createReservation($connection,$numero,$date,$addr,$code,$nif) {
        -->
        <p>
        <input type="submit"  value="create reservation" name="createReservation" style="display:inline;">
        </p>
        </div>
        <?php
        
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
		$connection->query("rollback;");
        throw $e;
    }

}

function seeNonPaidOffers($connection) {
    try {
		$connection->query("start transaction;");
        $sql = "SELECT * FROM oferta o WHERE o.morada NOT IN(SELECT morada FROM aluga);";
        $result = $connection->query($sql);
        $connection->query("commit");
        echo("<script>hide('QueryTables');</script>");
        //echo("<p>HERE'S THE FUCKING NIF "$_SESSION['nif']"</p>");
        //insertPayment($connection,$_POST['numberToInsert'],$_POST['dateToInsert'],$_POST['methodToInsert'],$_SESSION['nif'],$_POST['addrToInsert'],$_POST['codeToInsert']);
        ?>
        <div id="ReservedPay">
        <form action="ServerSide.php" method="post" accept-charset="UTF-8">
        <p>Introduza o numero da oferta a pagar: <input type="text" name="numberToInsert" style="display:flex;align-items:center;"/></p>
        <p>Introduza o metodo de pagamento: <input type="text" name="methodToInsert" style="display:flex;align-items:center;"/></p>
		
		<!--<p>Introduza a data de fim da oferta: <input type="text" name="endToDelete" style="display:flex;align-items:center;"/></p>
        <p>Introduza a tarifa da oferta: <input type="text" name="priceToDelete" style="display:flex;align-items:center;"/></p>
        
        function insertPayment($connection,$numero,$method) {
        -->
        <p>
        <input type="submit"  value="PAY" name="insertPayment" style="display:inline;">
        </p>
        </div>
        <?php
        
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
		$connection->query("rollback;");
        throw $e;
    }

}

?>

