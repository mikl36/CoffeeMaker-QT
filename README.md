# CoffeeMaker-QT
A course project, Coffee Maker UI, QML (QT), Qt Design Studio
- includes only source files, create a project in Qt Design Studio / Qt Creator and import/add the files. Gif is not included (used: https://fi.pinterest.com/pin/hey--
67624431879681568).
The coffee machine UI is based on a QT example, mainly for ideas and navigation. The implementation includes:
- Three Views: Home view, coffee selection view, and coffee brewing view (an animation during brewing).
- Folder Structure: Organized to include components, images, and transitions (not final).
- Coffee Object (only an idea here): Intended to handle essential functions and integration. Properties include type, milk amount, sugar amount, coffee strength, and brewing time. Some properties are implemented, but not fully utilized.
- Custom Components, for example: Includes buttons, text, and sliders. Other key components are the coffee card (for the coffee menu) and the brewing animation.
- Navigation: Implemented in App.qml using StackView with signals for different navigation scenarios:
  - Home View: Default view with buttons to coffee selection and quick start (brews coffee with previous settings or default).
  - Coffee Selection View: Allows choosing coffee type and adjusting properties like milk and sugar. Uses a custom slider and buttons.
  - Coffee Brewing View: An animation showing the brewing process, with a return to the home view after completion.
- HomeView: A simple layout with columns and rows, featuring a background image created with AI (Grok). Includes general text, buttons for actions, and an option to set the coffee water temperature.
- CoffeeSelectView: More complex, with a custom slider for adjusting properties and a custom button for navigation. The main component is the CoffeeCard.qml, which displays coffee details and allows selection.
- CoffeeBrewingView.qml: A straightforward animation using images and gifs, signaling the end of the brewing process.

![image](https://github.com/user-attachments/assets/3b05f790-6af8-436a-bf6f-172092fa3c14)

![image](https://github.com/user-attachments/assets/1ccd6e02-79d9-4353-898b-10d4e66e6462)

![image](https://github.com/user-attachments/assets/4c74e7d5-a206-47da-b1ae-7aced8ef2005)
