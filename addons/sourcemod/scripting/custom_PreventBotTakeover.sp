// List of Includes
#include <sourcemod>
#include <sdktools>

// The code formatting rules we wish to follow
#pragma semicolon 1;
#pragma newdecls required;


// The retrievable information about the plugin itself 
public Plugin myinfo =
{
	name		= "[CS:GO] Prevent Taking Over Bots",
	author		= "Manifest @Road To Glory",
	description	= "Prevents players from taking over any uncontrolled bots.",
	version		= "V. 1.0.0 [Beta]",
	url			= ""
};



//////////////////////////
// - Forwards & Hooks - //
//////////////////////////


// This happens every time a player presses a button
public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3], int &weapon)
{
	// If the client does not meet our criteria of validation then execute this section
	if(!IsValidClient(client))
	{
		return Plugin_Continue;
	}

	// If the client is alive then execute this section
	if(IsPlayerAlive(client))
	{
		return Plugin_Continue;
	}

	// If the client is not on th Terrorist or Counter-Terrorist team then execute this section
	if(GetClientTeam(client) < 2)
	{
		return Plugin_Continue;
	}

	// If the button that was pressed is the player's USE button then execute this section (Default USE button is E)
	if ((buttons & IN_USE) == IN_USE)
	{
		return Plugin_Handled;
	}

	return Plugin_Continue;
}



////////////////////////////////
// - Return Based Functions - //
////////////////////////////////


// Returns true if the client meets the validation criteria. elsewise returns false
public bool IsValidClient(int client)
{
	if (!(1 <= client <= MaxClients) || !IsClientConnected(client) || !IsClientInGame(client) || IsClientSourceTV(client) || IsClientReplay(client))
	{
		return false;
	}

	return true;
}