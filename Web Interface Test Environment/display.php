<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CSE-3330-001-Team 3 |Display</title>
    <link rel="stylesheet" href="./css/style.css" />
    <link rel="stylesheet" href="./css/Query.css" />
</head>

<body>
	<header>
      <div class="container">
        <div id="nav_title">
          <h1>
            <img class="logo" src="./Pictures/logo.jpg" />
            CSE 3330 <span class="highlight"> Team 3</span>
          </h1>
        </div>
        <nav>
          <!-- <img class="logo" src="./Pictures/logo.jpg" />-->
          <ul>
            <li class="current"><a href="Index.php">Home</a></li>
            <li><a href="Insert.php">Insert</a></li>
            <li><a href="Update.php">Update</a></li>
            <li><a href="Display.php">Display</a></li>
            <li><a href="Delete.php">Delete</a></li>
            <li><a href="view1.php">View1</a></li>
			<li><a href="view2.php">View2</a></li>
          </ul>
        </nav>
      </div>
    </header>
	<div style="background-image: url('./Pictures/unsplash.jpg');">
	<h3> Query Customer Information</h3>
	<div class="form">
	<form method = "post" action="display_controller.php">
	
	<div>
	  <input
		type="text"
		name="cid"
		class="form-control"
		placeholder="Please Enter CustomerID..."
	  />
	</div>
	<div style="background-image: url('./Pictures/unsplash.jpg');">
	<button class="submit" name="submit" type="submit" name="submit Query">
          Submit Query
        </button>
	<section id="name">
      <div class="container">
        <h1>
          Created by: Hamilton Nguyen, Kyra Belgica,Utibeabasi Obot, Jaehee Seh,Yuan-Kai Lee
        </h1>
      </div>
    </section>
	<footer>
      <p>CSE-3330-001_TEAM 3, Copyright &copy;2020</p>
    </footer>
	</fieldset>
	</form>
	</div>
	</body>
	</html>