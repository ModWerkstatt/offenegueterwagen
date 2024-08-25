function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "deutschland", "germany", "db", "waggon", "goods", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

        params = {
			{
				key = "efake",
				name = _("Fake_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_desc"),
				defaultIndex = 0,
			},			
			{
				key = "soundCheckE",
				name = _("sound_check"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },	
				tooltip = _("option_sound_check"),			
				defaultIndex = 1,	
			},
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["-t058_DBAG_fake.mdl"] = true,
			["-t058_vr_DBAG_fake.mdl"] = true,
			["052_db_fake.mdl"] = true,
			["052_db_container_fake.mdl"] = true,
            ["052X_braun_DBAG_fake.mdl"] = true,
            ["052X_braun_DBAG_container_fake.mdl"] = true,
            ["052X_buehne_DBAG_fake.mdl"] = true,
            ["052X_buehne_braun_DBAG_fake.mdl"] = true,
			["052X_DBAG_fake.mdl"] = true,
			["052X_DBAG_container_fake.mdl"] = true,
			["052X_DBCargo_fake.mdl"] = true,
			["055X_DBCargo_fake.mdl"] = true,
			["059X_DBAG_fake.mdl"] = true,
			["059X_DBAG_container_fake.mdl"] = true,
			["054X_DBAG_fake.mdl"] = true,
			["054X_VTG_fake.mdl"] = true,
			["066_DR_fake.mdl"] = true,
			["066_DBAG_fake.mdl"] = true,
			["066X_DBAG_fake.mdl"] = true,
			["066X_vr_DBAG_fake.mdl"] = true,
			["106_Holz_DB_fake.mdl"] = true,
			["106_DBAG_fake.mdl"] = true,    
			["106_vr_DBAG_fake.mdl"] = true,
			["075_Schenker_fake.mdl"] = true,
			
			["075_Schenker_geschenke_fake.mdl"] = true,
			["-t058_vr_DBAG_geschenke_fake.mdl"] = true,
			
			["025_DBAG_fake.mdl"] = true,
			["025_DR_Esu_fake.mdl"] = true,
			["025_DR_Ommu_fake.mdl"] = true,
			["026_DR_fake.mdl"] = true,
			["026_DBAG_fake.mdl"] = true,
			["027_DBAG_fake.mdl"] = true, 
			["027_DR_fake.mdl"] = true,  
			["045_DB_E035_fake.mdl"] = true,  
			["045_DB_fake.mdl"] = true,  
			["045_DB_Omm_fake.mdl"] = true,  
			["045_DBAG_fake.mdl"] = true,  
			["049_DB_E039_fake.mdl"] = true,  
			["049_DB_fake.mdl"] = true,  
			["049_DB_Omm_fake.mdl"] = true,  
			["049_DBAG_fake.mdl"] = true, 
			["050_DB_E050_fake.mdl"] = true,   
			["050_DB_fake.mdl"] = true,   
			["050_DB_Omm_fake.mdl"] = true,   
			["050_DBAG_fake.mdl"] = true,
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/ealos([^/]*.mdl)')
							or fileName:match('/eanos([^/]*.mdl)')
							or fileName:match('/eaos([^/]*.mdl)')
							or fileName:match('/eas([^/]*.mdl)')
							or fileName:match('/es([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["efake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end
		
		local function metadataHandler(fileName, data)
			if params.soundCheckE == 0 then
				if fileName:match('/vehicle/waggon/mw_e_wagen/ea([^/]*.mdl)') 
				or fileName:match('/vehicle/waggon/mw_e_wagen/fake/ea([^/]*.mdl)') 
				or fileName:match('/vehicle/waggon/mw_es_wagen/es([^/]*.mdl)') 
				or fileName:match('/vehicle/waggon/mw_es_wagen/fake/es([^/]*.mdl)') 
				then
					data.metadata.railVehicle.soundSet.name = "waggon_freight_old"
				end
			end
			return data
		end

		addModifier( "loadModel", metadataHandler )
	end
	}
end
