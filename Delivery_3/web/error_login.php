<!DOCTYPE html>
<html>
<body>
<head>
<meta charset="UTF-8"/>
</head>

<?php
// Very top of your page
session_start();
// Let's check if there is any error stored in the session.
// In the case no errors found, it is better to redirect to another page...
// ...why anybody would end in this page if no errors were thrown?
if (isset($_SESSION['errors']) && !empty($_SESSION['errors'])) {
    header('Location: login.html');
    exit;
}
// If we reach this point it means there's at least an error
foreach ($_SESSION['errors'] as $errorCode => $errorMessage) {
    // Here we can display the errors...
    echo '<p>Error ', $errorCode, ': ', $errorMessage, '</p>', PHP_EOL;
}
// At the end you should to remove errors from the session
$_SESSION['errors'] = array();
// or
unset($_SESSION['errors']);
?>


<form action="ServerSide.php" method="post" accept-charset="UTF-8">
<h2>General Error Failure!</h2>
<p>Log in again please!</p>
<div>
<p>Name: <input type="text" name="username" style="display:flex;align-items:center;"/></p>
<p>Phone Number: <input type="text" name="phone_number" style="display:flex;align-items:center;"/></p>
<p>NIF: <input type="password" name="nif" style="display:flex;align-items:center;"/></p>
<p><input type="submit" value="login" name="login" style="display:flex;align-items:center;"/></p>
</div>
</form>

</body>
</html>
