package mobile.backend;

import sys.FileSystem;

#if android
import extension.androidtools.content.Permissions;
import extension.androidtools.os.Environment;
#end

class StorageSystem
{
	public static var storagePath(get, never):String;

	public static function init():Void
	{
		requestPermissions();
		createFolderIfNotExists(storagePath);
		createFolderIfNotExists(storagePath + "mods/");
		createFolderIfNotExists(storagePath + "logs/");
		createFolderIfNotExists(storagePath + "saves/");
	}

	public static function requestPermissions():Void
	{
		#if android
		if (!hasStoragePermission())
		{
			Permissions.requestPermission("android.permission.READ_EXTERNAL_STORAGE");
			Permissions.requestPermission("android.permission.WRITE_EXTERNAL_STORAGE");
			Permissions.requestPermission("android.permission.MANAGE_EXTERNAL_STORAGE");
		}
		#end
	}

	public static function hasStoragePermission():Bool
	{
		#if android
		return Permissions.checkPermission("android.permission.READ_EXTERNAL_STORAGE")
			&& Permissions.checkPermission("android.permission.WRITE_EXTERNAL_STORAGE");
		#else
		return true;
		#end
	}

	public static function createFolderIfNotExists(path:String):Void
	{
		if (!FileSystem.exists(path))
			FileSystem.createDirectory(path);
	}

	static function get_storagePath():String
	{
		#if android
		return Environment.getExternalStorageDirectory() + "/CodenameEngineLegacy/";
		#else
		return "./";
		#end
	}
}
