unit GameForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math;

type
  TPyatnashkiMain = class(TForm)
    pnlGameArea: TGridPanel;
    btnNewGame: TButton;
    lblTime: TLabel;
    tmrTime: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnNewGameClick(Sender: TObject);
    procedure tmrTimeTimer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshCells; //�������� �����
    procedure CellClick(Sender: TObject); //������� ������� �����
    procedure GenerateCells; //������������� ����
  end;

var
  PyatnashkiMain: TPyatnashkiMain;
  cells: array[1..4,1..4]of TButton; //��������� ������ � �������� �� ������
  nums: array[1..4,1..4]of Word; //��������� ������ � ������ �����
  time: Cardinal; //������� ����� (� ��������)

implementation

{$R *.dfm}

procedure TPyatnashkiMain.FormCreate(Sender: TObject);
var
  i,n: Integer;
  b: TButton;
  r,c: Word;
  znums: array[0..15]of Word;

function InArr(Num: Word): Boolean;
var
  ii: Integer;
begin
  Result := false;
  for ii := Low(znums) to High(znums) do
    if(znums[ii]=Num)then
    begin
      Result := true;
      Exit;
    end;
end;

begin
  c := 1;
  r := 1;
  for i := 1 to 16 do
  begin
    n := RandomRange(1,15);
    while(InArr(n))do
      n := RandomRange(0,16);
    nums[c,r] := n;
    znums[i-1] := n;

    b := TButton.Create(pnlGameArea);
    b.Caption := IntToStr(n);
    b.Font.Size := 16;
    b.Font.Style := [fsBold];
    b.Parent := pnlGameArea;
    b.Align := alClient;
    b.OnClick := CellClick;
    b.Tag := i;
    pnlGameArea.ControlCollection.AddControl(b,c,r);
    cells[c,r] := b;

    c := c + 1;
    if(c>4)then
    begin
      c := 1;
      r := r + 1;
      if(r>4)then
        Break;
    end;
  end;
  RefreshCells;
end;

procedure TPyatnashkiMain.RefreshCells;
var
  c,r,a: Word;
  b: TButton;
  complete: Boolean;
begin
  a := 1;
  complete := true;
  //������� ���� ������ ��� ���������� ���������� ����������
  for r := 1 to 4 do
    for c := 1 to 4 do
    begin
      b := cells[c,r];
      if(nums[c,r]=0)then
      begin
        //������ ����
        b.Caption := '';     //��� ������
        b.Visible := false;  //� ���������
      end
      else
      begin
        //���� � ������
        b.Caption := IntToStr(nums[c,r]); //����� - ����� �����
        b.Visible := true;                //�������
      end;

      //�������� �� �� ���������� �� �����
      if(a<>16)and(nums[c,r]<>a)then
        complete := false;
      a := a + 1;
    end;

  //��� ����� ���������� ���������
  if(complete)then
  begin
    MessageDlg('�����������, �� ��������!',mtInformation,[mbOK],0);
    GenerateCells;
  end;
end;

procedure TPyatnashkiMain.tmrTimeTimer(Sender: TObject);
var
  h,m,s: Word;
begin
  //���������� �������� ������� �� ������� � ���������� ����� � ����� �� ������
  Inc(time);
  h := time div 60 div 60;
  m := time div 60 - (h * 60);
  s := time - (m * 60);
  //�����
  lblTime.Caption := '�� �������: '+IntToStr(h)+':'+IntToStr(m)+':'+IntToStr(s);
end;

procedure TPyatnashkiMain.btnNewGameClick(Sender: TObject);
begin
  time := 0;
  GenerateCells;
end;

procedure TPyatnashkiMain.CellClick(Sender: TObject);
var
  i,j,c,r,nc,nr,o: Word;
begin
  for i := 1 to 4 do
    for j := 1 to 4 do
      if(cells[i,j].Tag=TButton(Sender).Tag)then
      begin
        c := i;
        r := j;
        Break;
      end;

  if(c>4)or(r>4)then Exit;

  //�������� ���� �� � ������� ������ ������ ����
  if(c>1)and(nums[c-1,r]=0)then
  begin
    nc := c-1;
    nr := r;
  end
  else
  if(c<4)and(nums[c+1,r]=0)then
  begin
    nc := c+1;
    nr := r;
  end
  else
  if(r>1)and(nums[c,r-1]=0)then
  begin
    nc := c;
    nr := r-1;
  end
  else
  if(r<4)and(nums[c,r+1]=0)then
  begin
    nc := c;
    nr := r+1;
  end
  else Exit;

  //���� ���� �� ������ ������� ���� �� �������� �������� � ������ ������
  o := nums[c,r];
  nums[nc,nr] := nums[c,r];
  nums[c,r] := 0;

  //��������� ���������� ����������
  RefreshCells;
end;

procedure TPyatnashkiMain.GenerateCells;
var
  i,n: Integer;
  r,c: Word;
  znums: array[0..15]of Word;

function InArr(Num: Word): Boolean;
var
  ii: Integer;
begin
  Result := false;
  for ii := Low(znums) to High(znums) do
    if(znums[ii]=Num)then
    begin
      Result := true;
      Exit;
    end;
end;

begin
  c := 1;
  r := 1;
  for i := 1 to 16 do
  begin
    n := RandomRange(1,15);
    while(InArr(n))do
      n := RandomRange(0,16);
    nums[c,r] := n;
    znums[i-1] := n;

    c := c + 1;
    if(c>4)then
    begin
      c := 1;
      r := r + 1;
      if(r>4)then
        Break;
    end;
  end;
  RefreshCells;
end;

end.
