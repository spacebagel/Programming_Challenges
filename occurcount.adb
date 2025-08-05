with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
with Ada.Containers.Indefinite_Ordered_Maps; 

procedure OccurCount is
   package Character_Integer_Maps is new Ada.Containers.Indefinite_Ordered_Maps
      (Key_Type     => Character,
         Element_Type => Integer);
   use Character_Integer_Maps;
   Letter_Map : Map;
   User_Input : Unbounded_String;
   Found      : Boolean;
   Temp_Char  : Character;
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
          Put_Line("Key: " & Key(Letter) & ", Value: " & Integer'Image(Element(Letter)));
   end loop;
end OccurCount;