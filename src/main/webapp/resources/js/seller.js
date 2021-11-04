//your javascript goes here
var currentTab = 0;
document.addEventListener("DOMContentLoaded", function (event) {


    showTab(currentTab);

});

function showTab(n) {
    var x = document.getElementsByClassName("tab");
    x[n].style.display = "block";
    if (n == 0) {
        document.getElementById("prevBtn").style.display = "none";
    } else {
        document.getElementById("prevBtn").style.display = "inline";
    }
    if (n == (x.length - 1)) {
        document.getElementById("nextBtn").innerHTML = "Submit";
        document.getElementById("nextBtn").style.display = "none";
    } else {
        document.getElementById("nextBtn").innerHTML = "Next";
    }
    fixStepIndicator(n)
}

function nextPrev(n) {
//function sellerSubmit(){
    var x = document.getElementsByClassName("tab");
    if (!validateForm()) return false;
    x[currentTab].style.display = "none";
    currentTab = currentTab + n;
    if (currentTab >= x.length) {
        document.getElementById("sellerRegForm").submit();
        // return false;
        alert("가입 성공");
        document.getElementById("nextprevious").style.display = "none";
        document.getElementById("all-steps").style.display = "none";
        document.getElementById("register").style.display = "none";
        document.getElementById("text-message").style.display = "block";
    }
    showTab(currentTab);
}

function validateForm() {
    var x, y, z, i, valid = true;
    x = document.getElementsByClassName("tab");
    y = x[currentTab].getElementsByTagName("input");
    z = x[currentTab].getElementsByClassName("chk");
    aa = x[currentTab].getElementsByClassName("deleveryChk");

    for (i = 0; i < y.length; i++) {
         if (y[i].value == "") {
        	 y[i].focus();
        	 y[i].className += " invalid"; valid = false; 
              
        }
    }
    for (i = 0; i < z.length; i++) {
        if (!z[i].checked) {
            alert("모든 약관에 동의해주세요.");
             z[i].className += " invalid"; valid = false; 
       }
   }
    
   for (i = 0; i < aa.length; i++) {
        if (!aa[i].checked) {
            alert("배송 체크 안됨");
            aa[i].className += " invalid"; valid = false; 
        }
    }
    if (valid) {
         document.getElementsByClassName("step")[currentTab].className += " finish";
         }
    return valid;
}

function fixStepIndicator(n) {
     var i, x = document.getElementsByClassName("step");
     for (i = 0; i < x.length; i++) {
          x[i].className = x[i].className.replace(" active2", "");
     }
     x[n].className += " active2";
}

