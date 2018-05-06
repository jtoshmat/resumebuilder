<?php
/**
 * FormBuilder
 * @created by     Eminence digital
 * @website        http://www.eminencedigital.com
 */    
	require_once(ABSPATH . '/lib/forms-common.php' );
    require_once(ABSPATH . '/lib/forms-form-repository.php');	
	require_once(ABSPATH . '/lib/forms-html-utils.php');
	require_once(ABSPATH . '/lib/forms-utils.php');
	require_once(ABSPATH . '/lib/forms-settings.php');
	
	$format = isset($_GET["format"]) ? strtolower($_GET["format"]) : "json";
	
	if ($format != "json" && $format != "xml"){
		$format = "json";
	}
	
	$formRepo = new FormRepository();
	$templates = $formRepo->fetchFormTemplatesForService();
    
	if($format == 'json') {
		header('Content-type: application/json');
		echo json_encode(array('templates'=>$templates));
	}
?>