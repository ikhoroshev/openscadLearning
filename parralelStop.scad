//Параллельный упор для стола
tableWidth = 600;
tableHeight = 700;
tableDepth = 500;
ft = 12; //фанеры thickness

module table () {
    color ("pink", 0.3){
        cube(size = [tableWidth, tableDepth, tableHeight], center=true);
    }
}

module parralelStop() { 
    leftPart = 50;
    stopWidth = 100;
    //горизонтальная базовая палка
    translate([-leftPart-tableWidth/2,-stopWidth/2 + ft, tableHeight/2]) {
        cube(size = [leftPart + tableWidth, stopWidth - 2*ft ,ft]);
    }
    //левая направляющая
    leftPartSize = 300;
    translate([-leftPart-tableWidth/2,-leftPartSize/2, tableHeight/2-ft]) {
        cube(size = [leftPart,leftPartSize,ft]);
    }
    //площадки упора
    standHeight = 120;
    translate([-tableWidth/2,-stopWidth/2, tableHeight/2]) {
        cube(size = [tableWidth,ft,standHeight]);
    }
    translate([-tableWidth/2, stopWidth/2-ft, tableHeight/2]) {
        cube(size = [tableWidth,ft,standHeight]);
    }
    //правая часть
    //направляющая
    translate([tableWidth/2,-leftPartSize/2, tableHeight/2-ft]) {
        cube(size = [leftPart,leftPartSize,ft]);
    }
    //ширина
    rightWidth = 200;
    //глубина пазов
    groveDepth = 5;
    //Деталь1
    d1x = rightWidth;
    d1y = stopWidth - 2*ft + 2*groveDepth;
    translate([tableWidth/2-d1x + leftPart, -d1y/2, tableHeight/2+ft]) {
        cube(size = [d1x,d1y,ft]);
    }
    //Деталь2
    d2x = leftPart-10;
    d2y = stopWidth - 2*ft + 2*groveDepth;
    #translate([tableWidth/2-d2x + leftPart, -d2y/2, tableHeight/2]) {
        cube(size = [d2x,d2y,ft]);
    }
}

//
//table(); 
parralelStop();