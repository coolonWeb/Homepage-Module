<?php
    bx_import('BxDolTwigModuleDb');
    bx_import('BxDolTwigModule');
    bx_import('BxDolInstallerUtils');

    class TmplCoolonWebModule extends BxDolTwigModule {
        // contain some module information ;
        private $aModuleInfo, $sPathToModule, $sHomeUrl, $iMemberId;

        /**
    	 * Class constructor ;
         *
         * @param   : $aModule (array) - contain some information about this module;
         *                  [ id ]           - (integer) module's  id ;
         *                  [ title ]        - (string)  module's  title ;
         *                  [ vendor ]       - (string)  module's  vendor ;
         *                  [ path ]         - (string)  path to this module ;
         *                  [ uri ]          - (string)  this module's URI ;
         *                  [ class_prefix ] - (string)  this module's php classes file prefix ;
         *                  [ db_prefix ]    - (string)  this module's Db tables prefix ;
         *                  [ date ]         - (string)  this module's date installation ;
    	 */
    	public function TmplCoolonWebModule(&$aModule) {
            parent::BxDolTwigModule($aModule);

            // prepare the location link ;
            $this -> sPathToModule  = BX_DOL_URL_ROOT . $this -> _oConfig -> getBaseUri();
            $this -> aModuleInfo    = $aModule;

            $this -> sHomeUrl       = $this ->_oConfig -> _sHomeUrl;

            // define member id;
            $this -> iMemberId = getLoggedId();
        }

         function actionAdministration ($sUrl = '') {

        if (!$this->isAdmin()) {
            $this->_oTemplate->displayAccessDenied ();
            return;
        }        

        $this->_oTemplate->pageStart();

        $aMenu = array(
         
            'settings' => array(
                'title' => _t('_tmpl_coolonWeb_menu_admin_settings'), 
                'href' => BX_DOL_URL_ROOT . $this->_oConfig->getBaseUri() . 'administration/settings',
                '_func' => array ('name' => 'actionAdministrationSettings', 'params' => array()),
            ),
        );

        if (empty($aMenu[$sUrl]))
            $sUrl = 'pending_approval';

        $aMenu[$sUrl]['active'] = 1;
        $sContent = call_user_func_array (array($this, $aMenu[$sUrl]['_func']['name']), $aMenu[$sUrl]['_func']['params']);

        echo $this->_oTemplate->adminBlock ($sContent, _t('_tmpl_coolonWeb_page_title_administration'), $aMenu);
        $this->_oTemplate->addCssAdmin ('admin.css');
        $this->_oTemplate->addCssAdmin ('unit.css');
        $this->_oTemplate->addCssAdmin ('main.css');
        $this->_oTemplate->addCssAdmin ('forms_extra.css'); 
        $this->_oTemplate->addCssAdmin ('forms_adv.css');        
        $this->_oTemplate->pageCodeAdmin (_t('_tmpl_coolonWeb_page_title_administration'));
    }

    function actionAdministrationSettings () {
        return parent::_actionAdministrationSettings ('TmplCoolonWeb');
    }


public function serviceTopMember() {
if(!getLoggedId()) {

bx_import('BxTemplMenuQlinks2');
$oMenu = new BxTemplMenuQlinks2();
$sRet = $oMenu->getCode();

$iLoginForm = '<form id="loginBoxForm" action="member.php?skin=coolonWeb" method="post" onsubmit="validateLoginForm(this); return false;">
<input type="hidden" class="form_input_hidden" name="relocate" value="member.php" />
<input type="hidden" class="form_input_hidden" name="csrf_token" value="'.md5(mt_rand()).'" />
<input type="text" class="form_input_text" name="ID" value="'._t('_tmpl_coolonWeb_username_or_mail').'" onfocus="if (\''._t('_tmpl_coolonWeb_username_or_mail').'\' == this.value) this.value=\'\';" onblur="if (\'\' == this.value) this.value = \''._t('_tmpl_coolonWeb_username_or_mail').'\';" /> &nbsp; 
 <input type="password" class="form_input_text" name="Password" value="******" onfocus="if (\'******\' == this.value) this.value=\'\';" onblur="if (\'\' == this.value) this.value = \'******\';" />
<div class="loginRememberMe"><input type="checkbox" class="loginCheckbox" name="rememberMe" id="rememberMe" /><label for="rememberMe">'._t('_Remember password').'</label></div><div class="loginForgot"><a href="forgot" title="'._t('_Forgot password?').'" rel="nofollow">'._t('_Forgot password?').'</a></div>
<input class="loginButton" name="LogIn" value="'._t('_Member Login').'" type="submit" />
</form>';

return $iLoginForm;
}
}

}
