$fn=20;

//hotswap
cyl_h=3.05;
cyl_d=3;

base_x=4.75;
base_x_sum=9.55;
base_y=4.65;
base_y_sum=6.85;
base_z=1.8;

clip_x=1.68;
clip_y=(13.15-9.95)/2;
clip_z=1.85;

// based on https://keycapsss.com/media/image/12/7a/49/kailh-choc-switch-low-profile-dimensions.png
// and on https://www.kailhswitch.com/Content/upload/2019306614/201911041105555019799.jpg
module choc_hs(){
    base_x = 4.75;
    base_y = 4.69;
    base_z=1.86;
    clip_x = 1.6;
    clip_y = 1.73;
    pin_h = 2.65;
    minkowski(){
        cylinder(h=0.8,d=1.5);
    rotate([180,0,0])translate([-9.75+base_x/2,-6.9+base_y/2,0]) // center around corner
    union(){
    translate([-base_x/2,-base_y/2,0]) // center around pin hole
    union(){ // HS
    cube([base_x,base_y,base_z]);
    translate([5,2.2,0])cube([base_x,base_y,base_z]);
    translate([base_x,0,0])rotate([0,0,45])cube([base_x+0.30,base_y,base_z]);

    translate([-clip_x,base_y/2-clip_y/2,0])cube([clip_x,clip_y,base_z]);    //clips
    translate([5+base_x,base_y/2-clip_y/2+2.2,0])cube([clip_x,clip_y,base_z]);
    }
    translate([5,-3.8,0]){ // Pins and LED
        cylinder(h=pin_h-pcb_z,d=3.2);
        translate([5.5,0,0])cylinder(h=pin_h-pcb_z,r=0.4);
        translate([-5.5,0,0])cylinder(h=pin_h-pcb_z,r=0.4);
   //     translate([0,-4.7,0.6])cube([7.5,2.2,1.2],center=true);
    }
    }
}
}

first_x = 145.3;
first_y = -31.65;
first_z = -0.0;


hex_x = 21.5;
hex_y = 18.62;
pcb_z = 1.6;
case_z = 2.8;


difference(){
    color("red")translate([0,-130,-case_z])linear_extrude(case_z+pcb_z)offset(r=3)import("butterfly-Edge_Cuts.svg");

color("blue")translate([0,-130,-0.])linear_extrude(pcb_z)offset(0.5)import("butterfly-Edge_Cuts.svg")
    translate([9.75-base_x/2-5,0,0])translate([3.5*hex_x+first_x-5,-1*hex_y+10+first_y,1.5])minkowski(){cube([10,10,2],center=true);sphere(1);} //mcu


translate([first_x,first_y,first_z]){
for(i=[0:2]){
    translate([+i*hex_x,0,0])choc_hs();
    translate([(i+5)*hex_x,0,0])choc_hs();
    }
for(i = [0:3]){
    translate([(i-0.5)*hex_x,-hex_y,0])choc_hs();
    translate([(i)*hex_x,-2*hex_y,0])choc_hs();
}
for(i = [5:8]){
    translate([+(i-0.5)*hex_x,-hex_y,0])choc_hs();
    translate([+(i-1)*hex_x,-2*hex_y,0])choc_hs();
}
translate([+1.5*hex_x,-3*hex_y,0])choc_hs();
translate([+2.5*hex_x,-3*hex_y,0])choc_hs();
translate([+4.5*hex_x,-3*hex_y,0])choc_hs();
translate([+5.5*hex_x,-3*hex_y,0])choc_hs();
translate([+2*hex_x,-4*hex_y,0])choc_hs();
translate([+5*hex_x,-4*hex_y,0])choc_hs();
translate([+2.5*hex_x,-5*hex_y,0])translate([-(9.75-base_x/2-5),-(-6.9+base_y/2-3.8),0])rotate([0,0,180])translate([9.75-base_x/2-5,-6.9+base_y/2-3.8,0])choc_hs();
translate([+4.5*hex_x,-5*hex_y,0])translate([-(9.75-base_x/2-5),-(-6.9+base_y/2-3.8),0])rotate([0,0,180])translate([9.75-base_x/2-5,-6.9+base_y/2-3.8,0])choc_hs();
}
//drill_z = -2.19;

translate([drill_x,drill_y,drill_z]){
    cylinder(h=drill_h,r=drill_r);
    translate([2.5*hex_x,-1*hex_y,0])cylinder(h=drill_h,r=drill_r);
    translate([+4.5*hex_x,-1*hex_y,0])cylinder(h=drill_h,r=drill_r);
    translate([+2*hex_x,-2.5*hex_y-3,0])cylinder(h=drill_h,r=drill_r);
    translate([+5*hex_x,-2.5*hex_y-3,0])cylinder(h=drill_h,r=drill_r);
    translate([+7*hex_x,0,0])cylinder(h=drill_h,r=drill_r);
}

// bumbers
    bumper_h=0.5;
    bumper_d=8.5;
    marker_h=0;
    translate([-(9.75-base_x/2-5),-(-6.9+base_y/2-3.8),-case_z])translate([first_x,first_y,first_z]){
        top_shift=[0,7,0];
        corner_x=5;
        corner_y=5;
        corner_shift_r=[corner_x,corner_y,0];
        corner_shift_l=[-corner_x,corner_y,0];
        bumper_shift=5.5;
        translate(top_shift)bumper(h=bumper_h,d=bumper_d,num=1,ht=marker_h);
        translate([7*hex_x,0,0]+top_shift)bumper(h=bumper_h,d=bumper_d,num=1,ht=marker_h);
        translate([2.5*hex_x,-5*hex_y,0]-corner_shift_r)bumper(h=bumper_h,d=bumper_d,num=1,ht=marker_h);
        translate([4.5*hex_x,-5*hex_y,0]-corner_shift_l)bumper(h=bumper_h,d=bumper_d,num=1,ht=marker_h);

        translate([-0.5*hex_x,-1*hex_y,0]+corner_shift_l)bumper(h=bumper_h,d=bumper_d,num=2,ht=marker_h);
        translate([7.5*hex_x,-1*hex_y,0]+corner_shift_r)bumper(h=bumper_h,d=bumper_d,num=2,ht=marker_h);

        translate([2*hex_x,0,0]+top_shift)bumper(h=bumper_h,d=bumper_d,num=3,ht=marker_h);
        translate([5*hex_x,0,0]+top_shift)bumper(h=bumper_h,d=bumper_d,num=3,ht=marker_h);

     //   translate([2*hex_x,-2*hex_y,0])bumper(h=bumper_h,d=bumper_d,num=4,ht=marker_h);
      //  translate([5*hex_x,-2*hex_y,0])bumper(h=bumper_h,d=bumper_d,num=4,ht=marker_h);

    }
}
drill_x = 142.9;
drill_y = -35.8;
drill_z = -2.19;
drill_r = 1.4;
drill_h = 2.2;

translate([drill_x,drill_y,drill_z]){


    }


module bumper(h, d, num, ht=0.4){
    sq2 = sqrt(2)*d/2;
    difference(){
    cylinder(h=h,d=d);
    translate([0,0,h])
    color("blue"){
    if(num==1){
        translate([0,0,ht/2])scale([0.8,0.8,1])cube([sq2,sq2,ht],center=true);
        }
     if(num==2){
        translate([-sq2/4,0,ht/2])scale([0.8,0.8,1])cube([sq2/2,sq2,ht],center=true);
        translate([sq2/4,0,ht/2])scale([0.8,0.8,1])cube([sq2/2,sq2,ht],center=true);
         }
     if(num==3){
          for(i=[-1:1])translate([i*sq2/(num),0,ht/2])scale([0.8,0.8,1])cube([sq2/3,sq2,ht],center=true);
         }
     if(num==4){
         for(i=[-1:2:1]) for(j=[-1:2:1])
        translate([i*sq2/4,j*sq2/4,ht/2])scale([0.8,0.8,1])cube([sq2/2,sq2/2,ht],center=true);
         }
     }
 }

}
