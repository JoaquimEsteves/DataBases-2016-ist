<?php 
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
            return FALSE;
            //exit;
        }
        echo "<p>Valid Credentials! </p>\n";
        ?>
        <script type="text/javascript"> 
            window.location.href = "cool.html";
        </script>
        
        <?php
        return TRUE;
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

?>

