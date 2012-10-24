import Eval
import Parse


import Graphics.UI.Gtk
--Changes today
main :: IO ()
main = do
  initGUI
  
  window  <- windowNew
  set window [windowTitle := "Design By Fadzli", containerBorderWidth := 20,
              windowDefaultWidth := 200, windowDefaultHeight := 200]
  table   <- tableNew 5 6 True
  containerAdd window table
  

  label1<- labelNewWithMnemonic ""

  tableAttachDefaults table label1 0 3 0 1
  
  button1 <- buttonNewWithLabel "1"
  onClicked button1 (buttonSwitch button1 label1)
  tableAttachDefaults table button1 0 1 1 2

  button2 <- buttonNewWithLabel "2"
  
  onClicked button2 (buttonSwitch button2 label1)
  
  tableAttachDefaults table button2 1 2 1 2

  button3 <- buttonNewWithLabel "3"
  onClicked button3 (buttonSwitch button3 label1)
    
  tableAttachDefaults table button3 2 3 1 2

  

  button4 <- buttonNewWithLabel "4"
  onClicked button4 (buttonSwitch button4 label1)
  tableAttachDefaults table button4 0 1 2 3 

  button5 <- buttonNewWithLabel "5"
  onClicked button5 (buttonSwitch button5 label1)
  tableAttachDefaults table button5 1 2 2 3

  button6 <- buttonNewWithLabel "6"
  onClicked button6 (buttonSwitch button6 label1)
  tableAttachDefaults table button6 2 3 2 3

  button7 <- buttonNewWithLabel "7"
  onClicked button7 (buttonSwitch button7 label1)
  tableAttachDefaults table button7 0 1 3 4 

  button8 <- buttonNewWithLabel "8"
  onClicked button8 (buttonSwitch button8 label1)
  tableAttachDefaults table button8 1 2 3 4

  button9 <- buttonNewWithLabel "9"
  onClicked button9 (buttonSwitch button9 label1)
  tableAttachDefaults table button9 2 3 3 4
  
  button_0 <- buttonNewWithLabel "0"
  onClicked button_0 (buttonSwitch button_0 label1)
  tableAttachDefaults table button_0 0 1 4 5 
  
  button_d <- buttonNewWithLabel "."
  onClicked button_d (buttonSwitch button_d label1)
  tableAttachDefaults table button_d 1 2 4 5

  button_C <- buttonNewWithLabel "C"
  
  onClicked button_C $ do

            set label1 [labelText:= ""]
  tableAttachDefaults table button_C 2 3 4 5
  
  button_P <- buttonNewWithLabel "+"
  onClicked button_P (buttonSwitch button_P label1)
  tableAttachDefaults table button_P 3 4 1 2

  button_e <- buttonNewWithLabel "-"
  onClicked button_e (buttonSwitch button_e label1)
  tableAttachDefaults table button_e 3 4 2 3
  
  button_e <- buttonNewWithLabel "*"
  onClicked button_e (buttonSwitch button_e label1)
  tableAttachDefaults table button_e 3 4 3 4
  
  button_e <- buttonNewWithLabel "="
  onClicked button_e (buttonSwitch button_e label1)
  tableAttachDefaults table button_e 3 4 4 5
 
  
  onDestroy window mainQuit
  widgetShowAll window
  mainGUI

buttonSwitch :: Button ->Label-> IO ()

buttonSwitch b l = do
  txt <- get b buttonLabel
  lb <- get l labelText
   
  if txt == "="
     then labelSetText l( show (eval (parse lb)))
     else labelSetText l(lb ++txt)
    