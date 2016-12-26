using UnityEngine;
using UnityEditor;
using UnityEditor.Callbacks;
using UnityEditor.iOS.Xcode;
using System.IO;

public class PbxModifier
{
	[PostProcessBuild]
	public static void ChangeXcodePlist(BuildTarget buildTarget, string pathToBuiltProject)
	{
		if ( buildTarget == BuildTarget.iOS )
		{

			// PLIST: //

			// Get plist
			string plistPath = pathToBuiltProject + "/Info.plist";
			PlistDocument plist = new PlistDocument();
			plist.ReadFromString(File.ReadAllText(plistPath));

			// Get root
			PlistElementDict rootDict = plist.root;

			// Add supported devices array:

			PlistElementArray supportedDevices = rootDict.CreateArray("UISupportedExternalAccessoryProtocols");

			// Add Muse
			supportedDevices.AddString("com.interaxon.muse");
			// Add Neurosky (experimental)
			supportedDevices.AddString("com.neurosky.thinkgear");

			// Add supported background modes array:

			PlistElementArray backgroundModes = rootDict.CreateArray("UIBackgroundModes");

			// Add remote notification in background
			backgroundModes.AddString("remote-notification");

			// Add background communication with an external accessory external-accessory
			backgroundModes.AddString("external-accessory");
		
			// Enable iTunes file sharing

			rootDict.SetBoolean ("UIFileSharingEnabled", true);

			// Write to file
			File.WriteAllText(plistPath, plist.WriteToString());


			//FLAGS: //

			// Get Xcode project

			string projPath = pathToBuiltProject + "/Unity-iPhone.xcodeproj/project.pbxproj";

			PBXProject proj = new PBXProject();

			proj.ReadFromString(File.ReadAllText(projPath));

			string targetGUID = proj.TargetGuidByName("Unity-iPhone");

			// Add -ObjC linker flag

			proj.AddBuildProperty(targetGUID, "OTHER_LDFLAGS", "-ObjC"); 

			// Turn off bitcode

			proj.SetBuildProperty(targetGUID, "ENABLE_BITCODE", "false");

			// FRAMEWORKS: //

			// For Muse and Neurosky //

			// Adding External Accessory framework

			proj.AddFrameworkToProject(targetGUID, "ExternalAccessory.framework", true);

			// For Neurosky //

			// Add QuartzCore framework

			proj.AddFrameworkToProject(targetGUID, "QuartzCore.framework", true);

			// Add Accellerate framework

			proj.AddFrameworkToProject(targetGUID, "Accelerate.framework", true);

			// Write changes to Xcode Project:

			File.WriteAllText(projPath, proj.WriteToString());




		}
	}
}