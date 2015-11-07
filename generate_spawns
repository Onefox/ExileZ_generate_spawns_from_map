_cfgWorldName = configFile >> "CfgWorlds" >> worldName >> "Names";
_allPlaces = [];
_dump = "";
_crlf = toString [13, 10];
for "_i" from 0 to ((count _cfgWorldName) -1) do {
	_conf = (configName (_cfgWorldName select _i));
	_placeType = toLower (getText (_cfgWorldName >> (configName (_cfgWorldName select _i)) >> "type"));
	if (_placeType in ["namecitycapital","namecity","namevillage","namelocal"]) then {
		_placePos = getArray (_cfgWorldName >> _conf >> "position");
		if (_placeType in ["namecitycapital"]) then {
			_positions = [];
			{
				_index = 0;
				while { format ["%1", _x buildingPos _index] != "[0,0,0]" } do {
					_positions = _positions + [(_x buildingPos _index)];
					_index = _index + 1;
				};
			}foreach (nearestObjects[_placePos,[], 1000]);

			for "_x" from 0 to 50 do {
					_allPlaces pushBack (_positions call BIS_fnc_selectRandom);
			};
		};

		if (_placeType in ["namecity"]) then {
			_positions = [];
			{
				_index = 0;
				while { format ["%1", _x buildingPos _index] != "[0,0,0]" } do {
					_positions = _positions + [(_x buildingPos _index)];
					_index = _index + 1;
				};
			}foreach (nearestObjects[_placePos,[], 800]);

			for "_x" from 0 to 25 do {
					_allPlaces pushBack (_positions call BIS_fnc_selectRandom);
			};
		};
		if (_placeType in ["namevillage"]) then {
			_positions = [];
			{
				_index = 0;
				while { format ["%1", _x buildingPos _index] != "[0,0,0]" } do {
					_positions = _positions + [(_x buildingPos _index)];
					_index = _index + 1;
				};
			}foreach (nearestObjects[_placePos,[], 500]);

			for "_x" from 0 to 15 do {
				_allPlaces pushBack (_positions call BIS_fnc_selectRandom);
			};
		};
		if (_placeType in ["namelocal"]) then {
				_allPlaces pushBack _placePos;
		};
	};
};



{

	_dump = _dump + format["[%1, %2],", _x select 0, _x select 1] + _crlf;
	systemChat format["x: %1", _x select 0];
} forEach _allPlaces;

copyToClipboard _dump;

systemChat format["amount: %1", count _allPlaces];
