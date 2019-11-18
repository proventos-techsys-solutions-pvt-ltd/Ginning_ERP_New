function HandleBackFunctionality()
{
  if(window.event)
  {
      if(window.event.clientX < 40 && window.event.clientY < 0)
      {
        alert("Browser back button is clicked...");
      }
      else
      {
        alert("Browser refresh button is clicked...");
      }
   }
   else
   {
      if(event.currentTarget.performance.navigation.type == 1)
      {
        alert("Browser refresh button is clicked...");
      }
      if(event.currentTarget.performance.navigation.type == 2)
      {
        alert("Browser back button is clicked...");
      }
   }
}