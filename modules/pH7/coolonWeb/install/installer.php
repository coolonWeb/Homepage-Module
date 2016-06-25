<?php
    require_once(BX_DIRECTORY_PATH_CLASSES . "BxDolInstaller.php");

    class TmplCoolonWebInstaller extends BxDolInstaller {
       public function __construct(&$aConfig) {
            parent::__construct($aConfig);
        }
    }
