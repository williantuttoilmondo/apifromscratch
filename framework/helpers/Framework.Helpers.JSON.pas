unit Framework.Helpers.JSON;

interface

uses
  System.Classes,
  System.JSON;

type
  /// <summary>
  ///   Class helper who helps to manipulate TJSONAncestor objects.
  /// </summary>
  TJSONAncestorHelper = class helper for TJSONAncestor
    /// <summary>
    ///   Returns value as a TJSONArray object.
    /// </summary>
    function AsJSONArray: TJSONArray; inline;
    /// <summary>
    ///   Returns value as a TJSONObject object.
    /// </summary>
    function AsJSONObject: TJSONObject; inline;
  end;

  /// <summary>
  ///   Class Helper who helps to manipulate TJSONValue objects.
  /// </summary>
  TJSONValueHelper = class helper for TJSONValue
    /// <summary>
    ///   Returns object value as boolean.
    /// </summary>
    function AsBoolean: Boolean; inline;
    /// <summary>
    ///   Returns object value as date and time.
    /// </summary>
    function AsDateTime: TDateTime; inline;
    /// <summary>
    ///   Returns object value as float.
    /// </summary>
    function AsFloat: Double; inline;
    /// <summary>
    ///   Returns object value as integer.
    /// </summary>
    function AsInteger: Integer; inline;
    /// <summary>
    ///   Returns object value as TJSONArray.
    /// </summary>
    function AsJSONArray: TJSONArray; inline;
    /// <summary>
    ///   Returns object value as TJSONObject.
    /// </summary>
    function AsJSONObject: TJSONObject; inline;
    /// <summary>
    ///   Returns object value as string.
    /// </summary>
    function AsString: string;
    /// <summary>
    ///   Returns object value as unsigned integer.
    /// </summary>
    function AsUnsignedInt: UInt64; inline;
    /// <summary>
    ///   Returns object value as variant.
    /// </summary>
    function AsVariant: Variant; inline;
    /// <summary>
    ///   Destroys current object.
    /// </summary>
    procedure Clear;
    /// <summary>
    ///   Verifies if value is present in a string array.
    /// </summary>
    /// <param name="AValues">
    ///   String array who will be verified.
    /// </param>
    function &In(const AValues: TArray<string>): Boolean; inline;
    /// <summary>
    ///   Verifies if value is between a integer range.
    /// </summary>
    /// <param name="AMin">
    ///   Minimum value in range.
    /// </param>
    /// <param name="AMax">
    ///   Maximum vakue in range.
    /// </param>
    function InRange(const AMin, AMax: Integer): Boolean; overload; inline;
    /// <summary>
    ///   Verifies if value is between a float range.
    /// </summary>
    /// <param name="AMin">
    ///   Minimum value in range.
    /// </param>
    /// <param name="AMax">
    ///   Maximum vakue in range.
    /// </param>
    function InRange(const AMin, AMax: Double): Boolean; overload; inline;
    /// <summary>
    ///   Verifies if object value is boolean.
    /// </summary>
    function IsBoolean: Boolean; inline;
    /// <summary>
    ///   Verifies if object value is char.
    /// </summary>
    function IsChar: Boolean; inline;
    /// <summary>
    ///   Verifies if object value is float.
    /// </summary>
    function IsFloat: Boolean; inline;
    /// <summary>
    ///   Verifies if object value is integer.
    /// </summary>
    function IsInteger: Boolean; inline;
    /// <summary>
    ///   Verifies if object value is a TJSONArray obejct.
    /// </summary>
    function IsJSONArray: Boolean; inline;
    /// <summary>
    ///   Verifies if object value is a TJSONObject object.
    /// </summary>
    function IsJSONObject: Boolean; inline;
    /// <summary>
    ///   Verifies if object value is string.
    /// </summary>
    function IsString: Boolean;
    /// <summary>
    ///   Returns the number of characters in value.
    /// </summary>
    function Length: Integer; inline;
  end;

  /// <summary>
  ///   Class helper who helps to manipulate TJSONObject objects.
  /// </summary>
  TJSONObjectHelper = class helper for TJSONObject
  strict private
    function GetNode(const AName: string): TJSONValue;
    procedure SetNode(const AName: string; const Value: TJSONValue);
  public
    /// <summary>
    ///   Adds to JSON object a node based in a stream value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddBinaryPair(const Str: string; const Val: TStream): TJSONObject; inline;
    /// <summary>
    ///   Adds to JSON object a node based in a boolean value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddBooleanPair(const Str: string; const Val: Boolean): TJSONObject; inline;
    /// <summary>
    ///   Adds to JSON object a node based in a date value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddDatePair(const Str: string; const Val: TDate): TJSONObject; inline;
    /// <summary>
    ///   Adds to JSON object a node based in a date and time value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddDateTimePair(const Str: string; const Val: TDateTime): TJSONObject; inline;
    /// <summary>
    ///   Adds to JSON object a node based in a floating point value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddFloatPair(const Str: string; const Val: Extended): TJSONObject; inline;
    /// <summary>
    ///   Adds to JSON object a node based in a integer value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddIntegerPair(const Str: string; const Val: Integer): TJSONObject; inline;
    /// <summary>
    ///   Adds to JSON object a node based in a TStrings value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddStringsPair(const Str: string; const Val: TStrings): TJSONObject; inline;
    /// <summary>
    ///   Adds to JSON object a node based in a string value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddStringPair(const Str, Val: string): TJSONObject; inline;
    /// <summary>
    ///   Adds to JSON object a node based in a time value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddTimePair(const Str: string; const Val: TTime): TJSONObject; inline;
    /// <summary>
    ///   Adds to JSON object a node based in a variant value.
    /// </summary>
    /// <param name="Str">
    ///   Node name.
    /// </param>
    /// <param name="Val">
    ///   Node value.
    /// </param>
    function AddVariantPair(const Str: string; const Val: Variant): TJSONObject; inline;
    /// <summary>
    ///   Clears the current object excludind every node.
    /// </summary>
    procedure Clear; inline;
    /// <summary>
    ///   Deletes a node if exists.
    /// </summary>
    /// <param name="ANode">
    ///   Node name.
    /// </param>
    function DeleteNode(const ANode: string): Boolean; inline;
    /// <summary>
    ///   Verifies if a node exists in current object.
    /// </summary>
    /// <param name="ANode">
    ///   Node name.
    /// </param>
    /// <param name="AIgnoreCase">
    ///   Flag who determines if node case will be considered in search.
    /// </param>
    function HasNode(const ANode: string; const AIgnoreCase: Boolean = True): Boolean; inline;
    /// <summary>
    ///   Returns the index number of a node if exists. If don't, returns -1.
    /// </summary>
    /// <param name="ANode">
    ///   Node name.
    /// </param>
    function IndexOf(const ANode: string; const AIgnoreCase: Boolean = True): Integer; inline;
    /// <summary>
    ///   Returns if node is a TJSONArray object. If node doesn't exist, returns False.
    /// </summary>
    /// <param name="ANode">
    ///   Node name.
    /// </param>
    function IsJSONArray(const ANode: string): Boolean; inline;
    /// <summary>
    ///   Returns if node is a TJSONObject object. If node doesn't exist, returns False.
    /// </summary>
    /// <param name="ANode">
    ///   Node name.
    /// </param>
    function IsJSONObject(const ANode: string): Boolean; inline;
    /// <summary>
    ///   Loads an JSON object from a text file. Returns False if file doesn't exist or contains an invalid JSON object.
    /// </summary>
    /// <param name="AFileName">
    ///   Name of the file to be loaded.
    /// </param>
    /// <remarks>
    ///   File name must contains the full path to it.
    /// </remarks>
    function LoadFromFile(const AFileName: string): Boolean; inline;
    /// <summary>
    ///   Returns the minified string representing the JSON object.
    /// </summary>
    function Minify: string; inline;
    /// <summary>
    ///   Returns a string array containing the nodes in JOSN object root.
    /// </summary>
    function Nodes: TArray<string>;
    /// <summary>
    ///   Returns the prettified string representing the JSON object.
    /// </summary>
    /// <param name="ASpaces">
    ///   Number of white spaces in JSON indentation.
    /// </param>
    function PrettyFormat(const ASpaces: Integer = 4): string; inline;
    /// <summary>
    ///   Saves the JSON object in a text file. Returns False if file cannot be saved or path cannot be verified.
    /// </summary>
    /// <param name="AFileName">
    ///   Name of the file to be saved.
    /// </param>
    /// <param name="AMinified">
    ///   Flag who determines if the JSON object will be minified or prettified.
    /// </param>
    /// <remarks>
    ///   File name must contains the full path to it.
    /// </remarks>
    function SaveToFile(const AFileName: string; const AMinified: Boolean = False): Boolean; inline;
    /// <summary>
    ///   Search for a node and tries to read its value.
    /// </summary>
    /// <param name="ANode">
    ///   Node name.
    /// </param>
    /// <param name="DefaultValue">
    ///   Default value if node doesn't exist.
    /// </param>
    function TryReadNode(const ANode: string; const ADefaultValue: Variant; const AIgnoreCase: Boolean = True): Variant; inline;
    /// <summary>
    ///   Property who reads a node. Returns nil if node doesn't exist.
    /// </summary>
    /// <param name="AName">
    ///   Node name.
    /// </param>
    property Node[const AName: string]: TJSONValue read GetNode write SetNode;
  end;

implementation

uses
  Soap.EncdDecd,
  System.DateUtils,
  System.IOUtils,
  System.NetEncoding,
  System.SysUtils;

const
  CHAR_NULL: Char = #0;
  DELIMITER: Char = '"';

{ TJSONAncestorHelper }

function TJSONAncestorHelper.AsJSONArray: TJSONArray;
begin
  Result := Self as TJSONArray;
end;

function TJSONAncestorHelper.AsJSONObject: TJSONObject;
begin
  Result := Self as TJSONObject;
end;

{ TJSONValueHelper }

function TJSONValueHelper.AsBoolean: Boolean;
begin
  case Self is TJSONNull of
    True : Result := False;
    False:
    begin
      try
        Result := Self.GetValue<Boolean>;
      except
        Result := False;
      end;
    end;
  end;
end;

function TJSONValueHelper.AsDateTime: TDateTime;
begin
  case Self is TJSONNull of
    True : Result := 0;
    False:
    begin
      try
        Result := ISO8601ToDate(Self.AsString.Trim);
      except
        Result := 0;
      end;
    end;
  end;
end;

function TJSONValueHelper.AsFloat: Double;
begin
  case Self is TJSONNull of
    True : Result := 0;
    False:
    begin
      try
        Result := Self.GetValue<Double>;
      except
        Result := 0;
      end;
    end;
  end;
end;

function TJSONValueHelper.AsInteger: Integer;
begin
  case Self is TJSONNull of
    True : Result := 0;
    False:
    begin
      try
        Result := Self.GetValue<Integer>;
      except
        Result := 0;
      end;
    end;
  end;
end;

function TJSONValueHelper.AsJSONArray: TJSONArray;
begin
  try
    Result := Self as TJSONArray;
  except
    Result := nil;
  end;
end;

function TJSONValueHelper.AsJSONObject: TJSONObject;
begin
  try
    Result := Self as TJSONObject;
  except
    Result := nil;
  end;
end;

function TJSONValueHelper.AsString: string;
begin
  case Assigned(Self) of
    True :
    begin
      try
        var Value := Self.ToString.Trim.Replace(DELIMITER, CHAR_NULL);

        case Value = 'null' of
          True : Result := EmptyStr;
          False: Result := Value;
        end;
      except
        Result := EmptyStr;
      end;
    end;
    False: Result := EmptyStr;
  end;
end;

function TJSONValueHelper.AsUnsignedInt: UInt64;
begin
  case Self is TJSONNull of
    True : Result := 0;
    False:
    begin
      try
        Result := Self.GetValue<UInt64>;
      except
        Result := 0;
      end;
    end;
  end;
end;

function TJSONValueHelper.AsVariant: Variant;
begin
  case Self is TJSONNull of
    True : Result := varNull;
    False:
    begin
      if Self is TJSONBool then
      begin
        Result := GetValue<Boolean>;
      end;

      if Self is TJSONNumber then
      begin
        Result := GetValue<Double>;
      end;

      if Self is TJSONString then
      begin
        Result := GetValue<string>;
      end;
    end;
  end;
end;

procedure TJSONValueHelper.Clear;
begin
  if Assigned(Self) then
  begin
    Self.DisposeOf;
  end;
end;

function TJSONValueHelper.&In(const AValues: TArray<string>): Boolean;
begin
  Result := False;

  if (not Self.IsString) or Self.AsString.Trim.IsEmpty then
  begin
    Exit;
  end;

  var Str := Self.AsString.Trim;

  for var Value in AValues do
  begin
    Result := Result or Str.Equals(Value);

    if Result then
    begin
      Exit;
    end;
  end;
end;

function TJSONValueHelper.InRange(const AMin, AMax: Integer): Boolean;
begin
  case Self is TJSONNull of
    True : Result := False;
    False: Result := IsInteger
                 and (Self.AsInteger >= AMin)
                 and (Self.AsInteger <= AMax);
  end;
end;

function TJSONValueHelper.InRange(const AMin, AMax: Double): Boolean;
begin
  case Self is TJSONNull of
    True : Result := False;
    False: Result := IsFloat
                 and (Self.AsFloat >= AMin)
                 and (Self.AsFloat <= AMax);
  end;
end;

function TJSONValueHelper.IsBoolean: Boolean;
begin
  case Self is TJSONNull of
    True : Result := False;
    False:
    begin
      var Value := Self.AsString.ToLower;
      Result := (Value = 'true') or (Value = 'false');
    end;
  end;
end;

function TJSONValueHelper.IsChar: Boolean;
begin
  case Self is TJSONNull of
    True : Result := False;
    False: Result := Self.AsString.Length = 1;
  end;
end;

function TJSONValueHelper.IsFloat: Boolean;
begin
  case Self is TJSONNull of
    True : Result := False;
    False:
    begin
      var Value := Self.AsString;

      try
        StrToFloat(Value);
        Result := True;
      except
        Result := False;
      end;
    end;
  end;
end;

function TJSONValueHelper.IsInteger: Boolean;
begin
  case Self is TJSONNull of
    True : Result := False;
    False:
    begin
      var Value := Self.AsString;

      try
        StrToInt(Value);
        Result := True;
      except
        Result := False;
      end;
    end;
  end;
end;

function TJSONValueHelper.IsJSONArray: Boolean;
begin
  try
    Result := Self is TJSONArray;
  except
    Result := False;
  end;
end;

function TJSONValueHelper.IsJSONObject: Boolean;
begin
  try
    Result := Self is TJSONObject;
  except
    Result := False;
  end;
end;

function TJSONValueHelper.IsString: Boolean;
begin
  case Self is TJSONNull of
    True : Result := False;
    False:
    begin
      var Value := Self.ToString;
      Result := Value.StartsWith(DELIMITER) and Value.EndsWith(DELIMITER);
    end;
  end;
end;

function TJSONValueHelper.Length: Integer;
begin
  case Self is TJSONNull of
    True : Result := 0;
    False: Result := Self.AsString.Length;
  end;
end;

{ TJSONObjectHelper }

function TJSONObjectHelper.AddBinaryPair(const Str: string; const Val: TStream): TJSONObject;
begin
  Result := Self.AddPair(Str, string(EncodeBase64(Val, Val.Size)));
end;

function TJSONObjectHelper.AddBooleanPair(const Str: string; const Val: Boolean): TJSONObject;
begin
  Result := Self.AddPair(Str, TJSONBool.Create(Val));
end;

function TJSONObjectHelper.AddDatePair(const Str: string; const Val: TDate): TJSONObject;
begin
  Result := Self.AddPair(Str, FormatDateTime('YYYY-MM-DD', Val));
end;

function TJSONObjectHelper.AddDateTimePair(const Str: string; const Val: TDateTime): TJSONObject;
begin
  Result := Self.AddPair(Str, Val.ToISO8601);
end;

function TJSONObjectHelper.AddFloatPair(const Str: string; const Val: Extended): TJSONObject;
begin
  Result := Self.AddPair(Str, TJSONNumber.Create(Val));
end;

function TJSONObjectHelper.AddIntegerPair(const Str: string; const Val: Integer): TJSONObject;
begin
  Result := Self.AddPair(Str, TJSONNumber.Create(Val));
end;

function TJSONObjectHelper.AddStringPair(const Str, Val: string): TJSONObject;
begin
  case Val.IsEmpty of
    True : Result := Self.AddPair(Str, nil);
    False: Result := Self.AddPair(Str, Val);
  end;
end;

function TJSONObjectHelper.AddStringsPair(const Str: string; const Val: TStrings): TJSONObject;
begin
  var Strings := TJSONArray.Create;

  for var Value in Val do
  begin
    Strings.Add(Value);
  end;

  Result := Self.AddPair(Str, Strings);
end;

function TJSONObjectHelper.AddTimePair(const Str: string; const Val: TTime): TJSONObject;
begin
  Result := Self.AddPair(Str, FormatDateTime('HH:NN:SS', Val));
end;

function TJSONObjectHelper.AddVariantPair(const Str: string; const Val: Variant): TJSONObject;
begin
  case Val.TypeOfVar of
    varByte,
    varWord,
    varUInt32,
    varInt64,
    varUInt64,
    varShortInt,
    varInteger,
    varSmallInt: Result := AddIntegerPair(Str, Val.ToInteger);
    varSingle,
    varDouble,
    varCurrency: Result := AddFloatPair(Str, Val.ToFloat);
    varDate    : Result := AddDatePair(Str, Val.ToDateTime);
    varBoolean : Result := AddBooleanPair(Str, Val.ToBoolean);
    varOleStr,
    varString,
    varUString : Result := AddStringPair(Str, Val.ToString);
    varDispatch,
    varUnknown,
    varAny,
    varArray,
    varByRef,
    varError,
    varRecord  : Result := AddPair(Str, nil);
  else
    Result := Self.AddPair(Str, nil);
  end;
end;

procedure TJSONObjectHelper.Clear;
begin
  for var Node in Nodes do
  begin
    DeleteNode(Node);
  end;
end;

function TJSONObjectHelper.DeleteNode(const ANode: string): Boolean;
begin
  Result := True;

  if not HasNode(ANode) then
  begin
    Exit;
  end;

  try
    var Pair := Self.RemovePair(ANode);

    if Assigned(Pair) then
    begin
      Pair.DisposeOf;
    end;
  except
    Result := False;
  end;
end;

function TJSONObjectHelper.GetNode(const AName: string): TJSONValue;
begin
  case HasNode(AName) of
    False: Result := TJSONNull.Create;
    True : Result := GetValue(AName);
  end;
end;

function TJSONObjectHelper.HasNode(const ANode: string; const AIgnoreCase: Boolean): Boolean;
begin
  Result := False;

  for var Node in Nodes do
  begin
    case AIgnoreCase of
      True : Result := Result or Node.ToLower.Equals(ANode.ToLower);
      False: Result := Result or Node.Equals(ANode);
    end;

    if Result then
    begin
      Exit;
    end;
  end;
end;

function TJSONObjectHelper.IndexOf(const ANode: string; const AIgnoreCase: Boolean): Integer;
begin
  var AllNodes := Nodes;

  for Result := 0 to Pred(System.Length(AllNodes)) do
  begin
    var Node := AllNodes[Result];

    case AIgnoreCase of
      True :
      begin
        if Node.ToLower.Equals(AllNodes[Result].ToLower) then
        begin
          Exit;
        end;
      end;
      False:
      begin
        if Node.Equals(AllNodes[Result]) then
        begin
          Exit;
        end;
      end;
    end;
  end;

  Result := -1;
end;

function TJSONObjectHelper.IsJSONArray(const ANode: string): Boolean;
begin
  Result := HasNode(ANode) and (GetValue(ANode) is TJSONArray);
end;

function TJSONObjectHelper.IsJSONObject(const ANode: string): Boolean;
begin
  Result := HasNode(ANode) and (GetValue(ANode) is TJSONObject);
end;

function TJSONObjectHelper.LoadFromFile(const AFileName: string): Boolean;
begin
  Result := FileExists(AFileName);

  if not Result then
  begin
    Exit;
  end;

  var JSONFile := TStringList.Create;
  JSONFile.LoadFromFile(AFileName);

  try
    try
      Self   := TJSONObject.ParseJSONValue(JSONFile.Text).AsJSONObject;
      Result := Assigned(Self);
    except
      Result := False;
    end;
  finally
    JSONFile.DisposeOf;
  end;
end;

function TJSONObjectHelper.Minify: string;
begin
  Result := ToJSON;
end;

function TJSONObjectHelper.Nodes: TArray<string>;
begin
  SetLength(Result, 0);

  for var Pair in Self do
  begin
    var Index := System.Length(Result);
    SetLength(Result, Succ(Index));
    Result[Index] := Pair.JsonString.ToString.Replace(DELIMITER, CHAR_NULL);
  end;
end;

function TJSONObjectHelper.PrettyFormat(const ASpaces: Integer): string;
begin
  Result := Format(ASpaces);
end;

function TJSONObjectHelper.SaveToFile(const AFileName: string; const AMinified: Boolean): Boolean;
begin
  Result := True;
  var Directory := IncludeTrailingPathDelimiter(ExtractFilePath(AFileName));

  if not (Directory.IsEmpty or TDirectory.Exists(Directory)) then
  begin
    Result := ForceDirectories(Directory);
  end;

  if not Result then
  begin
    Exit;
  end;

  var JSONFile := TStringList.Create;

  case AMinified of
    True : JSONFile.Text := Minify;
    False: JSONFile.Text := PrettyFormat(2);
  end;

  try
    try
      JSONFile.SaveToFile(AFileName);
      Result := True;
    except
      Result := False;
    end;
  finally
    JSONFile.DisposeOf;
  end;
end;

procedure TJSONObjectHelper.SetNode(const AName: string; const Value: TJSONValue);
begin
  if not (HasNode(AName) and DeleteNode(AName)) then
  begin
    Exit;
  end;

  AddPair(AName, Value);
end;

function TJSONObjectHelper.TryReadNode(const ANode: string; const ADefaultValue: Variant; const AIgnoreCase: Boolean): Variant;
begin
  case HasNode(ANode, AIgnoreCase) of
    True : Result := Node[ANode].AsVariant;
    False: Result := ADefaultValue;
  end;
end;

end.
