<?php
session_start();
include("functions.php");
if(isset($_POST['submit'])){


    $sessionID = getSessionID();
    $sectors = $_POST['sectors'];
    $name = $_POST['name'];
    $terms = $_POST['terms'];

    $userID = saveUser($name,$terms, $sessionID);
    deleteSectors($userID);
    saveSectors($userID, $sectors);
    header('Location: http://localhost/proovit%c3%b6%c3%b6-Helmes/');

}
if(isset($_POST['endSession'])){
    session_destroy();
    header('Location: http://localhost/proovit%c3%b6%c3%b6-Helmes/');
}
