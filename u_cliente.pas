unit u_cliente;



interface

uses Firedac.Comp.Client, udm;

type
  TCliente = class
  private
    FNome: string;
    FCodigo : Integer;
    FCidade : string;
    FEstado : string;


  public
    constructor Create(const ACodCliente: integer);
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
    property Estado : string read FEstado write FEstado;
    function CarregarDados : boolean;
  end;

implementation

function TCliente.CarregarDados : boolean;
var
  qryCliente: TFDQuery;
begin
  Result := false;
  qryCliente := TFDQuery.Create(nil);
  try
    qryCliente.Connection := dm.Database;
    qryCliente.SQL.Text := 'SELECT nome,cidade,uf FROM tb_clientes WHERE codigo = :cod';
    qryCliente.ParamByName('cod').Value := FCodigo;
    qryCliente.Open;

    if not (qryCliente.IsEmpty) then
    begin
      FNome   := qryCliente.FieldByName('nome').AsString;
      FCidade := qryCliente.FieldByName('cidade').AsString;
      FEstado := qryCliente.FieldByName('uf').AsString;
      Result := true;
    end
    else
      Result := false;

  finally
    qryCliente.Free;
  end;
end;

constructor TCliente.Create(const ACodCliente: integer);
begin
  FCodigo := ACodCliente;
end;

end.

