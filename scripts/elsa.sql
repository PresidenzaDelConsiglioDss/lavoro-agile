IF OBJECT_ID(N'[Elsa].[__EFMigrationsHistory]') IS NULL
BEGIN
    IF SCHEMA_ID(N'Elsa') IS NULL EXEC(N'CREATE SCHEMA [Elsa];');
    CREATE TABLE [Elsa].[__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    IF SCHEMA_ID(N'Elsa') IS NULL EXEC(N'CREATE SCHEMA [Elsa];');
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE TABLE [Elsa].[Bookmarks] (
        [Id] nvarchar(450) NOT NULL,
        [TenantId] nvarchar(450) NULL,
        [Hash] nvarchar(450) NOT NULL,
        [Model] nvarchar(max) NOT NULL,
        [ModelType] nvarchar(max) NOT NULL,
        [ActivityType] nvarchar(450) NOT NULL,
        [ActivityId] nvarchar(450) NOT NULL,
        [WorkflowInstanceId] nvarchar(450) NOT NULL,
        [CorrelationId] nvarchar(450) NULL,
        CONSTRAINT [PK_Bookmarks] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE TABLE [Elsa].[WorkflowDefinitions] (
        [Id] nvarchar(450) NOT NULL,
        [DefinitionId] nvarchar(450) NOT NULL,
        [TenantId] nvarchar(450) NULL,
        [Name] nvarchar(450) NULL,
        [DisplayName] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        [Version] int NOT NULL,
        [IsSingleton] bit NOT NULL,
        [PersistenceBehavior] int NOT NULL,
        [DeleteCompletedInstances] bit NOT NULL,
        [IsPublished] bit NOT NULL,
        [IsLatest] bit NOT NULL,
        [Tag] nvarchar(450) NULL,
        [Data] nvarchar(max) NULL,
        CONSTRAINT [PK_WorkflowDefinitions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE TABLE [Elsa].[WorkflowExecutionLogRecords] (
        [Id] nvarchar(450) NOT NULL,
        [TenantId] nvarchar(450) NULL,
        [WorkflowInstanceId] nvarchar(450) NOT NULL,
        [ActivityId] nvarchar(450) NOT NULL,
        [ActivityType] nvarchar(450) NOT NULL,
        [Timestamp] datetimeoffset NOT NULL,
        [EventName] nvarchar(max) NULL,
        [Message] nvarchar(max) NULL,
        [Source] nvarchar(max) NULL,
        [Data] nvarchar(max) NULL,
        CONSTRAINT [PK_WorkflowExecutionLogRecords] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE TABLE [Elsa].[WorkflowInstances] (
        [Id] nvarchar(450) NOT NULL,
        [DefinitionId] nvarchar(450) NOT NULL,
        [TenantId] nvarchar(450) NULL,
        [Version] int NOT NULL,
        [WorkflowStatus] int NOT NULL,
        [CorrelationId] nvarchar(450) NULL,
        [ContextType] nvarchar(450) NULL,
        [ContextId] nvarchar(450) NULL,
        [Name] nvarchar(450) NULL,
        [CreatedAt] datetimeoffset NOT NULL,
        [LastExecutedAt] datetimeoffset NULL,
        [FinishedAt] datetimeoffset NULL,
        [CancelledAt] datetimeoffset NULL,
        [FaultedAt] datetimeoffset NULL,
        [Data] nvarchar(max) NULL,
        CONSTRAINT [PK_WorkflowInstances] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_Bookmark_ActivityId] ON [Elsa].[Bookmarks] ([ActivityId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_Bookmark_ActivityType] ON [Elsa].[Bookmarks] ([ActivityType]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_Bookmark_ActivityType_TenantId_Hash] ON [Elsa].[Bookmarks] ([ActivityType], [TenantId], [Hash]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_Bookmark_CorrelationId] ON [Elsa].[Bookmarks] ([CorrelationId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_Bookmark_Hash] ON [Elsa].[Bookmarks] ([Hash]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_Bookmark_Hash_CorrelationId_TenantId] ON [Elsa].[Bookmarks] ([Hash], [CorrelationId], [TenantId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_Bookmark_TenantId] ON [Elsa].[Bookmarks] ([TenantId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_Bookmark_WorkflowInstanceId] ON [Elsa].[Bookmarks] ([WorkflowInstanceId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE UNIQUE INDEX [IX_WorkflowDefinition_DefinitionId_VersionId] ON [Elsa].[WorkflowDefinitions] ([DefinitionId], [Version]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowDefinition_IsLatest] ON [Elsa].[WorkflowDefinitions] ([IsLatest]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowDefinition_IsPublished] ON [Elsa].[WorkflowDefinitions] ([IsPublished]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowDefinition_Name] ON [Elsa].[WorkflowDefinitions] ([Name]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowDefinition_Tag] ON [Elsa].[WorkflowDefinitions] ([Tag]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowDefinition_TenantId] ON [Elsa].[WorkflowDefinitions] ([TenantId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowDefinition_Version] ON [Elsa].[WorkflowDefinitions] ([Version]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowExecutionLogRecord_ActivityId] ON [Elsa].[WorkflowExecutionLogRecords] ([ActivityId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowExecutionLogRecord_ActivityType] ON [Elsa].[WorkflowExecutionLogRecords] ([ActivityType]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowExecutionLogRecord_TenantId] ON [Elsa].[WorkflowExecutionLogRecords] ([TenantId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowExecutionLogRecord_Timestamp] ON [Elsa].[WorkflowExecutionLogRecords] ([Timestamp]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowExecutionLogRecord_WorkflowInstanceId] ON [Elsa].[WorkflowExecutionLogRecords] ([WorkflowInstanceId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_ContextId] ON [Elsa].[WorkflowInstances] ([ContextId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_ContextType] ON [Elsa].[WorkflowInstances] ([ContextType]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_CorrelationId] ON [Elsa].[WorkflowInstances] ([CorrelationId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_CreatedAt] ON [Elsa].[WorkflowInstances] ([CreatedAt]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_DefinitionId] ON [Elsa].[WorkflowInstances] ([DefinitionId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_FaultedAt] ON [Elsa].[WorkflowInstances] ([FaultedAt]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_FinishedAt] ON [Elsa].[WorkflowInstances] ([FinishedAt]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_LastExecutedAt] ON [Elsa].[WorkflowInstances] ([LastExecutedAt]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_Name] ON [Elsa].[WorkflowInstances] ([Name]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_TenantId] ON [Elsa].[WorkflowInstances] ([TenantId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_WorkflowStatus] ON [Elsa].[WorkflowInstances] ([WorkflowStatus]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_WorkflowStatus_DefinitionId] ON [Elsa].[WorkflowInstances] ([WorkflowStatus], [DefinitionId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_WorkflowStatus_DefinitionId_Version] ON [Elsa].[WorkflowInstances] ([WorkflowStatus], [DefinitionId], [Version]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210523093504_Initial'
)
BEGIN
    INSERT INTO [Elsa].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210523093504_Initial', N'8.0.6');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210611200049_Update21'
)
BEGIN
    DROP INDEX [IX_WorkflowInstance_CorrelationId] ON [Elsa].[WorkflowInstances];
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210611200049_Update21'
)
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Elsa].[WorkflowInstances]') AND [c].[name] = N'CorrelationId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Elsa].[WorkflowInstances] DROP CONSTRAINT [' + @var0 + '];');
    EXEC(N'UPDATE [Elsa].[WorkflowInstances] SET [CorrelationId] = N'''' WHERE [CorrelationId] IS NULL');
    ALTER TABLE [Elsa].[WorkflowInstances] ALTER COLUMN [CorrelationId] nvarchar(450) NOT NULL;
    ALTER TABLE [Elsa].[WorkflowInstances] ADD DEFAULT N'' FOR [CorrelationId];
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210611200049_Update21'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_CorrelationId] ON [Elsa].[WorkflowInstances] ([CorrelationId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210611200049_Update21'
)
BEGIN
    ALTER TABLE [Elsa].[WorkflowInstances] ADD [LastExecutedActivityId] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210611200049_Update21'
)
BEGIN
    ALTER TABLE [Elsa].[WorkflowDefinitions] ADD [OutputStorageProviderName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210611200049_Update21'
)
BEGIN
    INSERT INTO [Elsa].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210611200049_Update21', N'8.0.6');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210923112224_Update23'
)
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Elsa].[WorkflowDefinitions]') AND [c].[name] = N'OutputStorageProviderName');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Elsa].[WorkflowDefinitions] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Elsa].[WorkflowDefinitions] DROP COLUMN [OutputStorageProviderName];
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20210923112224_Update23'
)
BEGIN
    INSERT INTO [Elsa].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210923112224_Update23', N'8.0.6');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20211215100215_Update24'
)
BEGIN
    ALTER TABLE [Elsa].[WorkflowInstances] ADD [DefinitionVersionId] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20211215100215_Update24'
)
BEGIN
    DROP INDEX [IX_Bookmark_CorrelationId] ON [Elsa].[Bookmarks];
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20211215100215_Update24'
)
BEGIN
    DROP INDEX [IX_Bookmark_Hash_CorrelationId_TenantId] ON [Elsa].[Bookmarks];
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20211215100215_Update24'
)
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Elsa].[Bookmarks]') AND [c].[name] = N'CorrelationId');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Elsa].[Bookmarks] DROP CONSTRAINT [' + @var2 + '];');
    EXEC(N'UPDATE [Elsa].[Bookmarks] SET [CorrelationId] = N'''' WHERE [CorrelationId] IS NULL');
    ALTER TABLE [Elsa].[Bookmarks] ALTER COLUMN [CorrelationId] nvarchar(450) NOT NULL;
    ALTER TABLE [Elsa].[Bookmarks] ADD DEFAULT N'' FOR [CorrelationId];
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20211215100215_Update24'
)
BEGIN
    CREATE INDEX [IX_Bookmark_CorrelationId] ON [Elsa].[Bookmarks] ([CorrelationId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20211215100215_Update24'
)
BEGIN
    CREATE INDEX [IX_Bookmark_Hash_CorrelationId_TenantId] ON [Elsa].[Bookmarks] ([Hash], [CorrelationId], [TenantId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20211215100215_Update24'
)
BEGIN
    INSERT INTO [Elsa].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20211215100215_Update24', N'8.0.6');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120170305_Update241'
)
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Elsa].[WorkflowInstances]') AND [c].[name] = N'DefinitionVersionId');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Elsa].[WorkflowInstances] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Elsa].[WorkflowInstances] ALTER COLUMN [DefinitionVersionId] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120170305_Update241'
)
BEGIN
    CREATE INDEX [IX_WorkflowInstance_DefinitionVersionId] ON [Elsa].[WorkflowInstances] ([DefinitionVersionId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120170305_Update241'
)
BEGIN
    INSERT INTO [Elsa].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220120170305_Update241', N'8.0.6');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120204205_Update25'
)
BEGIN
    CREATE TABLE [Elsa].[Triggers] (
        [Id] nvarchar(450) NOT NULL,
        [TenantId] nvarchar(450) NULL,
        [Hash] nvarchar(450) NOT NULL,
        [Model] nvarchar(max) NOT NULL,
        [ModelType] nvarchar(max) NOT NULL,
        [ActivityType] nvarchar(450) NOT NULL,
        [ActivityId] nvarchar(450) NOT NULL,
        [WorkflowDefinitionId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_Triggers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120204205_Update25'
)
BEGIN
    CREATE INDEX [IX_Trigger_ActivityId] ON [Elsa].[Triggers] ([ActivityId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120204205_Update25'
)
BEGIN
    CREATE INDEX [IX_Trigger_ActivityType] ON [Elsa].[Triggers] ([ActivityType]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120204205_Update25'
)
BEGIN
    CREATE INDEX [IX_Trigger_ActivityType_TenantId_Hash] ON [Elsa].[Triggers] ([ActivityType], [TenantId], [Hash]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120204205_Update25'
)
BEGIN
    CREATE INDEX [IX_Trigger_Hash] ON [Elsa].[Triggers] ([Hash]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120204205_Update25'
)
BEGIN
    CREATE INDEX [IX_Trigger_Hash_TenantId] ON [Elsa].[Triggers] ([Hash], [TenantId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120204205_Update25'
)
BEGIN
    CREATE INDEX [IX_Trigger_TenantId] ON [Elsa].[Triggers] ([TenantId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120204205_Update25'
)
BEGIN
    CREATE INDEX [IX_Trigger_WorkflowDefinitionId] ON [Elsa].[Triggers] ([WorkflowDefinitionId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220120204205_Update25'
)
BEGIN
    INSERT INTO [Elsa].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220120204205_Update25', N'8.0.6');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220512203701_Update28'
)
BEGIN
    ALTER TABLE [Elsa].[WorkflowDefinitions] ADD [CreatedAt] datetimeoffset NOT NULL DEFAULT '0001-01-01T00:00:00.0000000+00:00';
END;
GO

IF NOT EXISTS (
    SELECT * FROM [Elsa].[__EFMigrationsHistory]
    WHERE [MigrationId] = N'20220512203701_Update28'
)
BEGIN
    INSERT INTO [Elsa].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220512203701_Update28', N'8.0.6');
END;
GO

COMMIT;
GO

