const validacionRegistro = ()=>{
    document.getElementById("formularioRegistro").addEventListener("submit", function(event){
        event.preventDefault();
        var inputNombre = document.querySelector("#formInputNombre").value;
        var inputApellido = document.querySelector('#formInputApellido').value;
        var inputMail = document.querySelector('#formInputMail').value;
        var inputPass = document.querySelector('#formInputPass').value;
        var errores = document.querySelector('.errores');
        var regexMail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        var regexPass = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        console.log(inputNombre);
   
    errores.textContent = "";
    if (inputNombre.trim() === ""){
         errores.textContent =`Debe completar el nombre`;
         return;
     }
    
     if (inputApellido.trim() === ""){
        errores.textContent =`Debe completar el apellido`;
        return;
    }
    if (!regexMail.test(inputMail)){
        errores.textContent =`El mail no cumple con los requisitos`;
        return;
    }
    if (!regexPass.test(inputPass)){
        errores.textContent =`La contraseña debe contener numero y letras`;
        return;
    }
    alert("EL formulario se envio con exito");
    });
}

const validacionLogin = ()=>{

        var inputMail = document.getElementById("floatingInput").value;
        var inputPass = document.getElementById("floatingPassword").value;
        var errores = document.getElementById('errores');
        var success = document.getElementById('success');
        var modal = document.getElementById("modalLogin");
        var login = false;
        //traigo el elemento donde crear el bottom
        const successButton = document.getElementById("successBtn");
        var regexMail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        errores.textContent = "";

        if (inputMail.trim() === ""){
            errores.textContent =`Debe completar el E-mail`;
            return;
        }else if (!regexMail.test(inputMail)){
            errores.textContent =`El formato del e-mail es incorrecto`;
            return;
        }
       
        if (inputPass.trim() === ""){
           errores.textContent =`Debe completar la contraseña`;
           return;
       }
       errores.textContent = "";
       success.textContent = "Ingresado con exito, bienvenido";
       login = true;
       successButton.innerText = "Siguiente";
       //intento de cerrar el modal convirtiendo el boton
       if (login == true){
            //const dataDismiss = document.createAttribute('data-dismiss');
            //dataDismiss.nodeValue = 'modal';
            //successButton.setAttributeNode(dataDismiss);
            successButton.addEventListener("click", function(){modal.hide()});
       }
       

}