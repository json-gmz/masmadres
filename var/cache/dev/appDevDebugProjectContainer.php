<?php

// This file has been auto-generated by the Symfony Dependency Injection Component for internal use.

if (\class_exists(\ContainerXa8mxii\appDevDebugProjectContainer::class, false)) {
    // no-op
} elseif (!include __DIR__.'/ContainerXa8mxii/appDevDebugProjectContainer.php') {
    touch(__DIR__.'/ContainerXa8mxii.legacy');

    return;
}

if (!\class_exists(appDevDebugProjectContainer::class, false)) {
    \class_alias(\ContainerXa8mxii\appDevDebugProjectContainer::class, appDevDebugProjectContainer::class, false);
}

return new \ContainerXa8mxii\appDevDebugProjectContainer([
    'container.build_hash' => 'Xa8mxii',
    'container.build_id' => '73cb754d',
    'container.build_time' => 1640055657,
], __DIR__.\DIRECTORY_SEPARATOR.'ContainerXa8mxii');
