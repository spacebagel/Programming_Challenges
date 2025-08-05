with Ada.Wide_Wide_Text_IO; use Ada.Wide_Wide_Text_IO;
with Ada.Strings.Wide_Wide_Unbounded; use Ada.Strings.Wide_Wide_Unbounded;
with Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO; use Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;
with Ada.Containers.Indefinite_Ordered_Maps;

procedure OccurCount is
   package Character_Integer_Maps is new Ada.Containers.Indefinite_Ordered_Maps
      (Key_Type       => Wide_Wide_Character,
       Element_Type   => Integer);
   use Character_Integer_Maps;
   
   Letter_Map : Map;
   User_Input : Unbounded_Wide_Wide_String;
   Found      : Boolean;
   Temp_Char  : Wide_Wide_Character;
begin
   Put("Enter string: ");
   Get_Line(User_Input); 
   for I in 1 .. Length(User_Input) loop
      Temp_Char := Element(User_Input, I);
      Found := Letter_Map.Contains(Temp_Char);
      if Found then
         Letter_Map.Replace(Temp_Char, Letter_Map.Element(Temp_Char) + 1);
      else
         Letter_Map.Insert(Temp_Char, 1);
      end if;
   end loop;

   for Letter in Iterate(Letter_Map) loop
         Put("Char: ");
         Put(Key(Letter));
         Put(", Count: ");
         Put(Integer'Wide_Wide_Image(Element(Letter)));
         New_Line;
   end loop;
end OccurCount; 
