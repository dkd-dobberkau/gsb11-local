<?php

$config = \TYPO3\CodingStandards\CsFixerConfig::create();
$config->getFinder()
    ->exclude('Build')
    ->exclude('vendor')
    ->exclude('.build')
    ->exclude('ManualBuild')
    ->in(__DIR__ );
return $config;
