#!/bin/sh

SERVICE=$( cat /tor/hs/hostname )

echo '
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>HTML5</title>
</head>
<body>
    Server '$SERVICE' is online
</body>
</html>' > index.html
