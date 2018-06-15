CREATE TABLE [dbo].[Competencia] (
    [Id] [uniqueidentifier] NOT NULL,
    [MesAno] [datetime] NOT NULL,
    [ValorBruto] [real] NOT NULL,
    [ValorLucro] [real] NOT NULL,
    [EmailEnviado] [bit] NOT NULL,
    [QuantidadeEmailsEnviado] [int] NOT NULL,
    [Situacao] [varchar](100),
    [EmpresaId] [uniqueidentifier] NOT NULL,
    [DataCadastro] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.Competencia] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[Empresa] (
    [Id] [uniqueidentifier] NOT NULL,
    [RazaoSocial] [varchar](100),
    [Email] [varchar](100),
    [DiaVencimento] [int] NOT NULL,
    [Foto] [varchar](100),
    [DataCadastro] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.Empresa] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[Usuario] (
    [Id] [uniqueidentifier] NOT NULL,
    [Nome] [varchar](100),
    [Ativo] [bit] NOT NULL,
    [EmpresaId] [uniqueidentifier] NOT NULL,
    [DataCadastro] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.Usuario] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[Registro] (
    [Id] [uniqueidentifier] NOT NULL,
    [HoraEntrada] [datetime] NOT NULL,
    [HoraSaida] [datetime] NOT NULL,
    [ValorTotal] [datetime] NOT NULL,
    [Codigo] [varchar](100),
    [VeiculoId] [uniqueidentifier] NOT NULL,
    [EmpresaId] [uniqueidentifier] NOT NULL,
    [DataCadastro] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.Registro] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[Veiculo] (
    [Id] [uniqueidentifier] NOT NULL,
    [Placa] [varchar](100),
    [Modelo] [varchar](100),
    [Marca] [varchar](100),
    [DataCadastro] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.Veiculo] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_EmpresaId] ON [dbo].[Competencia]([EmpresaId])
CREATE INDEX [IX_EmpresaId] ON [dbo].[Usuario]([EmpresaId])
CREATE INDEX [IX_VeiculoId] ON [dbo].[Registro]([VeiculoId])
CREATE INDEX [IX_EmpresaId] ON [dbo].[Registro]([EmpresaId])
ALTER TABLE [dbo].[Competencia] ADD CONSTRAINT [FK_dbo.Competencia_dbo.Empresa_EmpresaId] FOREIGN KEY ([EmpresaId]) REFERENCES [dbo].[Empresa] ([Id])
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [FK_dbo.Usuario_dbo.Empresa_EmpresaId] FOREIGN KEY ([EmpresaId]) REFERENCES [dbo].[Empresa] ([Id])
ALTER TABLE [dbo].[Registro] ADD CONSTRAINT [FK_dbo.Registro_dbo.Empresa_EmpresaId] FOREIGN KEY ([EmpresaId]) REFERENCES [dbo].[Empresa] ([Id])
ALTER TABLE [dbo].[Registro] ADD CONSTRAINT [FK_dbo.Registro_dbo.Veiculo_VeiculoId] FOREIGN KEY ([VeiculoId]) REFERENCES [dbo].[Veiculo] ([Id])
CREATE TABLE [dbo].[__MigrationHistory] (
    [MigrationId] [nvarchar](150) NOT NULL,
    [ContextKey] [nvarchar](300) NOT NULL,
    [Model] [varbinary](max) NOT NULL,
    [ProductVersion] [nvarchar](32) NOT NULL,
    CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201801200330329_AutomaticMigration', N'GEA.AvaliacaoTecnica.Infra.Data.Migrations.Configuration',  0x1F8B0800000000000400ED5CDD52E33816BEDFAA7907972FB79818BA6F66A964A6E800B3D436D04B80DABB2E612B41B5B6ECB1650A766B9E6C2EE691E615F6389665C9B21CFFC4E964D8E206F4F3593AFA8E74247DE28FDF7E9FFEF41AF8D60B8E1312D2997D3239B62D4CDDD0237435B353B6FCFE07FBA71FBFFBCBF4C20B5EADC7A2DCC7AC1CD4A4C9CC7E662C3A759CC47DC6014A260171E33009976CE2868183BCD0F9707CFC37E7E4C4C100610396654DEF52CA4880D77FC09FF390BA386229F2AF430FFB094F879CC51AD5BA41014E22E4E299FDF3C5D9E4EC05F904B928BCC72E252E9A5CD1658C26E788A1096031FCCA6CEB0C8A40F316D85FDA16A234648841E34F1F12BC607148578B0812907FFF166128B7447E8279A74ECBE26DFB77FC21EB9F53562CA0DC346161D011F0E423379853ADDECBECB6302898F4024CCFDEB25EAFCD3AB3E761106106A34E906D55BF773AF7E3ACACC1F0E75096D0493E6C1309E9C86A287F24980484CB7E8EAC79EAB334C6338A531623FFC8FA923EF9C4FD077EBB0FFF8DE98CA6BE2F77033A02794A02247D89C308C7ECED0E2F79E7AE3CDB72D47A4EB5A2A826D5E17D4E09FC7E03DF464F3E1624711AAB5FE3E48C8605049012DF03D73BC33C223F8C3FC52913500B704ABF27D0E714F83110E802C6CEBFA02F04E855407D0A431F23DA19EB9F29021E7AC8C36BD4A4027B45D9C70F9D411704E610609BE8278BA1A7B6758D5E3F63BA62CF30C31DC3CC75495EB157A470E407E027B07866B3386D618928C6091A48946CBE9A230F252CEE41971BF442566B1FAD6F9C6DDD617F9D9F3C93289F08650FFD2ACA5DC6617017FAEA5450647F5D8469ECC2E7EF4373997B14AF30539B3875CA99A671FE11ED1834F77094773CEFDCA1FFA07011C2B8F83B700070DAD1BF724ED06346B4005336706AB80CD9F8D3C2480EFD90A428266152EBD13CB3CE9B2B59C24B0B4FAEE6179EDECB8B39D8402FE628EFD88B6FC28C2B2313F58C9197C14BF8C12E821D5CA6BAF8995CAA97CBDCE115C9BB3DC8670A9877EC347F0F6304E68D814783E3EE0C6B81C81690D681F73D0CA93F186A0E3BF2D5F80BD823266EEA870347E3602786C293EA66866A9E36356805EAE686A69671E337B74C14AA6919CF33B7AC283068D6122D1834697194773C677DF1A1C7A37BF4DADCE34F1CD728DE4167064C09267A9F2549B663CAF8AB06B2620E505B74413D6B43A890DB400A34C012405B120151A10533FBAF5A3FCDA822662F51C5E4A4A29E68A8406F1CC3D609368473984DC0610865BA2F10D86145C86F6E40A55A4B27CAEC2E3E50CD39C711A61EB4AFD9A06DBE2CAD387A03C4772AFEBDC93C534722473367EA8E554C23DC78C6528EB2722ADB9E3F4DA7333BE350432376C0A306031F0297B420C434D4E688A41CE7728BD19E42C6406667FC31B56007E43119F5A0985384681B47588B18B7C49C6AA029E18AF0715CE6545AB04BE6548CDAE6D3D2BE6B07CCC923A1ECA2146AE0B83813AA04E1E222558BF31F12CC43FD84C76D554264F80BCCF4D531B1AD320EAB5BE9346EA950DCC5EA60C494B401A23C4DD52044BCB601A218EA3A8CD26F3680F031AFC3103E528190C653EB4FB967954A190EBCAA14DB1CD48AC6CBF6D3A8BA398C9570CAA1AC6EBCD46EB63041EDAD966E868D515AEB384DEA864AEE0693344566E398453FCED06DD21C6DB48B37A4D64B9ED1600A638431B21D845F35D8A176ED6CB77AF6B74375BD9490CA69A2B51D8ABDAE98E145DED4C905353C61EA189437D36B1445B0879794383CC55AE4329CF9F78BEE529420C770DCA44691225A2BBEC4C218AD7025777D168A2F499CB0EC38E009653BFDB91768C54CEB9961562EBE5AB364E90358CCD745A5ECF7BC624B7992B2E8E91102C7BD84FE67779F6B53E0FA4947AF6D65B229E4A3B8E6BC6A1EFA6940CDF18EB976A16A91118AB4F628B2A8454692D33BA271658B86C6D3DBA3A9F216194FCD698F6814B9C8E0C642EDBF53EA5E64E032B58B0DC416463580716763C6524FEB64383547479C3A1507D06262CD052B7363D5AD5B39BD5872C67078C3FADAC2D98D35C77174454622C328191DDDAAC69F3A51491582285C52B3DA63E68A10192A4FF913135C84EE6310BCD83C7527B8B1E63804CF151672FD3CA53D02974FC8103CE9FF336D2B2296E1F1184C145BF0EE5434571D878B8A7041865132BAE171F142158D27778CAEB87C418BAE787A7BB442C1202315691DDA541E94294D329F9F99B1DEB5078A6DE5180E68D843B7F03F63CD71DC8FDFC1CB003CA9C3C688DFB02B1B239ED60125BF405740F2A48327A1761C512D22BE2E8E252AC70F537E14B0F9759076369017B12D30D50BF1B27381C55BC270901376F18B3FF709F4B72C708D2859E284E57A12FBC3F1F10F95B744FBF3AEC74912CFAF394A313CEE51876C07BA9894925F524CB2BB0BB224381EF894C6430CB3ED3CA58971B67A0D7E48D30BA6EE19CD1361DB7E42436877C8EA039A1798829E51AC4B794ADC5ECF65746268974C57D4C3AF33FBBF6B8853EBEA5F5F05CA91751B83A79E5AC7D6AF5B9115B62456E7172D87E770356F48B6C601E9C5C896306BDF87F4E1BDFC3A645B6DDB01CF6A37CE07C133F995C3960CAEBC69E8339FBEB759AA7EAF7B10F4A9D1FBF70E0E34BDFFB03043D1FBF78652F5FE5BF2104DDDDF8BE0026510C1DF9BB3D54BB20EC1D7149DFA9698A8AAD2B7052A6BD0F77715EFAF3817328E3E424C4D9BD34FA9DE4B9567BEFB1A4B447E107ACD2EAAF12D8DBDA2B5EBAB36DF770E346B2BF68F07AD15DF5B22412951ECA5F7DDF7E16FB8FED9E3B1DFA4D916DAB53E5AEA6F3BF6E6EB806F3BF6FBA0BAD6C56C86EB9B9AF3DC0D52EAFCE81BE295A76CB4F338A587D6BA496A5DF7898E3AEC2619761D7C578D76A344BBEE035D05DC4DFAED3AFC6F27EEAE0CA8222E6A21E6AE5381EFAB78BB6F576BDC4B135CEE9D30BB6F67AB2EA22A20F64E775DF137E5BE7817DDEC20ABD6EF2B61E190FEE721AC5B09599510D97F40A4D855960C51E68A2EC362F1AAB4A828A25D9B31D8B3327416C39E1FB90CB25D9C24EB47D98FC84FD79C79C2DE15BD4D599432E8320E9EFC37D918D90AD8F4FDB5765C6DF3F4365AFFDB826D74019A49B28DF62DFD9412DF13EDBEACD9681B20B2A5F5670CE9F958C24ACDF0EA4D20DD84B42510379F8808EE7110F90096DCD2057AC17DDAF690E0CF7885DCB7E2DAD90CB2792054B34FCF095AC528483846591FFE040E7BC1EB8FFF03A7CF5426FA530000 , N'6.2.0-61023')
