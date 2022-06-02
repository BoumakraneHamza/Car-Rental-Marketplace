
function hideNotification(){
	const notification = document.querySelector(".notification");
	notification.style.display="none";	
}
function handleCredentialResponse(response) {
     // decodeJwtResponse() is a custom function defined by you
     // to decode the credential response.
     const responsePayload = jwt_decode(response.credential);
	let form = document.createElement("form");
	form.setAttribute("action","LoginWithGoogle");
	form.setAttribute("method","POST");
	form.style.display="none";
	let email = document.createElement("input");
	email.setAttribute("name","email");
	email.value = responsePayload.email;
	let nom = document.createElement("input");
	nom.setAttribute("name","nom");
	nom.value = responsePayload.given_name;
	let prenom = document.createElement("input");
	prenom.setAttribute("name","prenom");
	prenom.value = responsePayload.family_name;
	let Image = document.createElement("input");
	Image.setAttribute("name","Image");
	Image.value = responsePayload.picture;
	form.append(email);
	form.append(nom);
	form.append(prenom);
	form.append(Image);
	document.body.appendChild(form);
	form.submit();
     console.log("ID: " + responsePayload.sub);
     console.log('Full Name: ' + responsePayload.name);
     console.log('Given Name: ' + responsePayload.given_name);
     console.log('Family Name: ' + responsePayload.family_name);
     console.log("Image URL: " + responsePayload.picture);
     console.log("Email: " + responsePayload.email);
  }