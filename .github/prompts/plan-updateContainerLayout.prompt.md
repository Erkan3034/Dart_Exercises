# Plan: Update Container Layout with Blue Outer and Red Inner Container

## TL;DR
Transform the current layout from a single 200x200 container to a nested structure: 200x200 blue container (centered) with a 50x50 red container inside it. Move the text ("Merhaba, $title!") into the red container.

## Steps

1. **Modify outer container styling**
   - Change color from `Color.fromARGB(255, 255, 251, 251)` (light pink) to blue
   - Keep dimensions: 200x200
   - Keep alignment and centering

2. **Replace inner child widget**
   - Remove the current `Text("Merhaba, $title!")` widget
   - Add a nested 50x50 Container with red background
   - Place the Text widget inside the red container with Center/Alignment to center text within the small box

3. **Maintain other elements** (no changes)
   - Keep `Center` widget wrapping (for centering)
   - Keep FloatingActionButton as-is
   - Keep AppBar and other scaffold elements

## Relevant files
- [my_first_app/lib/main.dart](my_first_app/lib/main.dart) — Modify the `body` Container and its child property

## Verification
1. Build and run the app with `flutter run`
2. Verify the outer container is 200x200 and blue colored
3. Verify it's centered on screen
4. Verify the 50x50 red container is visible inside the blue container
5. Verify "Merhaba, Erkan!" text appears inside the red container and is readable
6. Verify FloatingActionButton still functions and shows debug message when pressed

## Decisions
- Blue color choice: Using typical Flutter blue (`Colors.blue`) unless you specify a custom shade
- Text handling: Text will be centered inside the small 50x50 red container
- Scope: Only modifying the body Container structure; leaving other parts of the scaffold unchanged
