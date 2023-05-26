import { calculator_backend } from "../../declarations/calculator_backend";

window.addEventListener("load", async function () {
  //   console.log("Finished loading..");
});

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault();

  const addButton = document.getElementById("addButton");
  const subButton = document.getElementById("subButton");
  const mulButton = document.getElementById("mulButton");
  const divButton = document.getElementById("divButton");
  const powButton = document.getElementById("powButton");
  const sqrtButton = document.getElementById("sqrtButton");
  const floorButton = document.getElementById("floorButton");
  const resetButton = document.getElementById("resetButton");

  const sinButton = document.getElementById("sinButton");
  const cosButton = document.getElementById("cosButton");
  const tanButton = document.getElementById("tanButton");
  const factButton = document.getElementById("factButton");
  const logButton = document.getElementById("logButton");
  const expButton = document.getElementById("expButton");
  const remainderButton = document.getElementById("remainderButton");

  addButton.addEventListener("click", function () {
    performOperation("add");
  });
  subButton.addEventListener("click", function () {
    performOperation("subtract");
  });
  mulButton.addEventListener("click", function () {
    performOperation("multiply");
  });
  divButton.addEventListener("click", function () {
    performOperation("divide");
  });
  powButton.addEventListener("click", function () {
    performOperation("power");
  });
  sqrtButton.addEventListener("click", function () {
    performOperation("sqrt");
  });
  floorButton.addEventListener("click", function () {
    performOperation("floor");
  });
  resetButton.addEventListener("click", function () {
    reset();
  });
  sinButton.addEventListener("click", function () {
    performOperation("sin");
  });
  cosButton.addEventListener("click", function () {
    performOperation("cos");
  });
  tanButton.addEventListener("click", function () {
    performOperation("tan");
  });
  factButton.addEventListener("click", function () {
    performOperation("fact");
  });
  logButton.addEventListener("click", function () {
    performOperation("log");
  });
  expButton.addEventListener("click", function () {
    performOperation("exp");
  });
  remainderButton.addEventListener("click", function () {
    performOperation("remainder");
  });

  async function performOperation(operation) {
    const num1 = parseFloat(document.getElementById("num1").value);
    const num2 = parseFloat(document.getElementById("num2").value);
    let result;

    switch (operation) {
      case "add":
        result = await calculator_backend.add(num1, num2);
        break;
      case "subtract":
        result = await calculator_backend.sub(num1, num2);
        break;
      case "multiply":
        result = await calculator_backend.mul(num1, num2);
        break;
      case "divide":
        result = await calculator_backend.div(num1, num2);
        break;
      case "power":
        result = await calculator_backend.power(num1, num2);
        break;
      case "sqrt":
        if (num1) {
          result = await calculator_backend.sqrt(num1);
        } else {
          result = await calculator_backend.sqrt(num2);
        }
        break;
      case "floor":
        if (num1) {
          result = await calculator_backend.floor(num1);
        } else {
          result = await calculator_backend.floor(num2);
        }
        break;
      case "sin":
        if (num1) {
          result = await calculator_backend.sin(num1);
        } else {
          result = await calculator_backend.sin(num2);
        }
        break;
      case "cos":
        if (num1) {
          result = await calculator_backend.cos(num1);
        } else {
          result = await calculator_backend.cos(num2);
        }
        break;
      case "tan":
        if (num1) {
          result = await calculator_backend.tan(num1);
        } else {
          result = await calculator_backend.tan(num2);
        }
        break;
      case "fact":
        if (num1) {
          result = await calculator_backend.factorial(num1);
        } else {
          result = await calculator_backend.factorial(num2);
        }
        break;
      case "log":
        if (num1) {
          result = await calculator_backend.log(num1);
        } else {
          result = await calculator_backend.log(num2);
        }
        break;
      case "exp":
        if (num1) {
          result = await calculator_backend.exp(num1);
        } else {
          result = await calculator_backend.exp(num2);
        }
        break;
      case "remainder":
        result = await calculator_backend.remainder(num1, num2);
        break;
      default:
        result = "Invalid operation";
    }

    if (isNaN(result)) {
      document.getElementById("output").textContent = "Not a number";
    } else {
      document.getElementById("output").textContent = result;
    }
  }

  function reset() {
    document.getElementById("num1").value = "";
    document.getElementById("num2").value = "";
    document.getElementById("output").textContent = "";
  }
});
