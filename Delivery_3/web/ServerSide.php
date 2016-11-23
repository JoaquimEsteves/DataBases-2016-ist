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
switch (get_post_action('continua','volta','login','escolha')) {
	
	//Quando o utilizador escolhe o dia para se inscrever nos leiloes
	case'escolha':
		//recolha da variavel com o dia (para a inscrição) selecionado anteriormente no metodo POST 
		$dia=$_POST['dia'];
		$username = $_SESSION["username"];
		$pintest=0;
		$_SESSION['dia']=$dia;
	
	//query que seleciona os leiloes com inicio do dia escolhido e verificando a sua data de terminação
	$sql = "SELECT * FROM leilao L, leilaor LR WHERE L.dia='$dia' AND L.tipo=1 AND L.nif = LR.nif AND L.dia = LR.dia AND L.nrleilaonodia = LR.nrleilaonodia AND DATEDIFF(ADDDATE(L.dia, LR.nrdias), CURDATE()) > 0"; 
	$result = $connection->query($sql);
	if(!$result){
		echo("<p>Erro na Query:($sql) <p>");
		exit();
	}
	//criaçao da tabela para os leiloes e os lances
	echo("<table border=\"1\">\n");
	echo("<tr><td>lid</td><td>nif</td><td>dia inicial</td><td>NrDeDias</td><td>nome</td><td>tipo</td><td>valorbase</td><td>Inscricao</td></tr>\n");

	foreach($result as $row){

		echo("<tr><td>");
		echo($row["lid"]); echo("</td><td>");
		echo($row["nif"]); echo("</td><td>");
		echo($row["dia"]); echo("</td><td>");
		echo($row["nrdias"]); echo("</td><td>");
		echo($row["nome"]); echo("</td><td>");
		echo($row["tipo"]); echo("</td><td>");
		echo($row["valorbase"]); echo("</td><td>");
		
		//query para verificar que leiloes o utilizador esta incrito ou nao 
		$sql = "SELECT * FROM concorrente WHERE leilao=$row[lid] AND pessoa=$username"; 
		$result2 = $connection->query($sql);
		if (!$result2) {
				echo("<p>Erro na Query:($sql) <p>");
				exit();
		}
		$i=0;
		foreach($result2 as $row2){
			$i++;
			echo("Inscrito"); echo("</td>");
		}
		if($i==0){echo("Nao Inscrito"); echo("</td>");};
	}
	echo "</select>";
	echo("</table>\n");
	?>
	
	<!-- a form que permite atraves do POST que o utilizador se inscreva em 1 ou mais leiloes -->
	<form method="post" action="registo.php">
	<br>
	<input id="last[0]" name="lid[]">
	<input type="button" value="+" onclick="insert()">
	<input type="submit" name="continua" value="Inscrever" />
	</form>

	<?php 
	break;
	
	//Quando o utilizador faz login, as variaveis deste são passadas para as do php
	case'login':
	$username = $_POST["username"];
	$pin = $_POST["pin"];
	$pintest=1;
	break;
	
	//Caso em que o utilizador retrocedeu para esta pagina e as variaveis deste são passadas para as do php
	case 'volta':
	$pintest=0;
	$username = $_SESSION["username"];
	$nif = $_SESSION["nif"];
	break;
	
	//Caso em que o utlizador se pretende inscrever em leiloes
    case 'continua':
    //Passagem das variaveis do metodo POST para variaveis do php
	$lid=$_POST['lid'] ;
	$dia=$_SESSION["dia"];
	$username = $_SESSION["username"];
	$nif = $_SESSION["nif"];
	$pintest=0;
	$size=0;
	$inscrito=array();
	
	$_SESSION["username"]=$username;
	$_SESSION["nif"]=$nif;
	
	//Começo da Transacção
	$connection->beginTransaction();
	for($i=0;$i<count($_POST["lid"]);$i++)
	{
		
	$newlid=$_POST["lid"][$i];
	
	//query para verificar se o leilao dado pelo utilizador é valido
	$sql = "SELECT * FROM leilaor LR, leilao L WHERE L.dia='$dia' AND LR.lid=$newlid AND DATEDIFF(ADDDATE(L.dia, LR.nrdias), CURDATE()) > 0";
	$result = $connection->query($sql);
	$num_rows=$result->rowCount();
	if (($num_rows==0)) {
		echo("<p> Lance nao registado, Leilao $newlid  nao disponivel para inscricao <p>");
		//Caso qualquer um dos leiloes seja invalido é feito rollBack
		$connection->rollBack();
		echo("<form action='registo.php' method='post'>
		<input type='submit' value='Voltar' name='volta'/>
		</form>");
		break;
		
	}	
	//Incrição do utilizador no leilao
	$sql = "INSERT INTO concorrente (pessoa,leilao) VALUES ($username, $newlid)"; 
	$result1 = $connection->query($sql);
	if (!$result1) {
		$size=0;
		echo("<p> Pessoa nao registada: Erro na Query:($sql) <p>");
		$connection->rollBack();
		echo("<form action='registo.php' method='post'>
		<input type='submit' value='Voltar' name='volta'/>
		</form>");
		break;
			
		}
	else{
		$inscrito[$size]=$newlid;
		$size++;
		}
	}
	
	
	//Fim da Transação
	$connection->commit();
	//Confirmação que a inscrição foi efectuado com sucesso nos leiloes selecionados
	for($x = 0; $x < $size; $x++) {
		echo ("<p>Registo efectuado com sucesso no leilao $inscrito[$x] <p>");
	}
	break;

    default:
   
}

//Verificaçao do pin do utilizador, so e feita a primeira fez acede a pagina
if($pintest == 1){
	$safepin=-1;
	echo("<p>Valida Pin da Pessoa $username</p>\n");
	// obtem o pin da tabela pessoa
	$sql = "SELECT * FROM pessoa WHERE nif=" . $username; 
	$result = $connection->query($sql);
	if (!$result) {
	echo("<p> Erro na Query:($sql)<p>");
	exit();
	}
	foreach($result as $row){
	$safepin = $row["pin"];
	$nif = $row["nif"];
	}
	if ($safepin != $pin OR $safepin==-1 ) {
	echo "<p>Pin Invalido! Exit!</p>\n";
	echo("<form action='login.html'>
	<input type='submit' value='Voltar Login' />
	</form>");
	$connection = null;
	 exit;
	}
	echo "<p>Pin Valido! </p>\n";
}

// passa variaveis para a sessao;
$_SESSION['username'] = $username; 
$_SESSION['nif'] = $nif; 

/*#################### Alteraçao em relaçao ao codigo anterior##############################*/

echo("<h2>Selecione a data dos leiloes na qual se pretende inscrever</h2>");
//começo da lista da dropbox para selecionar as datas de inicio dos leiloes
echo("<form method='post' action='registo.php'>");
echo "<select name=dia>"; 
//query para selecionar as datas em que existem leiloes para inscrição
$sql = "SELECT DISTINCT L.dia FROM leilao L, leilaor LR WHERE L.tipo=1 AND L.nif = LR.nif AND L.dia = LR.dia AND L.nrleilaonodia = LR.nrleilaonodia AND DATEDIFF(ADDDATE(L.dia, LR.nrdias), CURDATE()) > 0"; 
$result = $connection->query($sql);
echo("<option value=''>Selecionar data:</option>");
foreach($result as $row){
echo "<option value=$row[dia]>$row[dia]</option>";
}
echo("</select>");
echo("<input type='submit' name='escolha' value='Selecionar' />");
echo("</form>");

?>
<!-- #### alteraçao ao codigo anterior ###
Javscript para poder criar mais textbox para a possibilidade de se inscrever a mais leiloes -->

<script>
var i=0
function insert()
{
	last=document.getElementById("last["+i+"]")
	i++
	last.insertAdjacentHTML("AfterEnd", '<br><input name="lid[]" id="last['+i+']">') 
}
</script>
<!-- Metodo POST que permite ao utilizador começar os lances -->
<form method="post" action="leilao.php">
	<input type="submit" name="mudapag" value="Comecar lances" />
</form>
<!-- Metodo POST que permite ao utilizador fazer log out -->
<form action="login.html">
	<input type="submit" value="Logout" />
</form>

</body>
</html>
