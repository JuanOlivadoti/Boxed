<h1>BOXED</h1>

<h2>MODELS</h2>

<ul>
	<li>Users</li>
	<li>Clases</li>
</ul>

<h3>Users</h3>

<h4>ATTRIBUTES</h4>
<ul>
	<li>id : integer</li> *
	<li>name : string</li> *
	<li>email : DEVISE</li> *
	<li>password : DEVISE</li> *
	<li>dni : string</li> *
	<li>bday : date</li> *
	<li>medcert : date</li> *
	<li>user_type: ENUM</li>
</ul>

<h4>USER TYPE ACCESESS</h4>
<p>user_types</p>
<ul>
	<li>admin => full access : 0</li>
	<li>coach => class CRUD : 1</li>
	<li>final => class selection & booking : 2</li>
</ul>


<h3>Clasess</h3>

<h4>ATTRIBUTES</h4>
<ul>
	<li>id : integer</li>
	<li>date : date</li>
	<li>time : time</li>
	<li>max_quota : integer</li>
	<li>quota : integer</li>
	<li>class_type: ENUM</li>
	<li>coach_id: ENUM</li>
</ul>

<h4>CLASS TYPE</h4>
<p>class_types</p>
<ul>
	<li>Functional Trainig : 0 (default quota: 15)</li>
	<li>Cross intermediate : 1 (default quota: 10)</li>
	<li>Cross advanced : 2 (default quota: 5)</li>
</ul>

<h3>DB</h3>
<p><b>Users conect with clases through bookings</b></p>

<p>User has_many :bookings</p>
<p>Clases has_many :bookings</p>
<p>Bookings belongs_to :user, class</p>

<h2>User Authentication</h2>

<p>Devise Gem</p>