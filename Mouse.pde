void mousePressed(){
  if (Screen == "MainMenu"){
    for (int i = 0; i < Quiz.length; i++){
      if (mouseX >= QuizClasses[i].RectX && mouseY >= QuizClasses[i].RectYUse && mouseX <= QuizClasses[i].RectX + QuizClasses[i].RectXSize && mouseY <= QuizClasses[i].RectYUse + QuizClasses[i].RectYSize){
        println(FileName[i]);
        QuizXML = loadXML(sketchPath("Data/Tests/") + FileName[i]);
        LoadQuestionData();
      }
    }
    //Exit Button
    if (mouseX >= ExitX && mouseY >= ExitY && mouseX <= ExitX + ExitXSize && mouseY <= ExitY + ExitYSize){
      exit();
    }
    //New Button
    if (mouseX >= NewX && mouseY >= NewY && mouseX <= NewX + NewXSize && mouseY <= NewY + NewYSize){
      Screen = "NewQuiz";
    }
  } else if (Screen == "Quiz"){
    if (mouseX >= width * 0.2 && mouseY >= height * 0.45 && mouseX <= width * 0.2 + width * 0.275 && mouseY <= height * 0.45 + height * 0.2){
      if(QuestionClasses[QuestionNumber].ClickA == false && QuestionClasses[QuestionNumber].ClickB == false &&  QuestionClasses[QuestionNumber].ClickC == false && QuestionClasses[QuestionNumber].ClickD == false){
        QuestionClasses[QuestionNumber].ClickA = true;
        if(QuestionClasses[QuestionNumber].CorrectA.equals("True")){
          Score += 10.0 * (1.0 + (0.1 * Combo) + (0.1 * (QuestionClasses[QuestionNumber].Difficulty - 1)));
          Combo++;
        } else {
          Combo = 0;
        }
      }
    }
    if (mouseX >= width * 0.2 && mouseY >= height * 0.7 && mouseX <= width * 0.2 + width * 0.275 && mouseY <= height * 0.7 + height * 0.2){
      if(QuestionClasses[QuestionNumber].ClickA == false && QuestionClasses[QuestionNumber].ClickB == false &&  QuestionClasses[QuestionNumber].ClickC == false && QuestionClasses[QuestionNumber].ClickD == false){
        QuestionClasses[QuestionNumber].ClickB = true;
        if(QuestionClasses[QuestionNumber].CorrectB.equals("True")){
          Score += 10.0 * (1.0 + (0.1 * Combo) + (0.1 * (QuestionClasses[QuestionNumber].Difficulty - 1)));
          Combo++;
        } else {
          Combo = 0;
        }
      }
    }
    if (mouseX >= width * 0.525 && mouseY >= height * 0.45 && mouseX <= width * 0.525 + width * 0.275 && mouseY <= height * 0.45 + height * 0.2){
      if(QuestionClasses[QuestionNumber].ClickA == false && QuestionClasses[QuestionNumber].ClickB == false &&  QuestionClasses[QuestionNumber].ClickC == false && QuestionClasses[QuestionNumber].ClickD == false){
        QuestionClasses[QuestionNumber].ClickC = true;
        if(QuestionClasses[QuestionNumber].CorrectC.equals("True")){
          Score += 10.0 * (1.0 + (0.1 * Combo) + (0.1 * (QuestionClasses[QuestionNumber].Difficulty - 1)));
          Combo++;
        } else {
          Combo = 0;
        }
      }
    }
    if (mouseX >= width * 0.525 && mouseY >= height * 0.7 && mouseX <= width * 0.525 + width * 0.275 && mouseY <= height * 0.7 + height * 0.2){
      if(QuestionClasses[QuestionNumber].ClickA == false && QuestionClasses[QuestionNumber].ClickB == false &&  QuestionClasses[QuestionNumber].ClickC == false && QuestionClasses[QuestionNumber].ClickD == false){
        QuestionClasses[QuestionNumber].ClickD = true;
        if(QuestionClasses[QuestionNumber].CorrectD.equals("True")){
          Score += 10.0 * (1.0 + (0.1 * Combo) + (0.1 * (QuestionClasses[QuestionNumber].Difficulty - 1)));
          Combo++;
        } else {
          Combo = 0;
        }
      }
    }
  } else if (Screen == "NewQuiz"){
    if (mouseX >= NewQuizNameX && mouseY >=  NewQuizNameY && mouseX <= NewQuizNameX + NewQuizNameXSize && mouseY <=  NewQuizNameY + NewQuizNameYSize){
      WriteNewQuizName = true;
    } else {
      WriteNewQuizName = false;
    } //NewQuizName
    
    if (mouseX >= FirstLineX && mouseY >=  FirstLineY && mouseX <= FirstLineX + FirstLineXSize && mouseY <=  FirstLineY + FirstLineYSize){
      WriteFirstLine = true;
    } else {
      WriteFirstLine = false;
    } //FirstLine
    
    if (mouseX >= SecondLineX && mouseY >=  SecondLineY && mouseX <= SecondLineX + SecondLineXSize && mouseY <=  SecondLineY + SecondLineYSize){
      WriteSecondLine = true;
    } else {
      WriteSecondLine = false;
    } //SecondLine
    
    if (mouseX >= ThirdLineX && mouseY >=  ThirdLineY && mouseX <= ThirdLineX + ThirdLineXSize && mouseY <=  ThirdLineY + ThirdLineYSize){
      WriteThirdLine = true;
    } else {
      WriteThirdLine = false;
    } //ThirdLine
    
    if (mouseX >= HColorX && mouseY >=  HColorY && mouseX <= HColorX + HColorXSize && mouseY <=  HColorY + HColorYSize){
      WriteHColor = true;
    } else {
      WriteHColor = false;
    } //HColor
    
    if (mouseX >= SColorX && mouseY >=  SColorY && mouseX <= SColorX + SColorXSize && mouseY <=  SColorY + SColorYSize){
      WriteSColor = true;
    } else {
      WriteSColor = false;
    } //SColor
    
    if (mouseX >= BColorX && mouseY >=  BColorY && mouseX <= BColorX + BColorXSize && mouseY <=  BColorY + BColorYSize){
      WriteBColor = true;
    } else {
      WriteBColor = false;
    } //BColor
    
    if (mouseX >= SubmitX && mouseY >= SubmitY && mouseX <= SubmitX + SubmitXSize && mouseY <=  SubmitY + SubmitYSize){
      NewQuizSubmit = true;
    }
  }
  
  //Return Button
  if (Screen != "MainMenu"){
    if (mouseX >= ReturnX && mouseY >= ReturnY && mouseX <= ReturnX + ReturnXSize && mouseY <= ReturnY + ReturnYSize){
      LoadFiles();
      MouseWheel = 0;
      Screen = "MainMenu";
    }
  }
}


void mouseWheel (MouseEvent event){
  if (Screen.equals("MainMenu")){
    if (MouseWheel >= 0 && MouseWheel <= MouseWheelMax){
      MouseWheel += event.getCount();
    }
    if (MouseWheel < 0){
      MouseWheel = 0;
    } 
    if (MouseWheel > MouseWheelMax){
      MouseWheel = MouseWheelMax;
    }
  }
}