<?php
/**
* FormBuilder
* @created by     Eminence digital
* @website        http://www.eminencedigital.com
*/
	
    class NotificationEmailViewModel
    {
        public $FormName;       
		public $Entries;        
		public $Email;
        
		public function __construct()
        {
            $this->Entries = array();
        }
    }
?>