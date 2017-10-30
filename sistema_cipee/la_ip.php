<?

       if ($_SERVER) {
        if ( $_SERVER[HTTP_X_FORWARDED_FOR] ) {
            $ip_real = $_SERVER['HTTP_X_FORWARDED_FOR'];
} 
    elseif ( $_SERVER['HTTP_CLIENT_IP'] ) {
            $ip_real = $_SERVER['HTTP_CLIENT_IP'];
} 
else {
            $ip_real = $_SERVER['REMOTE_ADDR'];
}
}
 else {
        if ( getenv( 'HTTP_X_FORWARDED_FOR' ) ) {
            $ip_real = getenv( 'HTTP_X_FORWARDED_FOR' );
} 
elseif ( getenv( 'HTTP_CLIENT_IP' ) ) {
            $ip_real = getenv( 'HTTP_CLIENT_IP' );
}             
else {
            $ip_real = getenv( 'REMOTE_ADDR' );
}
}
//echo 'Su ip es  '.$ip_real;  
?>
