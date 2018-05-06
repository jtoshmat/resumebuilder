ALTER TABLE `form` ADD `ExtendedProperties` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ;

ALTER TABLE `form_fields` ADD `ExtendedProperties` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ;

ALTER TABLE `form_field_values` ADD `IsComplete` TINYINT(1) NOT NULL ;