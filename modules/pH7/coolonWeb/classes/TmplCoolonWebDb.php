<?php
    require_once( BX_DIRECTORY_PATH_CLASSES . 'BxDolTwigModuleDb.php' );

    class TmplCoolonWebDb extends BxDolTwigModuleDb {
        private $_oConfig, $sTablePrefix;
    	function TmplGetLogDb(&$oConfig) {
    		parent::BxDolTwigModuleDb(&$oConfig);		
            $this -> _oConfig = $oConfig;
    	    $this -> sTablePrefix = $oConfig -> getDbPrefix();
        }   
    }
