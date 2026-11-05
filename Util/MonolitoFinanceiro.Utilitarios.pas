unit MonolitoFinanceiro.Utilitarios;


interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.WinXPanels;

type
   TUtilitario = class
      class function GetId : String;
      class function LikeFind(Pesquisar : String; Grid : TDBGrid) : String;

   end;
implementation

uses
  System.SysUtils, MonolitoFinanceiro.View.CadastroPadrao;
{ TUtilitario }

class function TUtilitario.GetId: String;
begin
  Result := TGUID.NewGuid.TOString;
  Result := StringReplace(Result, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;


class function TUtilitario.LikeFind(Pesquisar: String;
  Grid: TDBGrid): String;
var
  LContador: Integer;
begin
  Result := '';

  if Pesquisar.Trim.IsEmpty then
    Exit;

  for LContador := 0 to Pred(Grid.Columns.Count) do
  begin
    Result := Result +
      Grid.Columns.Items[LContador].FieldName +
      ' LIKE ' + QuotedStr('%' + Trim(Pesquisar) + '%') +
      ' OR ';
  end;

  if Result <> '' then
  begin
    Result := ' AND (' + Copy(Result, 1, Length(Result) - 4) + ')';
  end;
end;


end.
