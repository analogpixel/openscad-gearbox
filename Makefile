bin=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

gears.stl: gears.scad
	$(bin) -o gears.stl gears.scad 

base:
	$(bin) -o $(@).stl -D "$(@)=true" gears.scad

gears:
	$(bin) -o $(@).stl -D "$(@)=true" gears.scad

clean:
	rm *.stl
