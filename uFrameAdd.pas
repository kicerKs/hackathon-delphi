unit uFrameAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrameAdd = class(TFrame)
    panelAdd: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnAddLoan: TButton;
    loanExpDate: TDateTimePicker;
    editWhatMoney: TEdit;
    radioItem: TRadioButton;
    radioMoney: TRadioButton;
    editNumber: TEdit;
    comboBoxPerson: TComboBox;

    procedure RadioButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

  constructor TFrameAdd.Create(AOwner: TComponent);
    begin
      inherited Create(AOwner);
      radioMoney.Checked := True;
      editWhatMoney.Visible := True;
      editNumber.Visible := False;
    end;

  procedure TFrameAdd.RadioButtonClick(Sender: TObject);
    const
      shiftAmount = 29;
    begin
      if RadioMoney.Checked then
      begin
        editWhatMoney.Visible := True;
        editNumber.Visible := False;
        label6.Visible := False;
        btnAddLoan.Top := btnAddLoan.Top - shiftAmount;
        loanExpDate.Top := loanExpDate.Top - shiftAmount;
        Label1.Caption := 'Kwota';
      end
      else if RadioItem.Checked then
      begin
        editWhatMoney.Visible := True;
        editNumber.Visible := True;
        label6.Visible := True;
        btnAddLoan.Top := btnAddLoan.Top + shiftAmount;
        loanExpDate.Top := loanExpDate.Top + shiftAmount;
        Label1.Caption := 'Przedmiot';
      end;
    end;

end.
