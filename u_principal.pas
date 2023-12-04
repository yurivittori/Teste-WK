unit u_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,  u_produto, u_cliente, u_pedido,
  Vcl.Menus;

type
  TfPrincipal = class(TForm)
    gridProdutos: TDBGrid;
    pnpCabecalho: TPanel;
    lblCodigo: TLabel;
    lblQuantidade: TLabel;
    lblValorUnitario: TLabel;
    edtCODIGOPRODUTO: TEdit;
    btnAdicionar: TButton;
    pnlValorTotal: TPanel;
    lblTotal: TLabel;
    lblValorTotal: TLabel;
    pnlRodape: TPanel;
    qryProdutos: TFDQuery;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    pnlCliente: TPanel;
    edtQuantidade: TEdit;
    edtVALORUNITARIO: TEdit;
    lblCodigoCli: TLabel;
    lblNomeCli: TLabel;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    lblCidadeCli: TLabel;
    lblMarginRight1: TLabel;
    lblESTADOCLIENTE: TLabel;
    qryCliente: TFDQuery;
    edtCODIGOCLIENTE: TEdit;
    qryClientecodigo: TIntegerField;
    qryClientenome: TStringField;
    qryClientecidade: TStringField;
    qryClienteUF: TStringField;
    dsClientes: TDataSource;
    edtNOMECLIENTE: TEdit;
    edtCIDADECLIENTE: TEdit;
    dsqProdutos: TDataSource;
    edtNOMEPRODUTO: TEdit;
    cdsProdutoscodigo: TIntegerField;
    cdsProdutosdescricao: TStringField;
    cdsProdutosvl_venda: TFloatField;
    cdsProdutosquantidade: TIntegerField;
    cdsProdutosvl_total: TFloatField;
    procedure edtCODIGOPRODUTOKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtVALORUNITARIOKeyPress(Sender: TObject; var Key: Char);
    procedure edtCODIGOCLIENTEKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    CodigoCliente : Integer;
    CodigoProduto : Integer;
    procedure HandleEnterKeyPress(Sender: TObject; var Key: Char);
  public

    Cliente : TCliente;
    Produto : TProduto;
    Pedido  : TPedido;
    ValorTotal : Double;
    procedure DesativarSomSistema;
    procedure SetValorTotalGrid;
    procedure ResetaTela;
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses udm, Inifiles;

procedure TfPrincipal.ResetaTela;
begin
  edtCODIGOCLIENTE.Text    := '';
  edtNOMECLIENTE.Text      := '';
  edtCIDADECLIENTE.Text    := '';
  lblESTADOCLIENTE.Caption := '';
  edtNOMEPRODUTO.Text      := '';
  edtCODIGOPRODUTO.Text    := '';
  edtQuantidade.Text       := '';
  edtVALORUNITARIO.Text    := '';
  cdsProdutos.EmptyDataSet;
  edtCODIGOCLIENTE.SetFocus;
end;

procedure TfPrincipal.SetValorTotalGrid;
begin
  lblValorTotal.Caption := 'R$ '+ FormatFloat('#,##0.00', ValorTotal);
end;
procedure TfPrincipal.DesativarSomSistema;
var
  SaveSound: Integer;
begin
  SystemParametersInfo(SPI_GETBEEP, 0, @SaveSound, 0);
  SystemParametersInfo(SPI_SETBEEP, 0, nil, 0);
end;

procedure TfPrincipal.HandleEnterKeyPress(Sender: TObject; var Key: Char);
Begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
  end;
End;

procedure TfPrincipal.btCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja deletar todas as informa��es?' , 'Confirma��o', mb_yesno ) = mrYes then
    ResetaTela;

end;

procedure TfPrincipal.btGravarClick(Sender: TObject);
begin
  if cdsProdutos.RecordCount = 0 then
  begin
    Application.MessageBox('Adicione produtos para continuar o pedido', 'Alerta', mb_iconwarning + mb_ok);
    exit;
  end;

  if CodigoCliente = 0 then
  begin
    Application.MessageBox('Selecione o cliente para continuar o pedido.', 'Alerta', mb_iconwarning + mb_ok);
    exit;
  end;


  Pedido := TPedido.Create;
  try
    Pedido.SalvarPedido(CodigoCliente, ValorTotal);
    Pedido.SalvaProdutos(cdsProdutos);
    ShowMessage('Pedido salvo com sucesso');

  finally
    Pedido.DisposeOf;
  end;
end;

procedure TfPrincipal.btnAdicionarClick(Sender: TObject);
begin
  if not cdsProdutos.Active then
    cdsProdutos.CreateDataSet;

  if CodigoProduto = 0 then
  begin
    ShowMessage('Produto n�o encontrado');
    exit;
  end;

  if Trim(edtQuantidade.Text) = '' then
  begin
    ShowMessage('Informe a quantidade antes de prosseguir');
    exit;
  end;

  if Trim(edtVALORUNITARIO.Text) = '' then
  begin
    ShowMessage('Informe o valor antes de prosseguir');
    exit;
  end;

  cdsProdutos.Append;
  cdsProdutoscodigo.Value     :=  CodigoProduto;
  cdsProdutosdescricao.Value  := edtNOMEPRODUTO.Text;
  cdsProdutosquantidade.Value := StrToInt(edtQuantidade.Text);
  cdsProdutosvl_venda.Value   := StrToFloat(edtVALORUNITARIO.Text);
  cdsProdutosvl_total.Value   := StrToInt(edtQuantidade.Text) * StrToFloat(edtVALORUNITARIO.Text);
  cdsProdutos.Post;

  ValorTotal := ValorTotal + cdsProdutosvl_total.Value;
  SetValorTotalGrid;
  edtCODIGOPRODUTO.SetFocus;

end;

procedure TfPrincipal.edtCODIGOCLIENTEKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin
    try
      Cliente := TCliente.Create(StrToInt(edtCODIGOCLIENTE.Text));
      try
        if Cliente.CarregarDados then
        begin
          edtCIDADECLIENTE.Text    := Cliente.Cidade;
          edtNOMECLIENTE.Text      := Cliente.Nome;
          lblESTADOCLIENTE.Caption := Cliente.Estado;
          CodigoCliente            := StrToInt(edtCODIGOCLIENTE.Text);

          edtCODIGOPRODUTO.SetFocus;
        end
        else
        begin
          Application.MessageBox('Cliente n�o encontrado','Alerta',mb_iconwarning + mb_ok);
          edtCODIGOCLIENTE.Text := '';
          edtCODIGOCLIENTE.SetFocus;
        end;
      except
        on e: exception do
          raise Exception.Create('Erro ao buscar cliente: ' + e.message);
      end;
    finally
      Cliente.DisposeOf;
    end;
  end;

  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0;
  end;
end;

procedure TfPrincipal.edtCODIGOPRODUTOKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Produto := TProduto.Create(StrToInt(edtCODIGOPRODUTO.Text));
    try
      if Produto.CarregarDados then
      begin
        edtNOMEPRODUTO.Text      := Produto.Nome;
        edtVALORUNITARIO.Text    := FormatFloat('#,##0.00',Produto.Preco);
        CodigoProduto := StrToInt(edtCODIGOPRODUTO.Text);
        HandleEnterKeyPress(Sender, Key);
      end
      else
      begin
        Application.MessageBox('Produto n�o encontrado', 'Alerta', mb_iconwarning + mb_ok);
        edtCODIGOPRODUTO.Text := '';
        edtNOMEPRODUTO.Text := '';
        edtQuantidade.Text := '';
        edtVALORUNITARIO.Text := '';
        edtCODIGOPRODUTO.SetFocus;
      end;
    finally
      Produto.DisposeOf;
    end;


  end;

  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0;
  end;
end;

procedure TfPrincipal.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
    HandleEnterKeyPress(Sender, Key);
end;

procedure TfPrincipal.edtVALORUNITARIOKeyPress(Sender: TObject; var Key: Char);
begin
    HandleEnterKeyPress(Sender, Key);
end;


procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  DesativarSomSistema;
  CodigoProduto := 0;
  CodigoCliente := 0;
  ValorTotal    := 0;

end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
  edtCODIGOCLIENTE.SetFocus;
end;

procedure TfPrincipal.gridProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE  then
   begin
     if not cdsProdutos.IsEmpty then
     begin
       if Application.MessageBox('Deseja realmente deletar o produto da lista?', 'Confirma��o', mb_yesno) = mrYes then
       begin
         ValorTotal := ValorTotal - cdsProdutosvl_total.Value;
         SetValorTotalGrid;
         cdsProdutos.Delete;
       end;
     end;
   end;
end;

end.
