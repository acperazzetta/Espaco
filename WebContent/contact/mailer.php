<?php

    // Only process POST reqeusts.
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Get the form fields and remove whitespace.
        $name = strip_tags(trim($_POST["name"]));
				$name = str_replace(array("\r","\n"),array(" "," "),$name);
        $email = filter_var(trim($_POST["email"]), FILTER_SANITIZE_EMAIL);
        $phone = trim($_POST["phone"]);
        $message = trim($_POST["message"]);
        // Check that data was sent to the mailer.
        if ( empty($name) OR empty($message) OR empty($phone) OR !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            // Set a 400 (bad request) response code and exit.
            http_response_code(400);
            echo "Oops! Houve um erro com o envio do email. Por favor, tente novamente.";
            exit;
        }

        // Set the recipient email address.
        $recipient = "contacto@espacoarvore.com";

        // Set the email subject.
        $subject = "Novo contacto de $name";

        // Build the email content.
        $email_content = "Nome: $name\n\n";
        $email_content .= "Email: $email\n\n";
        $email_content .= "Telefone: $phone\n\n";
        $email_content .= "Mensagem:\n$message\n";

        // Build the email headers.
        $email_headers = "From: $name <$email>";

        // Send the email.
        if (mail($recipient, $subject, $email_content, $email_headers)) {
            // Set a 200 (okay) response code.
            http_response_code(200);
            echo "Obrigada! Sua mensagem foi enviada com sucesso.";
        } else {
            // Set a 500 (internal server error) response code.
            http_response_code(500);
            echo "Oops! Houve um erro com o envio do email. Por favor, tente novamente.";
            //echo "Oops! Houve um problema e sua mensagem não pode ser enviada. Por favor tente mais tarde. Obrigada.";
        }

    } else {
        // Not a POST request, set a 403 (forbidden) response code.
        http_response_code(403);
        echo "Oops! Houve um erro com o envio do email. Por favor, tente novamente.";
    }

?>