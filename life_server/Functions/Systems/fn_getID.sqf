private["_id","_ret"];
_id = _this select 0;
_ret = _this select 1;
_id = owner _id;
_ret = owner _ret;

[[_id],"life_fnc_adminid",_ret,false] spawn life_fnc_MP;