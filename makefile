# Makefile: http://www.eng.hawaii.edu/Tutor/Make/

# Compiling flags
CFLAGS = #-O3 -Wno-unused-result

# Linking flags
LFLAGS = -lm -lcpgplot -lpgplot -lX11 -fno-backslash -lpng -L/usr/local/lib -lqfits -lwcs_c -lgsl -lgslcblas -ljpeg -lexif

# Compilers
CC = gcc
F77 = gfortran

all:
	make addwcs angular calibrate dec2sex faketle fitsheader fitskey imgstat jpg2fits jpgstack measure pgm2fits plotfits pstrack rde2iod reduce residuals runsched satfit satid satmap satorbit sex2dec skymap tle2ole tleinfo uk2iod stviewer wcsfit deproject slewto waitfor pass detect launchtle propagate fakeiod csv2tle normal posmatch posvel xyz2tle mvtle confirm allnight

allnight: allnight.o
	$(CC) -o allnight allnight.o -lm

selectiod: selectiod.o
	$(CC) -o selectiod selectiod.o -lm

planscan: planscan.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o planscan planscan.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)	

tle2rv: tle2rv.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o tle2rv tle2rv.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)	

mvtle: mvtle.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o mvtle mvtle.o sgdp4.o satutl.o deep.o ferror.o -lm

rv2tle: rv2tle.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o rv2tle rv2tle.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)

xyz2tle: xyz2tle.o sgdp4.o satutl.o deep.o ferror.o versafit.o dsmin.o simplex.o
	$(CC) -o xyz2tle xyz2tle.o sgdp4.o satutl.o deep.o ferror.o versafit.o dsmin.o simplex.o -lm

csv2tle: csv2tle.o satutl.o ferror.o
	$(CC) -o csv2tle csv2tle.o satutl.o ferror.o -lm

fakeiod: fakeiod.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o fakeiod fakeiod.o sgdp4.o satutl.o deep.o ferror.o -lm

posvel: posvel.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o posvel posvel.o sgdp4.o satutl.o deep.o ferror.o -lm

normal: normal.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o normal normal.o sgdp4.o satutl.o deep.o ferror.o -lm

vadd: vadd.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o vadd vadd.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)

posmatch: posmatch.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o posmatch posmatch.o sgdp4.o satutl.o deep.o ferror.o -lm

propagate: propagate.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o propagate propagate.o sgdp4.o satutl.o deep.o ferror.o -lm

detect: detect.o
	$(F77) -o detect detect.o -lm $(LFLAGS)

confirm: confirm.o
	$(F77) -o confirm confirm.o -lm $(LFLAGS)

autodetect: autodetect.o
	$(F77) -o autodetect autodetect.o -lm $(LFLAGS)

launchtle: launchtle.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o launchtle launchtle.o sgdp4.o satutl.o deep.o ferror.o -lm

slewto: slewto.o
	$(CC) -o slewto slewto.o -lm

waitfor: waitfor.o
	$(CC) -o waitfor waitfor.o -lm

deproject: deproject.o
	$(F77) -o deproject deproject.o $(LFLAGS)

jpgstack: jpgstack.o
	$(CC) -o jpgstack jpgstack.o -ljpeg

angular: angular.o 
	$(CC) -o angular angular.c -lm -lwcs_c

dec2sex: dec2sex.o 
	$(CC) -o dec2sex dec2sex.c -lm

sex2dec: sex2dec.o 
	$(CC) -o sex2dec sex2dec.c -lm

calibrate: calibrate.o sgdp4.o satutl.o deep.o ferror.o
	$(F77) -o calibrate calibrate.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)

measure: measure.o
	$(F77) -o measure measure.o $(LFLAGS)

jpg2fits: jpg2fits.o
	$(CC) -o jpg2fits jpg2fits.o -lm -L/usr/local/lib -lqfits -ljpeg

pstrack: pstrack.o sgdp4.o satutl.o deep.o ferror.o
	$(F77) -o pstrack pstrack.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)

faketle: faketle.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o faketle faketle.o sgdp4.o satutl.o deep.o ferror.o -lm

imgstat: imgstat.o
	$(CC) -o imgstat imgstat.o -lm -L/usr/local/lib -lqfits

satfit: satfit.o sgdp4.o satutl.o deep.o ferror.o versafit.o dsmin.o simplex.o
	$(F77) -o satfit satfit.o sgdp4.o satutl.o deep.o ferror.o versafit.o dsmin.o simplex.o $(LFLAGS)

uk2iod: uk2iod.o
	$(CC) -o uk2iod uk2iod.o -lm

rde2iod: rde2iod.o
	$(CC) -o rde2iod rde2iod.o -lm

stviewer: stviewer.o
	$(CC) -o stviewer stviewer.o -lm -L/usr/local/lib -lqfits

residuals: residuals.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o residuals residuals.o sgdp4.o satutl.o deep.o ferror.o -lm -lwcs_c

tleinfo: tleinfo.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o tleinfo tleinfo.o sgdp4.o satutl.o deep.o ferror.o -lm

satmap: satmap.o sgdp4.o satutl.o deep.o ferror.o
	$(F77) -o satmap satmap.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)

satorbit: satorbit.o sgdp4.o satutl.o deep.o ferror.o
	$(F77) -o satorbit satorbit.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)

runsched: runsched.o
	$(CC) -o runsched runsched.o -lm

fitskey: fitskey.o
	$(CC) -o fitskey fitskey.o -L/usr/local/lib -lqfits

fitsheader: fitsheader.o
	$(CC) -o fitsheader fitsheader.o -L/usr/local/lib -lqfits

satid: satid.o sgdp4.o satutl.o deep.o ferror.o
	$(F77) -o satid satid.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)

skymap: skymap.o sgdp4.o satutl.o deep.o ferror.o
	$(F77) -o skymap skymap.o sgdp4.o satutl.o deep.o ferror.o $(LFLAGS)

pass: pass.o sgdp4.o satutl.o deep.o ferror.o
	$(CC) -o pass pass.o sgdp4.o satutl.o deep.o ferror.o -lm

reduce: reduce.o
	$(F77) -o reduce reduce.o $(LFLAGS)

addwcs: addwcs.o
	$(F77) -o addwcs addwcs.o $(LFLAGS)

wcsfit: wcsfit.o
	$(F77) -o wcsfit wcsfit.o $(LFLAGS)

plotfits: plotfits.o
	$(F77) -o plotfits plotfits.o $(LFLAGS)

pgm2fits: pgm2fits.o
	$(F77) -o pgm2fits pgm2fits.o $(LFLAGS) 

clean:
	rm -f *.o
	rm -f *~
