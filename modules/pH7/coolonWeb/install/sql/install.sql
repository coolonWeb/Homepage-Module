SET @iMaxOrder = (SELECT `Order` FROM `sys_page_compose_pages` ORDER BY `Order` DESC LIMIT 1);
INSERT INTO `sys_page_compose_pages` (`Name`, `Title`, `Order`) VALUES ('coolonWeb_splash', 'coolonWeb Splash Page', @iMaxOrder+1);
INSERT INTO `sys_page_compose_pages` (`Name`, `Title`, `Order`) VALUES ('coolonWeb_signup', 'coolonWeb Signup Page', @iMaxOrder+1);

INSERT INTO `sys_page_compose` (`Page`, `PageWidth`, `Desc`, `Caption`, `Column`, `Order`, `Func`, `Content`, `DesignBox`, `ColWidth`, `Visible`, `MinWidth`, `Cache`) VALUES
('coolonWeb_splash', '998px', 'Profiles', '_tmpl_coolonWeb_profiles', 1, 0, 'Profiles', '', 1, 56, 'non', 0, 10800),
('coolonWeb_splash', '998px', 'Geo Ip', '_GeoIp', 1, 1, 'GeoIp', '', 0, 56, 'non', 0, 0),
('coolonWeb_splash', '998px', 'Ads', '_advertisement', 1, 2, 'Echo', '', 0, 56, 'non', 0, 0),
('coolonWeb_splash', '998px', 'Welcome', '_tmpl_coolonWeb_welcome', 1, 3, 'Desc', '', 1, 56, 'non', 0, 9498000),
('coolonWeb_splash', '998px', 'Ads', '_advertisement', 1, 4, 'Echo', '', 0, 56, 'non', 0, 0),
('coolonWeb_splash', '998px', 'Promo block 1', '_tmpl_coolonWeb_dating_website', 1, 5, 'Promo1', '', 0, 56, 'non', 0, 9498000),

('coolonWeb_splash', '998px', 'Join Form Block', '_Join now', 2, 0, 'JoinForm', '', 1, 44, 'non', 413, 0),
('coolonWeb_splash', '998px', 'Why join', '_Why join', 2, 2, 'WhyJoin', '', 1, 44, 'non', 0, 9498000),

('coolonWeb_signup', '998px', 'Join Form Block', '_Join now', 1, 0, 'JoinForm', '', 1, 55, 'non', 413, 0),
('coolonWeb_signup', '998px', 'Profiles', '_tmpl_coolonWeb_profiles', 2, 0, 'Profiles', '', 1, 45, 'non', 0, 10800),
('coolonWeb_signup', '998px', 'Ads', '_advertisement', 2, 1, 'Echo', '', 0, 45, 'non', 0, 0),
('coolonWeb_signup', '998px', 'Why join', '_Why join', 2, 2, 'WhyJoin', '', 1, 45, 'non', 0, 9498000);

    INSERT INTO 
        `sys_page_compose` 
    SET
        `Page`      = 'coolonWeb_splash', 
        `PageWidth` = '998px', 
        `Desc`      = 'RPX', 
        `Caption`   = '_bx_rpx_universal', 
        `Column`    = 2, 
        `Order`     = 1, 
        `Func`      = 'PHP',    
        `Content`   = 'return BxDolService::call(''rpx'', ''get_login_form'');',    
        `DesignBox` = 1, 
        `ColWidth`  = 45, 
        `Visible`   = 'non';
    INSERT INTO 
        `sys_page_compose` 
    SET
        `Page`      = 'coolonWeb_signup', 
        `PageWidth` = '998px', 
        `Desc`      = 'RPX', 
        `Caption`   = '_bx_rpx_universal', 
        `Column`    = 1, 
        `Order`     = 1, 
        `Func`      = 'PHP',    
        `Content`   = 'return BxDolService::call(''rpx'', ''get_login_form'');',    
        `DesignBox` = 1, 
        `ColWidth`  = 55, 
        `Visible`   = 'non';

-- admin menu
SET @iMax = (SELECT MAX(`order`) FROM `sys_menu_admin` WHERE `parent_id` = '2');
INSERT IGNORE INTO `sys_menu_admin` (`parent_id`, `name`, `title`, `url`, `description`, `icon`, `order`) VALUES
(2, 'tmpl_coolonWeb', '_tmpl_coolonWeb_admin', '{siteUrl}modules/?r=coolonweb/administration/settings', 'coolonWeb template by pH7','modules/pH7/coolonWeb/|coolonWeb.png', @iMax+1);

INSERT INTO `sys_permalinks` VALUES (NULL, 'modules/?r=coolonWeb/', 'm/coolonWeb/', 'tmpl_coolonWeb_permalinks');

-- settings
SET @iMaxOrder = (SELECT `menu_order` + 1 FROM `sys_options_cats` ORDER BY `menu_order` DESC LIMIT 1);
INSERT INTO `sys_options_cats` (`name`, `menu_order`) VALUES ('TmplCoolonWeb', @iMaxOrder);

SET @iCategId = (SELECT LAST_INSERT_ID());

INSERT INTO `sys_options` (`Name`, `VALUE`, `kateg`, `desc`, `Type`, `check`, `err_text`, `order_in_kateg`, `AvailableValues`) VALUES
('tmpl_coolonWeb_permalinks', 'on', @iCategId, 'Enable friendly permalinks in template', 'checkbox', '', '', '0', ''),
('tmpl_coolonWeb_quicklinkslinks', '6', @iCategId, 'How many quicklinks in topmembermenu', 'digit', '', '', '0', ''),
('tmpl_coolonWeb_menulinks', '7', @iCategId, 'How many entries in topmenu', 'digit', '', '', '0', ''),
('tmpl_coolonWeb_splash', 'on', @iCategId, 'Use Splashpage', 'checkbox', '', '', '3', '');

UPDATE `sys_options` SET `VALUE` = 'coolonWeb' WHERE CONVERT( `sys_options`.`Name` USING utf8 ) = 'template' LIMIT 1 ;

