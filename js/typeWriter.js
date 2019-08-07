// type writer function 
			var n = 0;
			var txt = '/* Dane Brynelson */';
			var speed = 50;
			
			function typeWriter() {
				if (n < txt.length) {
				
				document.getElementById("demo").innerHTML
				+= txt.charAt(n);
					n++;
					setTimeout(typeWriter, speed);
					}
				}