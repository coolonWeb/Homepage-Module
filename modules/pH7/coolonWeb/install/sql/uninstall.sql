DELETE FROM `sys_page_compose` WHERE `Page` = 'coolonWeb_splash';
DELETE FROM `sys_page_compose_pages` WHERE `Name` = 'coolonWeb_splash';
DELETE FROM `sys_page_compose` WHERE `Page` = 'coolonWeb_signup';
DELETE FROM `sys_page_compose_pages` WHERE `Name` = 'coolonWeb_signup';
DELETE FROM `sys_menu_admin` WHERE `Name` = 'tmpl_coolonWeb';

SET @iCategId = (SELECT `ID` FROM `sys_options_cats` WHERE `name` = 'TmplCoolonWeb' LIMIT 1);
DELETE FROM `sys_options` WHERE `kateg` = @iCategId;
DELETE FROM `sys_options_cats` WHERE `ID` = @iCategId;
DELETE FROM `sys_options` WHERE `Name` = 'tmpl_coolonWeb_permalinks';

DELETE FROM `sys_permalinks` WHERE `check` = 'tmpl_coolonWeb_permalinks';

UPDATE `sys_options` SET `VALUE` = 'uni' WHERE CONVERT( `sys_options`.`Name` USING utf8 ) = 'template' LIMIT 1 ;
