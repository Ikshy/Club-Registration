<?php
$server = "localhost";
$username = "root";
$password = "";
$dbname = "clubreg";

// Create connection
$conn = mysqli_connect($server, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM members WHERE name='$username' AND password='$password'";
    $result = mysqli_query($conn, $query);
    $user = mysqli_fetch_assoc($result);
    if (mysqli_num_rows($result) == 1) {
        // Login success
        session_start();
        $_SESSION['loggedin'] = true;
        header('location:user/profile.php?user_id=' . $user['id']);
        exit();
    } else {
        // Login failed
        $error = "Invalid username or password";
    }
}

if (isset($_POST['createacc'])) {
    session_start();
    header('location:create_account/create_account.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" href="../images/sitelogo.png" />
</head>
<body class="bg-cover bg-center min-h-screen flex items-center justify-center" style="background-image: url('images/college.jpg');">

    <form method="post" class="w-full max-w-md p-8 bg-gray-50 rounded-2xl shadow-2xl animate__animated animate__fadeIn">
        <div class="flex flex-col items-center mb-6">
            <img src="images/aiet-logo.png" alt="AIET Logo" class="w-20 h-20 mb-4">
            <h2 class="text-2xl font-bold text-gray-700">Welcome</h2>
        </div>

        <div class="mb-4">
            <label for="username" class="block text-gray-600 mb-1">Username</label>
            <input type="text" id="username" name="username" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-cyan-400" required autofocus>
        </div>

        <div class="mb-6">
            <label for="password" class="block text-gray-600 mb-1">Password</label>
            <input type="password" id="password" name="password" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-cyan-400" required>
        </div>

        <?php if (isset($error)) : ?>
            <div class="mb-4 text-red-500 text-center">
                <?php echo $error; ?>
            </div>
        <?php endif; ?>

        <div class="flex flex-col gap-4">
            <input type="submit" name="login" value="Login" class="bg-gradient-to-r from-fuchsia-600 to-cyan-400 text-white font-semibold py-2 rounded-full hover:opacity-90 cursor-pointer">
            <input type="submit" name="createacc" value="Create New Account" class="text-transparent bg-clip-text bg-gradient-to-r from-fuchsia-600 to-cyan-400 border-2 border-cyan-400 font-semibold py-2 rounded-full hover:bg-cyan-50 cursor-pointer">
        </div>
    </form>

</body>
</html>
