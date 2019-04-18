<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit84a835c41a8022d8f6c4b304849387d4
{
    public static $files = array (
        '1cfd2761b63b0a29ed23657ea394cb2d' => __DIR__ . '/..' . '/topthink/think-captcha/src/helper.php',
    );

    public static $prefixLengthsPsr4 = array (
        'z' => 
        array (
            'zhenhaihou\\' => 11,
        ),
        't' => 
        array (
            'think\\composer\\' => 15,
            'think\\captcha\\' => 14,
            'think\\auth\\' => 11,
        ),
        'a' => 
        array (
            'app\\' => 4,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'zhenhaihou\\' => 
        array (
            0 => __DIR__ . '/..' . '/zhenhaihou/think-auth/src',
        ),
        'think\\composer\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-installer/src',
        ),
        'think\\captcha\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-captcha/src',
        ),
        'think\\auth\\' => 
        array (
            0 => __DIR__ . '/..' . '/5ini99/think-auth/src',
        ),
        'app\\' => 
        array (
            0 => __DIR__ . '/../..' . '/application',
        ),
    );

    public static $prefixesPsr0 = array (
        'P' => 
        array (
            'PHPExcel' => 
            array (
                0 => __DIR__ . '/..' . '/phpoffice/phpexcel/Classes',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit84a835c41a8022d8f6c4b304849387d4::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit84a835c41a8022d8f6c4b304849387d4::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInit84a835c41a8022d8f6c4b304849387d4::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
