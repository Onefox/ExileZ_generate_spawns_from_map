_cfgWorldName = configFile >> "CfgWorlds" >> worldName >> "Names";
_allPlaces = [];
_dump = "";
_crlf = toString [13, 10];

{
	if ( ("Default" != getMarkerColor _x)) then {
		deleteMarker _x;
	}
} forEach allMapMarkers;


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

					_pos = _positions select 0;
					_allPlaces pushBack [_pos, 35, "namecitycapital"];

					_dot = createMarker [format ["zombie_%1_%2",_pos select 0, _pos select 1], _pos];
					_dot setMarkerColor "ColorOrange";
					_dot setMarkerType "mil_dot";
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

					_pos = _positions select 0;
					_allPlaces pushBack [_pos, 15, "namecity"];

					_dot = createMarker [format ["zombie_%1_%2",_pos select 0, _pos select 1], _pos];
					_dot setMarkerColor "ColorGreen";
					_dot setMarkerType "mil_dot";
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

				_pos = _positions select 0;
				_allPlaces pushBack [_pos, 10, "namevillage"];

				_dot = createMarker [format ["zombie_%1_%2",_pos select 0, _pos select 1], _pos];
				_dot setMarkerColor "ColorBlue";
				_dot setMarkerType "mil_dot";
		};
		if (_placeType in ["namelocal"]) then {
				_allPlaces pushBack [_placePos, 3, "namelocal"];
				_dot = createMarker [format ["zombie_%1_%2",_placePos select 0, _placePos select 1], _placePos];
				_dot setMarkerColor "ColorYellow";
				_dot setMarkerType "mil_dot";
		};
	};
};



{

	_dump = _dump + format['[[%1, %2], %3, "%4"],', _x select 0 select 0, _x select 0 select 1, _x select 1, _x select 2] + _crlf;
} forEach _allPlaces;

hint format["amount of spawns %1",count _allPlaces];


_airPortPlaces = [];
{
	if ( ("Default" == getMarkerColor _x) and ("air" == markerText _x)) then {
		_pos = getMarkerPos _x;

		_dot = createMarker [format ["zombie_%1_%2",_pos select 0, _pos select 1], _pos];
		_dot setMarkerColor "ColorRed";
		_dot setMarkerType "mil_dot";
		_dump = _dump + format['[[%1, %2], %3, "airport"],', _pos select 0, _pos select 1, 15] + _crlf;
	};

	if ( "Default" == getMarkerColor _x and ("extra" == markerText _x)) then {
    		_pos = getMarkerPos _x;

	    _dot = createMarker [format ["zombie_%1_%2",_pos select 0, _pos select 1], _pos];
	    _dot setMarkerColor "ColorRed";
	    _dot setMarkerType "mil_dot";
	    _dump = _dump + format['[[%1, %2], %3, "extra"],', _pos select 0, _pos select 1, 10] + _crlf;
	};
} forEach allMapMarkers;


copyToClipboard _dump;

