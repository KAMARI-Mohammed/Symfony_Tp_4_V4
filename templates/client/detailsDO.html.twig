<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Clients</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>Liste des Clients</h1>

<div id="clients-container">
    <?php
    require_once 'services/ClientService.php';

    
    $clientService = new ClientService();

   
    $clients = $clientService->getListeClients();

    
    foreach ($clients as $client) {
        echo "<div class='client-item' data-id='{$client->ID_Client}'>";
        echo "<p><strong>ID_Client:</strong> {$client->ID_Client}</p>";
        echo "<p><strong>Nom:</strong> {$client->Nom}</p>";
        echo "<p><strong>Prénom:</strong> {$client->Prenom}</p>";
        echo "</div>";
    }
    ?>
</div>

<div id="details-container"></div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
 
    $('.client-item').click(function() {
   
        var clientID = $(this).data('id');

       
        $.ajax({
            type: 'POST',
            url: 'get_client_details.php',
            data: { clientID: clientID },
            success: function(response) {
             
                $('#details-container').html(response);
            }
        });
    });
});
</script>

</body>
</html>
