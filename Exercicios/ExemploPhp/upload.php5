<!DOCTYPE html>
<html>
<head>
	<title>Exemplo de um formulário WEB com Upload de arquivo </title>
</head>
<body>
	<table border = "0" cellpadding="3" cellspacing="0" width="100%"> <!-- table -> comando para  criação de tabela -->
		<tr>
			<td height="30" bgcolor="#8CDAFF">
				<b> Upload de Arquivo</b>							
			</td>
			<td align="right" bgcolor="#8CDAFF">
				<?=date("d-m-y h:i:S") ?>&nbsp;
			</td>
		</tr>
	</table>
<?php
		// 1º definir os parametros de teste
	$tamanho_maximo = 100000; // em bytes
	$tipos_aceitos = array("image/gif",
						   "image/pjpeg", 
						   "image/x-png",
						   "image/bmp");
		// 2º validar o arquivo enviado
		// A variavel global $_FILES contará toda a informação do arquivo enviado.
		// note que $_FILE assume o nome do arquivo enviado ARQUIVO
		// Variavel $arquivo recebe os parametros ARQUIVO de $_FILES
	$arquivo = $_FILES['arquivo'];
	if ($arquivo['error'] != 0) {
		echo '<p><b><font color="red">ERRO NO UPLOAD DO ARQUIVO<br>';
		// tratamento de possiveis erros do envio do arquivo
		switch ($arquivo[erro]) {
			case UPLOAD_ERR_INI_SIZE:
				echo 'O Arquivo excede o tamanho máximo permitidio';
				break;
			case UPLOAD_ERR_FORM_SIZE:
				echo 'O arquivo enviado é muito grande';
				break;
			case UPLOAD_ERR_PARTIAL:
				echo "O upload não foi completo";
				break;
			case UPLOAD_ERR_NO_FILE:
				echo "Nenhum arquivo foi informado para upload";
				break;
		}

		echo '</font></b></p>';
		exit;
	}
	if ($arquivo['size']==0 OR $arquivo['tmp_name']==NULL) {
			echo '<p><b><font color="red">Nenhum arquivo enviado</font></p></b>';
				('<p><b><font color="red">Tamanho máximo = ' . $tamanho_maximo . '</font></b></p>');
			exit;
		}
	if (array_search($arquivo['type'],$tipos_aceitos)==FALSE) {
				echo '<p><b><font color="red">O arquivo enviado não é do tipo permitido (' . $arquivo['type'] . ') aceito 			para upload.
					os tipos aceitos são:  </font></b></p>';
					echo "<pre>";
					print_r($tipos_aceitos);
					echo "</pre>";
					exit;
		}
		// o arquivo é enviado para uma pasta pré-definida
		$destino = 'E:\ETEC ZL\TPI1' . $arquivo['name'];
	if (move_uploaded_file($arquivo['tmp_name'],$destino)) {
			echo '<p><b><font color="navy">';
			echo 'ARQUIVO FOI CARREGADO COM SUCESSO </p></b></font color="navy">';
			echo "<img src='$destino' border=0>";
			# code...
		}
	else{
			echo '<p><b><font color="red">Ocorreu um erro durante o Upload </font></b></p>';
		}

?>

</body>
</html>