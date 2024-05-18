<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Photo</title>
<style>
  dialog[open] {
  animation: appear .15s cubic-bezier(0, 1.8, 1, 1.8);
}

  dialog::backdrop {
    background: linear-gradient(45deg, rgba(0, 0, 0, 0.5), rgba(54, 54, 54, 0.5));
    backdrop-filter: blur(3px);
  }
  
 
@keyframes appear {
  from {
    opacity: 0;
    transform: translateX(-3rem);
  }

  to {
    opacity: 1;
    transform: translateX(0);
  }
} 
</style>
</head>
<body>

<dialog id="myModal" class="h-auto w-11/12 md:w-1/2 p-5  bg-white rounded-md ">
        
   <div class="flex flex-col w-full h-auto ">
        <!-- Header -->
        <div class="flex w-full h-auto justify-center items-center">
          <div class="flex w-10/12 h-auto py-3 justify-center items-center text-2xl font-bold">
                Add Your Sketch
          </div>
          <div onclick="document.getElementById('myModal').close();" class="flex w-1/12 h-auto justify-center cursor-pointer">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
          </div>
          <!--Header End-->
        </div>

          <!-- Modal Content-->
           <form action="addimage" method="post" enctype='multipart/form-data'>
           <div class="flex flex-col w-full h-auto py-6 px-2 items-center bg-gray-200 rounded text-center text-gray-500">
           <div class="relative h-10 w-full min-w-[200px]">
    			<input
      				class="peer h-full w-full rounded-[7px] border border-blue-gray-200 bg-transparent px-3 py-2.5 font-sans text-sm font-normal text-blue-gray-700 outline outline-0 transition-all placeholder-shown:border placeholder-shown:border-blue-gray-200 placeholder-shown:border-t-blue-gray-200 focus:border-2 focus:border-blue-500 focus:border-t-transparent focus:outline-0 disabled:border-0 disabled:bg-blue-gray-50"
      				placeholder=" "
      				name="title" required="required"/>
    			<label class="before:content[' '] after:content[' '] pointer-events-none absolute left-0 -top-1.5 flex h-full w-full select-none text-[11px] font-normal leading-tight text-blue-gray-400 transition-all before:pointer-events-none before:mt-[6.5px] before:mr-1 before:box-border before:block before:h-1.5 before:w-2.5 before:rounded-tl-md before:border-t before:border-l before:border-blue-gray-200 before:transition-all after:pointer-events-none after:mt-[6.5px] after:ml-1 after:box-border after:block after:h-1.5 after:w-2.5 after:flex-grow after:rounded-tr-md after:border-t after:border-r after:border-blue-gray-200 after:transition-all peer-placeholder-shown:text-sm peer-placeholder-shown:leading-[3.75] peer-placeholder-shown:text-blue-gray-500 peer-placeholder-shown:before:border-transparent peer-placeholder-shown:after:border-transparent peer-focus:text-[11px] peer-focus:leading-tight peer-focus:text-blue-500 peer-focus:before:border-t-2 peer-focus:before:border-l-2 peer-focus:before:border-blue-500 peer-focus:after:border-t-2 peer-focus:after:border-r-2 peer-focus:after:border-blue-500 peer-disabled:text-transparent peer-disabled:before:border-transparent peer-disabled:after:border-transparent peer-disabled:peer-placeholder-shown:text-blue-gray-500">
     			Enter Skecth Title
    			</label>
          </div>

    	<fieldset class="flex mt-5 gap-5">
        <legend class="sr-only text-black">
            Type
        </legend>
        <div class="flex items-center mb-4">
            <input id="option-1" type="radio" name="type" value="Pencil Sketch" class="h-4 w-4 border-gray-300 focus:ring-2 focus:ring-blue-300" aria-labelledby="country-option-1" aria-describedby="country-option-1" checked="">
            <label for="option-1" class="text-sm font-medium text-gray-900 ml-2 block">
            Pencil Sketch
            </label>
        </div>

        <div class="flex items-center mb-4">
            <input id="option-2" type="radio" name="type" value="Colour Pencil Sketch" class="h-4 w-4 border-gray-300 focus:ring-2 focus:ring-blue-300" aria-labelledby="country-option-2" aria-describedby="country-option-2">
            <label for="option-2" class="text-sm font-medium text-gray-900 ml-2 block">
            Colour Pencil Sketch
            </label>
        </div>
        
        <div class="flex items-center mb-4">
            <input id="option-2" type="radio" name="type" value="Water Colour" class="h-4 w-4 border-gray-300 focus:ring-2 focus:ring-blue-300" aria-labelledby="country-option-2" aria-describedby="country-option-2">
            <label for="option-2" class="text-sm font-medium text-gray-900 ml-2 block">
            Water Colour
            </label>
        </div>
    	</fieldset>
        </div>
        
        
          
        <!-- image File -->  
     <div class="flex items-center justify-center space-x-6 bg-gray-200 py-5 mt-2">
    <div class="shrink-0">
      <img id='preview_img' class="h-16 w-16 object-cover rounded-full" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQjHIzfpj-4TrldpfhJ7-R3WAu6CuvaSZGcb21PmEgOA&s" alt="Current profile photo" />
    </div>
    <label class="block">
      <span class="sr-only">Choose profile photo</span>
      <input type="file" onchange="loadFile(event)" name="file" required="required" class="block w-full text-sm text-slate-500
        file:mr-4 file:py-2 file:px-4
        file:rounded-full file:border-0
        file:text-sm file:font-semibold
        file:bg-violet-50 file:text-violet-700
        hover:file:bg-violet-100
      "/>
    </label>
  </div>

<!-- Date -->
 	<div class="flex flex-col w-full py-4 mt-2 items-center justify-center bg-gray-200 rounded text-center text-gray-500">
        <p>Upload Date</p>
        <input type='date' name="date" class=" rounded px-2" required="required" />
	</div>
	<div class="flex justify-end gap-5 text-white">
 		<button id="button" type="submit" class="mt-4 rounded-sm px-3 py-1 bg-blue-500 hover:bg-blue-300 focus:shadow-outline focus:outline-none">
                Upload a file
 		</button>
 		<button id="button" type="reset" class="mt-4 rounded-sm px-3 py-1 bg-red-500 hover:bg-red-300 focus:shadow-outline focus:outline-none">
               Reset
 		</button>
	</div>
 </form>
 </div>
</dialog>
</body>
<script>
        var loadFile = function(event) {
            
            var input = event.target;
            var file = input.files[0];
            var type = file.type;

           var output = document.getElementById('preview_img');


            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                URL.revokeObjectURL(output.src) // free memory
            }
        };
</script>

</html>