let btn = document.getElementById("btn1");
let inp= document.getElementById("2");
let ul = document.getElementById("todoList");


btn.addEventListener("click",function(){
    let item=document.createElement("li")
    item.className = "list-group-item d-flex justify-content-between align-items-center";
    item.innerText=inp.value;


    let delbtn=document.createElement("button");
    delbtn.innerText="Delete";
    delbtn.classList.add("btn", "btn-outline-danger");
     
    item.appendChild(delbtn)
    ul.appendChild(item);


    delbtn.addEventListener("click", function () {
        item.remove();
        });
    console.log(inp.value)
     inp.value="";


});