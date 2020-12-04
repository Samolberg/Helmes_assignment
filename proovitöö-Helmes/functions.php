<?php
include('config.php');
function getSectors()
{
    global $conn;
    $sql = "select id,type,value_id from sectors";
    $sectors = $conn->query($sql);
    return $sectors;
}

function saveUser($name, $terms, $sessionID)
{
    global $conn;
    $user = getUserData($sessionID);
    if ($user == null) {
        $sqlUser = "INSERT INTO user (name, terms, session_id) VALUES ('$name', '$terms', '$sessionID')";
        $conn->query($sqlUser);
        return $conn->insert_id;

    }else {
        $sqlUser = "UPDATE user SET name = '$name' WHERE session_id = '$sessionID'";
        $conn->query($sqlUser);
        return $user['id'];


    }
}


function saveSectors($userID, $sectors)
{
    global $conn;
    deleteSectors($userID);
    $sqlUserSector = "INSERT INTO user_sectors (user_id, sector_id) VALUES ";
    for ($i = 0; $i < sizeof($sectors); $i++) {
        if ($i != 0) {
            $sqlUserSector .= ",";
        }
        $sqlUserSector .= "('$userID', '$sectors[$i]')";
    }
    echo $sqlUserSector;
    $conn->query($sqlUserSector);
}

function getUserData($sessionID)
{
    global $conn;
    $sqlGetUserData = "SELECT * FROM user WHERE session_id ='$sessionID'";
    $userData = $conn->query($sqlGetUserData);
    $getFirstUser = $userData->fetch_assoc();
    return $getFirstUser;

}

function getUserSectors($rowID)
{
    global $conn;
    $id = $rowID;
    $sqlGetUserSession = "SELECT sectors.id, sectors.type, sectors.value_id 
                        FROM user_sectors 
                        INNER JOIN sectors ON user_sectors.sector_id = sectors.id 
                        WHERE user_id = '$id'";
    $getUserSectors = $conn->query($sqlGetUserSession);
    return $getUserSectors;

}

function isSelectedSector($sectorId)
{
    global $selectedSectors;

    foreach ($selectedSectors as $userSector) {
        if ($sectorId == $userSector['id']) {
            return true;
        }
    }
}

function deleteSectors($userID)
{
    global $conn;
    $sql = "DELETE FROM user_sectors WHERE user_id = '$userID'";
    return $conn->query($sql);
}

function updateUser($name, $terms, $sessionID)
{
    global $conn;
    $sqlUpdateUser = "UPDATE user SET name = '$name', terms = '$terms' WHERE session_id = '$sessionID'";
    return $conn->query($sqlUpdateUser);
}

function saveSessionID($sessionID)
{
    $_SESSION["name"] = $sessionID;

}

function getSessionID()
{
    if (!isset ($_SESSION["name"])) {
        $sessionID = generateSessionID();
        saveSessionID($sessionID);

    }
    return $_SESSION["name"];

}

function generateSessionID()
{
    return $generateSessionID = bin2hex(random_bytes(22));
}









