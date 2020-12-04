<?php
include('functions.php');
session_start();

$sectors = getSectors();
$sessionID = getSessionID();
$user = getUserData($sessionID);
if($user != null){
    $userID = $user['id'];
    $userName = $user['name'];
    $userTerms = $user['terms'];
    $selectedSectors = getUserSectors($userID);
}else {
    $userName = '';
    $userTerms = 0;
    $selectedSectors = [];
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Assignment</title>
        <meta http-equiv="content-type">
        <meta content="text/html">
        <meta charset="utf-8">

    </head>
    <body>
        <p>Please enter your name and pick the Sectors you are currently involved in.</p>
        <form action="post.php" method="post">
            <label for="name">Name:</label>
            <input name="name" id="name" type="text" required value="<?php echo $userName ?>">
            <br>
            <br>
            <label for="sectors">Sectors:</label>
            <select name="sectors[]" id="sectors" multiple size="5" required>
                    <?php foreach ($sectors as $sectorSlot): ?>
                        <option <?php if( isSelectedSector($sectorSlot['id'])){echo 'selected';} ?> value="<?= $sectorSlot['id'] ?>"><?= $sectorSlot['type'] ?></option>

                    <?php endforeach ?>
            </select>
            <br>
            <br>
            <input name="terms" value="1" <?php if($userTerms == 1){echo 'checked';} ?> id="checkbox" type="checkbox" required>
            <label for="checkbox">Agree to terms</label>
            <br>
            <br>
            <input type="submit" name="submit" value="Save">
        </form>
    <form action="post.php" method="post">
        <input type="submit" name="endSession" value="New Session">
    </form>
    </body>
</html>



