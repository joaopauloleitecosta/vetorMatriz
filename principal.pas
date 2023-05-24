unit principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnCriar: TButton;
    btnLimpar: TButton;
    edtTamanho: TEdit;
    lblTamanho: TLabel;
    mmResultado: TMemo;
    rdgTipoArray: TRadioGroup;
    procedure btnCriarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure rdgTipoArrayClick(Sender: TObject);
  private
    vetor: array of integer;
    matriz: array of array of integer;
    tamanho: integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnCriarClick(Sender: TObject);
var i,j: integer;
    s: string;
begin
  tamanho := StrToInt(edtTamanho.Text);
  mmResultado.Lines.Clear;
  Randomize;

  if (rdgTipoArray.ItemIndex = -1) then
  begin
    ShowMessage('Precisa selecionar o tipo do Array');
    Abort;
  end;

  if (rdgTipoArray.ItemIndex = 0) then
  begin
    SetLength(vetor, tamanho); // Cria o vetor dinamicamente
    for i:=low(vetor) to high(vetor) do
    begin
      vetor[i] := random(100);
      mmResultado.Lines.Add(Format('vetor[%2d] = %2d', [i, vetor[i]]));
    end;
  end
  else
  begin
    SetLength(matriz, tamanho); // Cria a matriz dinamicamente
    for i:=low(matriz) to high(matriz) do
    begin
      s := Format('%2da. linha = ', [i + 1]); // Cria a linha da matriz dinamicamente
      SetLength(matriz[i], tamanho); // Seta o tamanho da linha
      for j:=low(matriz[i]) to high(matriz[i]) do
      begin
        matriz[i, j] := random(100);
        s := s + Format('%2d ', [matriz[i,j]])
      end;
      mmResultado.Lines.Add(s);
    end;

  end;
end;

procedure TForm1.btnLimparClick(Sender: TObject);
begin
  if (rdgTipoArray.ItemIndex = 0) then
    Finalize(vetor)
  else
    Finalize(matriz);


  mmResultado.Clear;

end;

procedure TForm1.rdgTipoArrayClick(Sender: TObject);
begin
  if (rdgTipoArray.ItemIndex = 0) then
  begin
    btnCriar.Caption := 'Criar o Vetor';
    lblTamanho.Caption := 'Tamanho do Vetor';
  end
  else
  begin
    btnCriar.Caption := 'Criar a Matriz';
    lblTamanho.Caption := 'Ordem da Matriz';
  end;
end;

end.

