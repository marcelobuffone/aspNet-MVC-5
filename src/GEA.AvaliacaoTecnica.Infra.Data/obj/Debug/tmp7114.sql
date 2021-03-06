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
    [Email] [varchar](100),
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
VALUES (N'201801190409249_AutomaticMigration', N'GEA.AvaliacaoTecnica.Infra.Data.Migrations.Configuration',  0x1F8B0800000000000400ED5CDD52E33816BEDFAA7D07972FB79818BA6F66A964A6E800B3D436D04B80DABB2E612B4135B6ECB1650A666A9E6C2FF691F615F6389665C9B21CFFC4E96498E206F4F3593AFA8E74247DE27FFFF9EFF4C7D7C0B75E709C9090CEEC93C9B16D61EA861EA1AB999DB2E577DFDB3FFEF0D7BF4C2FBCE0D57A2CCA7DCCCA414D9ACCEC67C6A253C749DC671CA0641210370E9370C9266E1838C80B9D0FC7C77F774E4E1C0C10366059D6F42EA58C0478FD07FC390FA98B239622FF3AF4B09FF074C859AC51AD1B14E024422E9ED93F5D9C4DCE5E904F908BC27BEC52E2A2C9155DC668728E189A0016C3AFCCB6CEA008346F81FDA56D214A43861834FEF421C10B168774B5882001F9F76F1186724BE4279877EAB42CDEB67FC71FB2FE3965C502CA4D1316061D014F3E728339D5EABDCC6E0B8382492FC0F4EC2DEBF5DAAC337B1E06116630EA04D956F57BA7733FCECA1A0C7F0E65099DE4C33691908EAC86F247824940B8ECE7C89AA73E4B633CA3386531F28FAC2FE9934FDC7FE2B7FBF0674C6734F57DB91BD011C8531220E94B1C4638666F7778C93B77E5D996A3D673AA154535A90EEF734AE0F71BF8367AF2B12089D358FD1A2767342C208094F81EB8DE19E611F961FC294E99805A8053FA3D813EA7C08F8140173076FE057D2140AF02EA5318FA18D1CE58FF4A11F0D0431E5EA32615D82BCA3E7EE80CBA20308700DB443F590C3DB5AD6BF4FA19D3157B8619EE1866AE4BF28ABD2285233F003F81C5339BC5690B4B44314ED040A264F3D51C792861710FBADCA017B25AFB687DE36CEB0EFBEBFCE49944F944287BE85751EE320E83BBD057A78222FBEB224C63173E7F1F9ACBDCA3788599DAC4A953CE348DF38F68C7A0B987A3BCE379E70EFD8AC24508E3E2EFC001C06947FFCA39418F19D1024CD9C0A9E13264E34F0B2339F44392A2988449AD47F3CC3A6FAE64092F2D3CB99A5F787A2F2FE66003BD98A3BC632FBE0933AEFC21DCF78C9197C181C2C12EB51D1CB3BAC49A1CB79763DEE115C9BB3DC8330B9877EC9AFF086304E68D814783A3FB0C6B81C81690D6E1FD3D0CA93F186A0EFBFED5F8CBE423266EEA870347E3602786C293EA66866A9E36356805EAE686A69671E337B74C14AA6919CF33B7AC283068D6122D1834697194773C677DF1A1C7A37BF4DADCE34F1CD728DE4167064C09267A9F2549B62FCBF8AB86CB620E505B74413D6B43A890DB400A34C012405B120151A10533FB6F5A3FCDA8626750A28AC949453DD15081DE38860D1A6C3BE7309B80C310CA745F20B08F8B90DFDC804AB5964E94D95D7CA09A738E234C3D685FB341DB7C595A71F40688EF54FC7B9379A68E448E66CED41DDE9846B8F124A71C65E5ECB73D7F9ACE8076C6A18646EC80470D063E042E69418869A8CD114939CEE516A33D858C81CCCEF8636AC10EC86332EA4131A708D1368EB016316E8939D54053C215E1E3B8CCA9B46097CCA918B5CDA7A57DD70E98934742D9752CD4C07171265409C2C575AD16E73F249887FA098FDBAA84C8F01798E9AB63625B651C56B7D269DC52A1B88BD5C188296903447966AB4188786D034431D47518A5DF6C00E1635E87217CA402218DA7D69F72CF2A95321C785529B639A8158D97EDA7517573182BE1944359DD78A9DD6C6182DABB33DD0C1BA3B4D6719AD40D95DC0D26698ACCC6318B7E9CA1DBA439DA68176F48AD973CA3C114C60863643B08BF6AB043EDDAD96EF5EC6F87EA7A292195D3446B3B147B5D31C38BBCA993CB7678C2D431E87BA6D7288A600F2FE97D788AB5C8C53EF3EF16DD052F418EE1B8498DEE45B4567C8985315AE14AEEFA2C145F923861D971C013CA76FA732FD08A99D633C3AC5C7CB566C9D207B098AF8B4AD9EF79C596222865D1D323048E7B09FDCF6E58D7A6C0F5938E5EDBCAC459C84771CD79D53CF4D3809AE31D73ED423B23231469ED5164E98C8C24A77744E3FA190D8DA7B747534534329E9AD31ED128A591C18D85DA7FA754D7C8C0656A171B882D8C6A00E3CEC68CA59ED6C9706A8E8E38752A0EA0C5C49A0B56E6C6AA5BB7727AB1E48CE1F086F5B585B31B6B8EE3E88A58458651323ABA558D3F75A2922A3751B8A466B5C7CC752732549EF20726B808DDC72078B179EA4E7063CD71089EEB38E4FA79CA6E29CD251832064FFA73B66E45E632C41E83CD621BDF9DCEE6AAE3F059113FC8304A46373C2E80A8A2F1E48E111A974068111A4F6F8F56A82064A422AD439BCAC336A549E6333833D6BBF640B1351DC3010DFBF016FE67AC398EFBF17B7C19802775D85CF15B7A6573C5D33AA0E497F00A489E74F024D48E34AA45C4D7C5D146E50863CA8F1336BF63D2CE17F222B605A67A215E76B6B0784B180E72C22E7EF1E73E81FE9605AE11254B9CB05C93627F383EFEBEF2EA697F5E203949E2F935C731866748EA90ED405B9352F24B8A4976FF419604C7031FFD788861B69D473F31CE56AFC14F7E7AC1D43DF879226CDB8F7D08ED0E597DEAF30253D0338A75395089DBEB618F4E0CEDA2EA8A7AF87566FFB68638B5AEFEFD55A01C59B73178EAA9756CFDBE1569624B62757E7B73780E57F3DA656B1C90C4F15BC2AC7DC9D287F7F23B966DB56D073CABDD7C1F04CFE4F7187B4C30E5AD459F39FABDCD7CF5FBE783A064CD3B84DE0187F60E6158E8A2BC43E80DA5BE43D8928768AF0E7A115CA00C22F87B73B67AA9D821F89AA29FDF121355B5FCB640656DFCFE4606FD95F0425ED24720AA6986FA29E87BA905CD77726389DB0F4247DA45CDBEA5B15734807D55F0FBCE8166CDC7FEF1A0B5127D4B2428A593BD74C8FB3EFC0D574A7B3CF69BB4E44253D747E3FD6DC7DE7CC5F06DC77E1FD4E0BAC8CE7025547346BC41E29D1FA743BCF2948D761EA7F4D0803749C0EB3ED1511FDE240FAF83EFAA1D6F948ED77DA0ABB0BC49575E87FFED44E7950155444F2D44E675EAF47D1595F7ED6A8D7B6942D0BD138CF7ED6CD5455455C5DEE9C12BFEA6DC41EFA29B1DE4DEFA1D282C1CD27F7C84752B21AB1222FBFF8F14BBCA9221CA5CD165582C5E95161545B4AB38067B5686CE62D8F3239741B68B9364FD58FC11F9E99A334FD8BBA2B7298B52065DC6C193FF261B235B019BBEBFD6B4AB6D9EDE46EB7FA7B08D2E403349B6D1BEA59F52E27BA2DD97351B6D0344B6B4FE84213D1F4B58A9195EBD09A49B90B604E2E61311C13D0E221FC0925BBA402FB84FDB1E12FC19AF90FB565C659B41360F846AF6E93941AB180509C728EBC39FC0612F78FDE1FFCBBF56A5F8540000 , N'6.2.0-61023')

