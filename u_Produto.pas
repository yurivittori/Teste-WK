unit u_Produto;



interface

uses Firedac.Comp.Client, udm;

type
  TProduto = class
  private
    FNome: string;
    FCodigo : Integer;
    FPreco: Double;

  public
    constructor Create(const ACodprod: Integer);


    property Nome: string read FNome write FNome;
    property Preco: Double read FPreco write FPreco;
    function CarregarDados : boolean;
  end;

implementation

function TProduto.CarregarDados : boolean;
var
  qryProduto: TFDQuery;
begin
  Result := false;
  qryProduto := TFDQuery.Create(nil);
  try
    qryProduto.Connection := dm.Database;
    qryProduto.SQL.Text := 'SELECT descricao, vl_venda FROM tb_produtos WHERE codigo = :cod';
    qryProduto.ParamByName('cod').Value := FCodigo;
    qryProduto.Open;

    if not (qryProduto.IsEmpty)then
    begin
      FNome := qryProduto.FieldByName('descricao').AsString;
      FPreco := qryProduto.FieldByName('vl_venda').AsFloat;
      Result := true;
    end
    else
      Result := false;

  finally
    qryProduto.Free;
  end;
end;

constructor TProduto.Create(const ACodprod: Integer);
begin
  FCodigo := ACodprod;
end;

end.
