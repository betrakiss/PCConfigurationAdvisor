; Fri Jan 29 22:28:04 EET 2016
;
;+ (version "3.5")
;+ (build "Build 663")

(definstances hardware_parts
([pc_advisor_Class10] of  UPS

	(battery_time 180)
	(manufacturer "Asus")
	(model "AU12"))

([pc_advisor_Class10000] of  Graphic

	(mem_type GDDR3))

([pc_advisor_Class10001] of  Graphic

	(mem_type GDDR5))

([pc_advisor_Class10002] of  Graphic

	(mem_type Shared))

([pc_advisor_Class10003] of  Onboard

	(mem_type DDR))

([pc_advisor_Class10004] of  Onboard

	(mem_type DDR2))

([pc_advisor_Class10005] of  Onboard

	(mem_type DDR3))

([pc_advisor_Class10006] of  Onboard

	(mem_type DDR4))

([pc_advisor_Class10008] of  Graphics

	(manufacturer "Intel")
	(memory_size 1024)
	(memory_type [pc_advisor_Class10002])
	(model "HD Graphics 3600"))

([pc_advisor_Class10009] of  Graphics

	(manufacturer "AMD")
	(memory_size 4096)
	(memory_type [pc_advisor_Class10000])
	(model "Radeon R7 265"))

([pc_advisor_Class10010] of  Graphics

	(manufacturer "Geforce")
	(memory_size 4096)
	(memory_type [pc_advisor_Class10001])
	(model "GTX 980 TI"))

([pc_advisor_Class10011] of  Motherboard

	(manufacturer "ASRock")
	(model "G520S")
	(ram_slots
		[pc_advisor_Class10006]
		[pc_advisor_Class10006]
		[pc_advisor_Class10006]
		[pc_advisor_Class10006])
	(size M-ATX)
	(socket "i5110"))

([pc_advisor_Class10012] of  SSD

	(amount "128GB")
	(manufacturer "Kingston")
	(model "KS2")
	(working_core Flash))

([pc_advisor_Class10013] of  HDD

	(amount "500GB")
	(manufacturer "WD")
	(model "Black")
	(working_core Optical))

([pc_advisor_Class10018] of  Graphics

	(manufacturer "AMD")
	(memory_size 512)
	(memory_type [pc_advisor_Class10000])
	(model "Radeon HD 4550"))

([pc_advisor_Class10019] of  Graphics

	(manufacturer "Geforce")
	(memory_size 1024)
	(memory_type [pc_advisor_Class10000])
	(model "GT 840"))

([pc_advisor_Class11] of  UPS

	(battery_time 120)
	(manufacturer "Logitech")
	(model "LU30S"))

([pc_advisor_Class12] of  Cooling

	(has_water FALSE)
	(manufacturer "Cooler Master")
	(model "CM2003C"))

([pc_advisor_Class14] of  Motherboard

	(manufacturer "Foxconn")
	(model "MX761")
	(ram_slots
		[pc_advisor_Class10005]
		[pc_advisor_Class10005])
	(size M-ATX)
	(socket "AM2+"))

([pc_advisor_Class16] of  Processor

	(clock_speed 2100)
	(cores 2)
	(cpu_socket "AM2+")
	(has_hyperthreading FALSE)
	(has_turbo FALSE)
	(manufacturer "AMD")
	(model "Athlon X2"))

([pc_advisor_Class20000] of  Processor

	(clock_speed 1900)
	(cores 2)
	(cpu_socket "i5110")
	(has_hyperthreading TRUE)
	(has_integrated_video [pc_advisor_Class10008])
	(has_turbo FALSE)
	(manufacturer "Intel")
	(model "i3 3500m"))

([pc_advisor_Class20001] of  Processor

	(clock_speed 1800)
	(cores 1)
	(cpu_socket "AM2+")
	(manufacturer "AMD")
	(model "FX 3550"))

([pc_advisor_Class20002] of  Processor

	(clock_speed 3100)
	(cores 4)
	(cpu_socket "i5110")
	(has_hyperthreading TRUE)
	(has_integrated_video [pc_advisor_Class63])
	(has_turbo TRUE)
	(manufacturer "Intel")
	(model "i7 5500m"))

([pc_advisor_Class6] of  Router

	(antennas 1)
	(manufacturer "D-Link")
	(model "524")
	(speed_class g))

([pc_advisor_Class62] of  Processor

	(clock_speed 2800)
	(cores 2)
	(cpu_socket "i5110")
	(has_hyperthreading TRUE)
	(has_integrated_video [pc_advisor_Class63])
	(has_turbo TRUE)
	(manufacturer "Intel")
	(model "i5 4200H"))

([pc_advisor_Class63] of  Graphics

	(manufacturer "Intel")
	(memory_size 2048)
	(memory_type [pc_advisor_Class10002])
	(model "HD Graphics 4600"))

([pc_advisor_Class64] of  HDD

	(amount "1TB")
	(manufacturer "Seagate")
	(model "Momentus")
	(working_core Optical))

([pc_advisor_Class65] of  SSD

	(amount "256GB")
	(manufacturer "Samsung")
	(model "SSD")
	(working_core Flash))

([pc_advisor_Class67] of  Cooling

	(has_water TRUE)
	(manufacturer "CoolerMaster")
	(model "WCM201A"))

([pc_advisor_Class7] of  Router

	(antennas 2)
	(manufacturer "TP Link")
	(model "TLW32N")
	(speed_class n))
)
