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
    function AsString: string; inline;
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
    function IsString: Boolean; inline;
    /// <summary>
    ///   Returns the number of characters in value.
    /// </summary>
    function Length: Integer; inline;
  end;

implementation

uses
  System.DateUtils,
  System.SysUtils;

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

function TJSONValueHelper.AsString: String;
begin
  case Assigned(Self) of
    True :
    begin
      try
        var Value := Self.ToString.Trim.Replace('"', #0);

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
      const DELIMITER = '"';
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

end.
