class "MMResources"

function MMResources:__init()
	self.LoadHandlers = {}
	self.MMResources = {}

	self.MMResources["chat"] = {}
	self.MMResources["chat"]["Partition"] = '3E6AF1E2-B10E-11DF-9395-96FA88A245BF'
	self.MMResources["chat"]["Instance"] = '78B3E33E-098B-3320-ED15-89A36F04007B'

	self.MMResources["ammobag"] = {}
	self.MMResources["ammobag"]["Partition"] = '04CD683B-1F1B-11E0-BBD1-F7235575FD24'
	self.MMResources["ammobag"]["Instance"] = '4AE515CE-846D-6070-5F56-1285B7E8E187'

	self.MMResources["medicbag"] = {}
	self.MMResources["medicbag"]["Partition"] = '1D6061B2-2234-11E0-92F5-C9B649EF6972'
	self.MMResources["medicbag"]["Instance"] = 'A867A678-615B-3FA6-7AF5-0DEE6ED69EA0'

	self.MMResources["m1911"] = {}
	self.MMResources["m1911"]["Partition"] = '944B9E9B-279F-11E0-BCCD-BF5F79C336AA'
	self.MMResources["m1911"]["Instance"] = '46557D84-5C38-6642-E71A-E2430DE0C41B'

	self.MMResources["m9"] = {}
	self.MMResources["m9"]["Partition"] = '94D0FEE8-E685-11DF-805B-F4FA4757ED08'
	self.MMResources["m9"]["Instance"] = 'A21D7964-7F3B-5D82-A414-2ABDE6644BFC'

	self.MMResources["m9ny"] = {}
	self.MMResources["m9ny"]["Partition"] = '94D0FEE8-E685-11DF-805B-F4FA4757ED08'
	self.MMResources["m9ny"]["Instance"] = '82356FE8-4061-0359-3D5B-114F424962B6'

	self.MMResources["mp412rex"] = {}
	self.MMResources["mp412rex"]["Partition"] = '2EB76B74-1F16-11E0-BE14-C6BC4F4ED27B'
	self.MMResources["mp412rex"]["Instance"] = '32CEB0E2-7D7E-7205-3DD4-BFC4AC041A92'

	self.MMResources["defibvolabel"] = {}
	self.MMResources["defibvolabel"]["Partition"] = '2C4E5C83-B1BD-11DE-96E2-89FC67A5C271'
	self.MMResources["defibvolabel"]["Instance"] = '50999073-C1D2-4240-B50F-6EC1FC45BCE8'

	self.MMResources["magnum44"] = {}
	self.MMResources["magnum44"]["Partition"] = '21E91507-2AF6-11E0-9848-9E9BC51DCED8'
	self.MMResources["magnum44"]["Instance"] = 'EAB58F8A-382F-529F-B8AA-D73E90BA15D0'
	self.MMResources["gm_magnum44"] = {}
	self.MMResources["gm_magnum44"]["Partition"] = '584C0B65-BC87-4853-AD28-7B7CEB21B336'
	self.MMResources["gm_magnum44"]["Instance"] = 'E93DB755-1B3D-4AE2-8358-1107A21DEC5A'

	self.MMResources["magnum44aim"] = {}
	self.MMResources["magnum44aim"]["Partition"] = '5DEFA236-40CF-48CF-8EA8-C1C0093F3013'
	self.MMResources["magnum44aim"]["Instance"] = '8BDECEC7-453B-4A88-87B4-A23D20C4147E'

	self.MMResources["magnum44scope"] = {}
	self.MMResources["magnum44scope"]["Partition"] = '21E91507-2AF6-11E0-9848-9E9BC51DCED8'
	self.MMResources["magnum44scope"]["Instance"] = '4F9AE8E4-7F90-4059-A3AC-6D511F77E8E3'

	self.MMResources["zoom20x"] = {}
	self.MMResources["zoom20x"]["Partition"] = '609CC1AC-4B36-4197-B1C1-2357E57CEBAF'
	self.MMResources["zoom20x"]["Instance"] = '34C9BF53-1E0C-42D3-9EC1-696421E8A420'

	self.MMResources["smaw"] = {}
	self.MMResources["smaw"]["Partition"] = 'BCE98CA0-17EC-11E0-8CD8-85483A75A7C5'
	self.MMResources["smaw"]["Instance"] = 'AB8577C5-D5F9-4A17-BEB2-2E153E171630'

	self.MMResources["smawmissile"] = {}
	self.MMResources["smawmissile"]["Partition"] = '168F529B-17F6-11E0-8CD8-85483A75A7C5'
	self.MMResources["smawmissile"]["Instance"] = '168F529C-17F6-11E0-8CD8-85483A75A7C5'

	self.MMResources["rpg7"] = {}
	self.MMResources["rpg7"]["Partition"] = 'E7F8EC1A-E8F5-11DF-AC96-84E6B0EFF32E'
	self.MMResources["rpg7"]["Instance"] = '7584D16E-6B77-4A7B-BEEE-15DA5EF98E2E'

	self.MMResources["p90"] = {}
	self.MMResources["p90"]["Partition"] = 'C75DBA86-F326-11DF-ABE6-A89858BEBE43'
	self.MMResources["p90"]["Instance"] = '25F31D4F-71A9-E349-983D-A86989548A74'
	self.MMResources["gm_p90"] = {}
	self.MMResources["gm_p90"]["Partition"] = 'C7D08BC3-04B6-440C-BF99-0E6D6A41D890'
	self.MMResources["gm_p90"]["Instance"] = '4C7904EB-0121-4BE4-B50B-D15E4505BC7E'

	self.MMResources["p90_silenced"] = {}
	self.MMResources["p90_silenced"]["Partition"] = 'C75DBA86-F326-11DF-ABE6-A89858BEBE43'
	self.MMResources["p90_silenced"]["Instance"] = 'C1CB32CD-43BF-48C8-936F-C9B904B062AF'

	self.MMResources["12gfrag"] = {}
	self.MMResources["12gfrag"]["Partition"] = '2A6FCD72-5842-41B4-AC48-56BAACA506A3'
	self.MMResources["12gfrag"]["Instance"] = 'EF265029-3291-4544-8081-ABFFA09D3D96'

	self.MMResources["c4"] = {}
	self.MMResources["c4"]["Partition"] = '90D317AC-2554-11E0-9BE1-9E3A551FF0D1'
	self.MMResources["c4"]["Instance"] = '6CF717B6-188A-4AE7-A1D2-CC1A2333C0D7'

	self.MMResources["c4exp"] = {}
	self.MMResources["c4exp"]["Partition"] = '910AD7C5-2558-11E0-96DC-FF63A5537869'
	self.MMResources["c4exp"]["Instance"] = '5FE6E2AD-072E-4722-984A-5C52BC66D4C1'

	self.MMResources["c4expentity"] = {}
	self.MMResources["c4expentity"]["Partition"] = '910AD7C5-2558-11E0-96DC-FF63A5537869'
	self.MMResources["c4expentity"]["Instance"] = '09DCA5BB-BB2E-4EC6-B07F-5F74863EB458'

	self.MMResources["m15"] = {}
	self.MMResources["m15"]["Partition"] = 'B38C8E78-EBE6-11DF-8768-F4F1C9378C27'
	self.MMResources["m15"]["Instance"] = 'D1110C87-5913-43A4-A47F-04AD47B0C611'

	self.MMResources["m15exp"] = {}
	self.MMResources["m15exp"]["Partition"] = '49F4451D-D64E-45E5-BC96-B39CE8BC4D10'
	self.MMResources["m15exp"]["Instance"] = 'EA440D5D-925C-4239-8463-4FE3EAD30C5F'

	self.MMResources["m15expentity"] = {}
	self.MMResources["m15expentity"]["Partition"] = '49F4451D-D64E-45E5-BC96-B39CE8BC4D10'
	self.MMResources["m15expentity"]["Instance"] = 'D936971A-354B-49B7-BCCA-4FE01B68D395'

	self.MMResources["bullet338"] = {}
	self.MMResources["bullet338"]["Partition"] = '2056BCC7-3769-458C-8C0E-BB6280DF360C'
	self.MMResources["bullet338"]["Instance"] = '1BF6EA67-2EFE-4B93-9558-0B3B38862E1F'

	self.MMResources["aek971"] = {}
	self.MMResources["aek971"]["Partition"] = '64DB81AD-1F08-11E0-BE14-C6BC4F4ED27B'
	self.MMResources["aek971"]["Instance"] = 'CE3372DA-991B-41C1-95BC-19B5D26AAE5B'

	self.MMResources["aek971_heavy"] = {}
	self.MMResources["aek971_heavy"]["Partition"] = '64DB81AD-1F08-11E0-BE14-C6BC4F4ED27B'
	self.MMResources["aek971_heavy"]["Instance"] = '5F2C908F-56EA-42EF-A0C8-C800A38C32E4'

	self.MMResources["aek971_silenced"] = {}
	self.MMResources["aek971_silenced"]["Partition"] = '64DB81AD-1F08-11E0-BE14-C6BC4F4ED27B'
	self.MMResources["aek971_silenced"]["Instance"] = 'D87F08AD-D44F-4C77-92F6-D67C161F8233'

	self.MMResources["rpgprojectile"] = {}
	self.MMResources["rpgprojectile"]["Partition"] = '6C857FD9-6FB3-11DE-B35E-864CF572E1C4'
	self.MMResources["rpgprojectile"]["Instance"] = 'CDD3A384-8243-A258-E23D-239CC0D52698'

	self.MMResources["towenginefx"] = {}
	self.MMResources["towenginefx"]["Partition"] = '25C535CD-2535-46B5-BF72-4E1961AFCC75'
	self.MMResources["towenginefx"]["Instance"] = '08D225DA-28C7-4E27-9A81-719FDE099893'

	self.MMResources["jackhammer"] = {}
	self.MMResources["jackhammer"]["Partition"] = '014C428F-9A3C-4EA0-9F0C-873058E72438'
	self.MMResources["jackhammer"]["Instance"] = 'C57F6902-E9BE-44B8-BCFA-9FFEB3A9A93C'
	self.MMResources["jackhammer"]["FireFunction1"] = '3D4D9FCA-FD1A-4F7D-B278-C4676ACD15DF'
	self.MMResources["jackhammer"]["FireFunction2"] = '607CF93E-0510-460C-917B-C056A8CADBBC'
	self.MMResources["jackhammer"]["FireFunction3"] = '91D7B0A3-AB80-4B91-96AC-94014C925478'
	self.MMResources["jackhammer"]["FireFunction4"] = '20B53027-2589-465A-A1DF-DA737A940DAE'

	self.MMResources["knoife"] = {}
	self.MMResources["knoife"]["Partition"] = 'B6CDC48A-3A8C-11E0-843A-AC0656909BCB'
	self.MMResources["knoife"]["Instance"] = 'F21FB5EA-D7A6-EE7E-DDA2-C776D604CD2E'

	self.MMResources["crossbolt"] = {}
	self.MMResources["crossbolt"]["Partition"] = '26076E01-A015-44A8-BFBF-695187E25FFB'
	self.MMResources["crossbolt"]["Instance"] = '81F4A9B1-0918-48EE-B097-63AA0B75F622'

	self.MMResources["crossboltsound"] = {}
	self.MMResources["crossboltsound"]["Partition"] = '591449E1-A47A-4768-A7A8-29DE293517E8'
	self.MMResources["crossboltsound"]["Instance"] = '3C39A1D9-F161-4A4B-A065-9C70D13DBB81'

	self.MMResources["crossbolt_he"] = {}
	self.MMResources["crossbolt_he"]["Partition"] = '07E407B3-A4FE-4CD1-BABA-D8F6EB59FAEA'
	self.MMResources["crossbolt_he"]["Instance"] = 'D09E04C4-4B06-4967-A7F5-1DE6D0912676'

	self.MMResources["m60"] = {}
	self.MMResources["m60"]["Partition"] = '99BD41C7-EDB0-11DF-A0C6-D95650B9E286'
	self.MMResources["m60"]["Instance"] = '1D44B441-7F16-46F3-9EFF-D0647D554EFE'

	self.MMResources["famas"] = {}
	self.MMResources["famas"]["Partition"] = '706A1BD6-6DAB-4CEE-BFCA-82814251E2D8'
	self.MMResources["famas"]["Instance"] = 'F91A9BA8-A08B-44EE-B6F3-9B181FAD71BA'

	self.MMResources["l96"] = {}
	self.MMResources["l96"]["Partition"] = '30710090-22F9-11E0-9B3A-DBCC579DBD38'
	self.MMResources["l96"]["Instance"] = '4A933C70-2E94-4FD7-B736-50A7ADD25CE5'

	self.MMResources["l96sway"] = {}
	self.MMResources["l96sway"]["Partition"] = '30710090-22F9-11E0-9B3A-DBCC579DBD38'
	self.MMResources["l96sway"]["Instance"] = '5B5B22C8-A9A4-4F1F-871D-5D6ECF438867'

	self.MMResources["sv98"] = {}
	self.MMResources["sv98"]["Partition"] = '0B551663-E80F-11DF-9138-C690837A65DF'
	self.MMResources["sv98"]["Instance"] = '3CC3FF85-FB0C-4686-8B55-949FD31A09CE'

	self.MMResources["sv98sway"] = {}
	self.MMResources["sv98sway"]["Partition"] = '0B551663-E80F-11DF-9138-C690837A65DF'
	self.MMResources["sv98sway"]["Instance"] = 'C5521CEF-6A2B-40E7-BC93-D21E8AFE7DD8'

	self.MMResources["m40a5"] = {}
	self.MMResources["m40a5"]["Partition"] = '65B7D9D8-256F-11E0-96DC-FF63A5537869'
	self.MMResources["m40a5"]["Instance"] = '4DD1F6F8-01D8-49C4-8D2B-A88BB12B52EE'

	self.MMResources["m40a5sway"] = {}
	self.MMResources["m40a5sway"]["Partition"] = '65B7D9D8-256F-11E0-96DC-FF63A5537869'
	self.MMResources["m40a5sway"]["Instance"] = '13E7EBE3-5F4E-4F99-B58E-388C87B1E857'
	
	self.MMResources["m98"] = {}
	self.MMResources["m98"]["Partition"] = '84BA0CE7-1755-11E0-B7E4-E4E608316920'
	self.MMResources["m98"]["Instance"] = '7805C312-2B2B-49C6-B1A9-F6A99863BA3E'
	
	self.MMResources["m98sway"] = {}
	self.MMResources["m98sway"]["Partition"] = '84BA0CE7-1755-11E0-B7E4-E4E608316920'
	self.MMResources["m98sway"]["Instance"] = '790C78DF-7B37-4B69-85C1-C4C932FFE324'

	self.MMResources["grenade"] = {}
	self.MMResources["grenade"]["Partition"] = 'FFF5DB09-E74B-11DF-9B5E-86394B544891'
	self.MMResources["grenade"]["Instance"] = '04E1FA90-5B6E-4316-862C-15EB89652441'

	self.MMResources["grenadeent"] = {}
	self.MMResources["grenadeent"]["Partition"] = 'CF031A0B-2492-11E0-85B7-F234A394297F'
	self.MMResources["grenadeent"]["Instance"] = '326152E6-0F84-430D-D2E3-19EBDA8266C4'

	self.MMResources["grenadeexp"] = {}
	self.MMResources["grenadeexp"]["Partition"] = 'CF031A0B-2492-11E0-85B7-F234A394297F'
	self.MMResources["grenadeexp"]["Instance"] = '0E0932A0-E8EF-4037-983B-F35A6F7FEEE5'

	self.MMResources["mp443"] = {}
	self.MMResources["mp443"]["Partition"] = '0D4646B4-F3DF-11DF-B48C-9F474D51EF2A'
	self.MMResources["mp443"]["Instance"] = '6E649856-B5B6-ACE4-9DD6-AB5FD6054ACC'
	self.MMResources["gm_mp443"] = {}
	self.MMResources["gm_mp443"]["Partition"] = 'ED5DEF93-B621-456F-8246-33BFC9E564C2'
	self.MMResources["gm_mp443"]["Instance"] = 'B41C9F21-D723-4607-B2BA-4B2C30677C51'

	self.MMResources["m93r"] = {}
	self.MMResources["m93r"]["Partition"] = '06374F08-F23B-11DF-A182-B47F2E879897'
	self.MMResources["m93r"]["Instance"] = '95EB502E-D5F7-5793-A108-5EC4E77802DA'
	self.MMResources["gm_m93r"] = {}
	self.MMResources["gm_m93r"]["Partition"] = '30870A1C-F7BE-494A-B65B-9B0EB380A93C'
	self.MMResources["gm_m93r"]["Instance"] = '08D76B3D-03BB-4B71-8BE3-406B9FDE6B4D'

	self.MMResources["m93rbullet"] = {}
	self.MMResources["m93rbullet"]["Partition"] = '091E357E-9512-4B58-BF2E-744DAF8B9ADE'
	self.MMResources["m93rbullet"]["Instance"] = '3A93E9FC-5BE9-48A2-B479-EC73FF739038'

	self.MMResources["pp19"] = {}
	self.MMResources["pp19"]["Partition"] = '983A236F-22EB-11E0-87CC-DAB15BD78BE2'
	self.MMResources["pp19"]["Instance"] = '68BC3068-5698-126B-4C51-3B30F30FEEFA'

	self.MMResources["pp19_bullet"] = {}
	self.MMResources["pp19_bullet"]["Partition"] = '034DE2CA-615D-415A-B94D-7E6BF78BF004'
	self.MMResources["pp19_bullet"]["Instance"] = '1DCD8041-89A8-439E-9914-45B5BB60578F'

	self.MMResources["spas12"] = {}
	self.MMResources["spas12"]["Partition"] = '37F8F2ED-CAC0-42E8-B77B-2300A99C3B0F'
	self.MMResources["spas12"]["Instance"] = '27C36CA8-C16D-4D2B-B3DC-73E7AF91BE85'

	self.MMResources["acwr"] = {}
	self.MMResources["acwr"]["Partition"] = 'E1DE3897-F570-11E0-B897-D25D16CBAAAF'
	self.MMResources["acwr"]["Instance"] = '80D1A454-CD95-2058-96F1-BA9AEE854748'

	self.MMResources["acwrbullets"] = {}
	self.MMResources["acwrbullets"]["Partition"] = 'E951BBE1-971B-4227-9FAE-67386CAE62FD'
	self.MMResources["acwrbullets"]["Instance"] = '69097012-1798-4A9E-904A-1E30B7113ACA'

	self.MMResources["mtar"] = {}
	self.MMResources["mtar"]["Partition"] = '057A5DF0-209C-4C31-880F-479AF453884D'
	self.MMResources["mtar"]["Instance"] = '86687168-663F-4D33-AAD6-D6C5DE5E8F34'

	self.MMResources["aug"] = {}
	self.MMResources["aug"]["Partition"] = '91978925-827B-4DA2-82C1-307ECCB7B83B'
	self.MMResources["aug"]["Instance"] = '8DF97E42-C7F1-4E4D-826E-E9B90206C16E'

	self.MMResources["augbullet"] = {}
	self.MMResources["augbullet"]["Partition"] = '9847CF94-6CC9-4500-BE0F-002E3CAA3637'
	self.MMResources["augbullet"]["Instance"] = '6C055C66-9145-4ECB-8C41-BBE1A6C91287'

	self.MMResources["scarl"] = {}
	self.MMResources["scarl"]["Partition"] = '6695DE67-4178-4EA7-95F9-9D575EF95E2A'
	self.MMResources["scarl"]["Instance"] = '13EB2C92-DC45-4049-8F74-34192ECD2BBE'

	self.MMResources["claymore"] = {}
	self.MMResources["claymore"]["Partition"] = '8709A814-1FF9-11E0-8A74-C88A4F19AAB4'
	self.MMResources["claymore"]["Instance"] = 'AA3BA4F5-2F8E-65FD-016A-D1E6F8C870FB'

	self.MMResources["claymoreexp"] = {}
	self.MMResources["claymoreexp"]["Partition"] = '8709A814-1FF9-11E0-8A74-C88A4F19AAB4'
	self.MMResources["claymoreexp"]["Instance"] = '5120E4F0-CD8C-4926-A45C-DA4460865508'

	self.MMResources["claymore_havok"] = {}
	self.MMResources["claymore_havok"]["Partition"] = '8709A814-1FF9-11E0-8A74-C88A4F19AAB4'
	self.MMResources["claymore_havok"]["Instance"] = '426247C9-56D7-FBA7-539C-F6C6BD7FD07A'

	self.MMResources["lsat"] = {}
	self.MMResources["lsat"]["Partition"] = '75E9AE70-B8B5-4A63-BDCC-AAF2914277D2'
	self.MMResources["lsat"]["Instance"] = '1153E489-7C95-402B-BB66-F38D1C830C10'

	self.MMResources["l86"] = {}
	self.MMResources["l86"]["Partition"] = '0BF57B31-9632-484F-8922-0BD476C5FF62'
	self.MMResources["l86"]["Instance"] = 'AF6D3176-1825-4EAE-9496-B4CEAC61F238'

	self.MMResources["l86bulletmod"] = {}
	self.MMResources["l86bulletmod"]["Partition"] = '0BF57B31-9632-484F-8922-0BD476C5FF62'
	self.MMResources["l86bulletmod"]["Instance"] = 'D1A33CDC-4561-450E-85B0-FF0529392515'

	self.MMResources["sniperbullet"] = {}
	self.MMResources["sniperbullet"]["Partition"] = '808A49CA-F23B-711E-D6F7-214B81DE272B'
	self.MMResources["sniperbullet"]["Instance"] = '82356FE8-4061-0359-3D5B-114F424962B6'

	self.MMResources["hk417"] = {}
	self.MMResources["hk417"]["Partition"] = 'E9658C2B-DE00-413D-B63B-BC3504652373'
	self.MMResources["hk417"]["Instance"] = '77986281-3AE9-4DE1-89F4-E128CF510199'

	self.MMResources["jng90"] = {}
	self.MMResources["jng90"]["Partition"] = '8C663DDE-525E-4A4D-8D88-7CA1970E59D7'
	self.MMResources["jng90"]["Instance"] = 'D983A8A9-A0A5-45E4-920E-6A9B14EFE7C5'

	self.MMResources["mortar"] = {}
	self.MMResources["mortar"]["Partition"] = '5350B268-18C9-11E0-B820-CD6C272E4FCC'
	self.MMResources["mortar"]["Instance"] = '145C4108-7660-1329-4599-4402DA4801A0'

	self.MMResources["mortarsound"] = {}
	self.MMResources["mortarsound"]["Partition"] = 'B49E7523-8A83-4463-828F-21938E974E4E'
	self.MMResources["mortarsound"]["Instance"] = '4612880D-428E-40DB-B1FA-C6B92CDD2CA0'

	self.MMResources["mortarexp"] = {}
	self.MMResources["mortarexp"]["Partition"] = '5350B268-18C9-11E0-B820-CD6C272E4FCC'
	self.MMResources["mortarexp"]["Instance"] = '4827959A-8A3B-4C9F-994E-E54150AA565F'

	self.MMResources["mortarexp2"] = {}
	self.MMResources["mortarexp2"]["Partition"] = '5350B268-18C9-11E0-B820-CD6C272E4FCC'
	self.MMResources["mortarexp2"]["Instance"] = 'BF5478A3-77E5-4F87-BAC7-91936CAD1C81'

	self.MMResources["40mmlvg"] = {}
	self.MMResources["40mmlvg"]["Partition"] = 'A2BD3F80-0474-11E0-8A24-DDC0A9242026'
	self.MMResources["40mmlvg"]["Instance"] = 'DCFE8B49-493D-2586-0195-BD4F35BB8197'

	self.MMResources["40mmlvgfire"] = {}
	self.MMResources["40mmlvgfire"]["Partition"] = '0782833F-E28E-417F-8D25-350D504EBEAA'
	self.MMResources["40mmlvgfire"]["Instance"] = 'B287AFC7-2597-4C5A-A2B8-D0F8D43018C4'

	self.MMResources["40mmlvgsound"] = {}
	self.MMResources["40mmlvgsound"]["Partition"] = '7188E6E0-FB93-4277-8172-2FDA87317073'
	self.MMResources["40mmlvgsound"]["Instance"] = '4C9B46AB-C0C6-48C3-A376-FB76DBF8DF7A'

	self.MMResources["40mmlvg_grenade"] = {}
	self.MMResources["40mmlvg_grenade"]["Partition"] = 'FD79A08F-F108-4751-B2C0-6C47397133B5'
	self.MMResources["40mmlvg_grenade"]["Instance"] = '393E4094-C2A2-4DF2-B977-F82E6974A8CB'

	self.MMResources["40mmlvg_grenadeexp"] = {}
	self.MMResources["40mmlvg_grenadeexp"]["Partition"] = 'FD79A08F-F108-4751-B2C0-6C47397133B5'
	self.MMResources["40mmlvg_grenadeexp"]["Instance"] = '5FE2082D-F901-43F2-A822-969CC6857134'

	self.MMResources["40mmhe_grenade"] = {}
	self.MMResources["40mmhe_grenade"]["Partition"] = 'D37476C2-3A86-11E0-BC25-D51252D5A427'
	self.MMResources["40mmhe_grenade"]["Instance"] = 'CEC6D381-72DE-B7D4-E998-0D566E0575C6'

	self.MMResources["40mmsmk_grenade"] = {}
	self.MMResources["40mmsmk_grenade"]["Partition"] = 'A3E3C07B-2E9C-42D2-B540-7E70594293EC'
	self.MMResources["40mmsmk_grenade"]["Instance"] = '30AD5145-04AD-4C97-8D1B-B4FE0E1AD6F5'

	self.MMResources["m27iar"] = {}
	self.MMResources["m27iar"]["Partition"] = 'FB9A13FB-5D10-48C7-8BD4-A97B712E2C20'
	self.MMResources["m27iar"]["Instance"] = 'D2026831-177B-404E-80F8-534C0CF9524D'

	self.MMResources["m249"] = {}
	self.MMResources["m249"]["Partition"] = 'F37DBC84-F61B-11DF-829C-95F94E7154E3'
	self.MMResources["m249"]["Instance"] = '7FCFC3D7-49C2-477E-8952-664FDA86B41E'

	self.MMResources["pkp"] = {}
	self.MMResources["pkp"]["Partition"] = 'D1DC5650-EBFE-11DF-8ACD-A1D8961E5550'
	self.MMResources["pkp"]["Instance"] = '9893EBD7-95B1-43E7-8405-86803312D998'

	self.MMResources["type88"] = {}
	self.MMResources["type88"]["Partition"] = '97F4741B-2AFA-11E0-9848-9E9BC51DCED8'
	self.MMResources["type88"]["Instance"] = '81DAF3F8-D054-4B05-8DFA-5F0F0E722A94'

	self.MMResources["m240"] = {}
	self.MMResources["m240"]["Partition"] = '5D6FD6B8-E5BC-11DF-A152-D82BD29AC2ED'
	self.MMResources["m240"]["Instance"] = '335B1E8B-8BFF-4A0B-80E7-9F55FB9C25DC'

	self.MMResources["m240_extended"] = {}
	self.MMResources["m240_extended"]["Partition"] = '5D6FD6B8-E5BC-11DF-A152-D82BD29AC2ED'
	self.MMResources["m240_extended"]["Instance"] = '87CB23D8-28DA-4151-89C8-4C4E615E16CE'

	self.MMResources["m240_swag"] = {}
	self.MMResources["m240_swag"]["Partition"] = '5D6FD6B8-E5BC-11DF-A152-D82BD29AC2ED'
	self.MMResources["m240_swag"]["Instance"] = '08D8BE73-EABA-4E16-A19A-20FE567945F2'

	self.MMResources["us_stinger"] = {}
	self.MMResources["us_stinger"]["Partition"] = '28C2561D-EC16-11DF-BA9E-F3DCE5C70CB9'
	self.MMResources["us_stinger"]["Instance"] = 'AC50A504-5962-4F7F-84F8-640BCC36F73B'

	self.MMResources["repairtool"] = {}
	self.MMResources["repairtool"]["Partition"] = '9D6458CD-2955-11E0-864C-EDEE51946146'
	self.MMResources["repairtool"]["Instance"] = '4D509E54-0572-4D7D-BF49-3D83AFCFD73D'

	self.MMResources["radiobeacon_chassis"] = {}
	self.MMResources["radiobeacon_chassis"]["Partition"] = '8887C2AE-27C6-11E0-9123-987FBA709E0E'
	self.MMResources["radiobeacon_chassis"]["Instance"] = '7748BE51-BBA1-E5C1-F911-4D417F47A31C'

	self.MMResources["tugs_vehicle"] = {}
	self.MMResources["tugs_vehicle"]["Partition"] = 'C6AC3720-4E44-11E0-B74F-973632ECCDB7'
	self.MMResources["tugs_vehicle"]["Instance"] = '6AD11C63-B795-4233-B943-C6DE347E26A7'

	self.MMResources["tugs_chassis"] = {}
	self.MMResources["tugs_chassis"]["Partition"] = 'C6AC3720-4E44-11E0-B74F-973632ECCDB7'
	self.MMResources["tugs_chassis"]["Instance"] = 'F9706033-B085-A573-1CF8-235C43B2FCAE'

	self.MMResources["eod_pda"] = {}
	self.MMResources["eod_pda"]["Partition"] = '88BAEC68-03CE-4024-A951-20DB8CB2069C'
	self.MMResources["eod_pda"]["Instance"] = '9C831110-C62C-4484-8643-359F9DFD8D05'

	self.MMResources["eod"] = {}
	self.MMResources["eod"]["Partition"] = '269BB4A2-0DC3-11E0-B817-B1885439A6BF'
	self.MMResources["eod"]["Instance"] = 'E280A780-82D0-4B1F-865D-E47865E2772C'

	self.MMResources["eod_chassis"] = {}
	self.MMResources["eod_chassis"]["Partition"] = '269BB4A2-0DC3-11E0-B817-B1885439A6BF'
	self.MMResources["eod_chassis"]["Instance"] = '9FF66CD4-2AF1-11CE-78ED-6EC576D7F93D'

	self.MMResources["mav_pda"] = {}
	self.MMResources["mav_pda"]["Partition"] = '1271F1BE-49D5-4599-AAD2-0D3BBAFB1EF7'
	self.MMResources["mav_pda"]["Instance"] = '0A6952EC-1EF1-4B3C-80DC-DEC527096066'

	self.MMResources["mav_chassis"] = {}
	self.MMResources["mav_chassis"]["Partition"] = 'FDE06FAE-1D63-11E0-8A6F-FC9481BB4D51'
	self.MMResources["mav_chassis"]["Instance"] = '53758EA5-4337-15BF-0987-2670ACE8CF01'

	self.MMResources["mav_weapon"] = {}
	self.MMResources["mav_weapon"]["Partition"] = 'CAFE2963-3F07-4254-A778-164F6772CA1E'
	self.MMResources["mav_weapon"]["Instance"] = '5938891C-0CEC-4D08-8F34-0ACBB79D4693'

	self.MMResources["mav_camera"] = {}
	self.MMResources["mav_camera"]["Partition"] = 'FDE06FAE-1D63-11E0-8A6F-FC9481BB4D51'
	self.MMResources["mav_camera"]["Instance"] = '27BE6159-8AA4-4E38-9DE8-4D1F9EE31C28'

	self.MMResources["mav_camera2"] = {}
	self.MMResources["mav_camera2"]["Partition"] = 'FDE06FAE-1D63-11E0-8A6F-FC9481BB4D51'
	self.MMResources["mav_camera2"]["Instance"] = '2965A1A1-FF5A-44ED-86DC-88F7E23E652E'

	self.MMResources["soflam_pda"] = {}
	self.MMResources["soflam_pda"]["Partition"] = '54715D36-2C3C-49A6-9F60-90FA372068C5'
	self.MMResources["soflam_pda"]["Instance"] = '69592FE0-38B2-42D2-988C-813E5185F4C3'

	self.MMResources["soflam_chassis"] = {}
	self.MMResources["soflam_chassis"]["Partition"] = '7432AA7D-1802-11E0-8BA5-9B1E2E41035E'
	self.MMResources["soflam_chassis"]["Instance"] = 'F45BD7C0-8C8F-124E-DEBA-05F1D59F908F'



	self.MMResources["40mm_smokeburst_area"] = {}
	self.MMResources["40mm_smokeburst_area"]["Partition"] = '5591B9C8-EB29-4412-BB28-DC07C351D650'
	self.MMResources["40mm_smokeburst_area"]["Instance"] = 'DA00A6AA-E396-4FDB-807D-62AC0767B6B1'

	self.MMResources["40mm_smokeburst_size"] = {}
	self.MMResources["40mm_smokeburst_size"]["Partition"] = '5591B9C8-EB29-4412-BB28-DC07C351D650'
	self.MMResources["40mm_smokeburst_size"]["Instance"] = '2CBD7863-1176-4DEF-AE04-9490E60AA876'

	self.MMResources["40mm_smokeburst_color"] = {}
	self.MMResources["40mm_smokeburst_color"]["Partition"] = '5591B9C8-EB29-4412-BB28-DC07C351D650'
	self.MMResources["40mm_smokeburst_color"]["Instance"] = '9A11CA65-907D-45F0-AFD6-00B15E22E916'

	self.MMResources["40mm_smokeburst_age"] = {}
	self.MMResources["40mm_smokeburst_age"]["Partition"] = '5591B9C8-EB29-4412-BB28-DC07C351D650'
	self.MMResources["40mm_smokeburst_age"]["Instance"] = '3FD2579E-2394-4BE4-BD6A-C69DF3696F68'



	self.MMResources["m1abrams"] = {}
	self.MMResources["m1abrams"]["Partition"] = 'B069BA89-EECF-11DD-8117-9421284A74E5'
	self.MMResources["m1abrams"]["Instance"] = 'BE4ECA89-2682-4F0B-BA0A-5CECD4D25722'

	self.MMResources["m1abramsshot"] = {}
	self.MMResources["m1abramsshot"]["Partition"] = 'D684EC68-0FE9-4DF1-A732-9279BBA202F8'
	self.MMResources["m1abramsshot"]["Instance"] = 'AB939926-0BAF-6C4F-22D8-6074F0D78EF9'

	self.MMResources["m1abramsshell"] = {}
	self.MMResources["m1abramsshell"]["Partition"] = 'D684EC68-0FE9-4DF1-A732-9279BBA202F8'
	self.MMResources["m1abramsshell"]["Instance"] = 'F8903680-77AE-4D0C-88B7-88E5407CE897'

	self.MMResources["m1abramsengine"] = {}
	self.MMResources["m1abramsengine"]["Partition"] = 'B069BA89-EECF-11DD-8117-9421284A74E5'
	self.MMResources["m1abramsengine"]["Instance"] = 'B06A08CE-EECF-11DD-8117-9421284A74E5'

	self.MMResources["m1abramswheel"] = {}
	self.MMResources["m1abramswheel"]["Partition"] = 'B069BA89-EECF-11DD-8117-9421284A74E5'
	self.MMResources["m1abramswheel"]["Instance"] = 'B06A08B3-EECF-11DD-8117-9421284A74E5'

	self.MMResources["mbtcannon"] = {}
	self.MMResources["mbtcannon"]["Partition"] = 'B069BA89-EECF-11DD-8117-9421284A74E5'
	self.MMResources["mbtcannon"]["Instance"] = 'B06A0931-EECF-11DD-8117-9421284A74E5'

	self.MMResources["t90shell"] = {}
	self.MMResources["t90shell"]["Partition"] = 'E25400E3-4E66-31A4-D991-6E56084F10FF'
	self.MMResources["t90shell"]["Instance"] = '36F86B49-A702-ED77-ACEC-015732F289E6'

	self.MMResources["t90shot"] = {}
	self.MMResources["t90shot"]["Partition"] = 'E25400E3-4E66-31A4-D991-6E56084F10FF'
	self.MMResources["t90shot"]["Instance"] = 'AB939926-0BAF-6C4F-22D8-6074F0D78EF9'

	self.MMResources["t90impact"] = {}
	self.MMResources["t90impact"]["Partition"] = 'E25400E3-4E66-31A4-D991-6E56084F10FF'
	self.MMResources["t90impact"]["Instance"] = '9B15C366-BBB8-B65C-6AEE-62C5F5703271'

	self.MMResources["t90impactsplash"] = {}
	self.MMResources["t90impactsplash"]["Partition"] = 'E25400E3-4E66-31A4-D991-6E56084F10FF'
	self.MMResources["t90impactsplash"]["Instance"] = 'CE7AC4AB-83B2-188B-3BAB-3F035BA5857A'

	self.MMResources["humvee"] = {}
	self.MMResources["humvee"]["Partition"] = '611F48A3-0919-11E0-985D-C512734E48AF'
	self.MMResources["humvee"]["Instance"] = '34ADD228-7E03-C4A4-665F-E0F0955098EE'

	self.MMResources["humveeengine"] = {}
	self.MMResources["humveeengine"]["Partition"] = '611F48A3-0919-11E0-985D-C512734E48AF'
	self.MMResources["humveeengine"]["Instance"] = '7ED9EDBE-034C-4CEE-9BA0-EFAB0698E167'

	self.MMResources["humveehorn"] = {}
	self.MMResources["humveehorn"]["Partition"] = '611F48A3-0919-11E0-985D-C512734E48AF'
	self.MMResources["humveehorn"]["Instance"] = 'EEC68041-9AF5-497B-94C4-B576D8A033C0'

	self.MMResources["growlerengine"] = {}
	self.MMResources["growlerengine"]["Partition"] = 'CF5166FD-6B60-11E0-8ACE-C75FA07B1C42'
	self.MMResources["growlerengine"]["Instance"] = 'FCE0343A-4366-4C12-A139-381585552777'

	self.MMResources["growlerhorn"] = {}
	self.MMResources["growlerhorn"]["Partition"] = 'CF5166FD-6B60-11E0-8ACE-C75FA07B1C42'
	self.MMResources["growlerhorn"]["Instance"] = '4C6B9387-C2FC-40BA-BDC0-E79B70A817BB'

	self.MMResources["growlerwheelsfront"] = {}
	self.MMResources["growlerwheelsfront"]["Partition"] = 'CF5166FD-6B60-11E0-8ACE-C75FA07B1C42'
	self.MMResources["growlerwheelsfront"]["Instance"] = '1564DF08-243A-488A-8C01-8D63CA647FED'

	self.MMResources["growlerwheelsback"] = {}
	self.MMResources["growlerwheelsback"]["Partition"] = 'CF5166FD-6B60-11E0-8ACE-C75FA07B1C42'
	self.MMResources["growlerwheelsback"]["Instance"] = '1460C730-CB73-4BD4-B558-C1F1D4FE5C01'

	self.MMResources["m1128engine"] = {}
	self.MMResources["m1128engine"]["Partition"] = '3EE37540-9833-11E1-A26B-A2AC6EC60B20'
	self.MMResources["m1128engine"]["Instance"] = 'FD6D9474-0F4E-483A-943D-16C6FF949545'

	self.MMResources["ah6engine"] = {}
	self.MMResources["ah6engine"]["Partition"] = 'FD8AB747-FF4D-11DD-A7B1-F7C6DEEC9D32'
	self.MMResources["ah6engine"]["Instance"] = '15AB2B27-FF4E-11DD-A7B1-F7C6DEEC9D32'

	self.MMResources["ah6rotors"] = {}
	self.MMResources["ah6rotors"]["Partition"] = 'FD8AB747-FF4D-11DD-A7B1-F7C6DEEC9D32'
	self.MMResources["ah6rotors"]["Instance"] = '15AB2B28-FF4E-11DD-A7B1-F7C6DEEC9D32'

	self.MMResources["z11wengine"] = {}
	self.MMResources["z11wengine"]["Partition"] = 'D78088E5-38B7-11DE-BF1C-984D9AEE762C'
	self.MMResources["z11wengine"]["Instance"] = 'D780B01D-38B7-11DE-BF1C-984D9AEE762C'

	self.MMResources["z11wrotors"] = {}
	self.MMResources["z11wrotors"]["Partition"] = 'D78088E5-38B7-11DE-BF1C-984D9AEE762C'
	self.MMResources["z11wrotors"]["Instance"] = 'D780B01E-38B7-11DE-BF1C-984D9AEE762C'

	self.MMResources["venomengine"] = {}
	self.MMResources["venomengine"]["Partition"] = '97945D87-011D-11E0-B97C-FC495C335A52'
	self.MMResources["venomengine"]["Instance"] = '2B590EC0-F63D-482F-B210-0C707C9B71DB'

	self.MMResources["venomrotors"] = {}
	self.MMResources["venomrotors"]["Partition"] = '97945D87-011D-11E0-B97C-FC495C335A52'
	self.MMResources["venomrotors"]["Instance"] = 'CBA6B1C2-5690-4F23-9F2B-C24FB9C4958B'

	self.MMResources["tunguskacannon"] = {}
	self.MMResources["tunguskacannon"]["Partition"] = '22D80A30-0A76-176C-C559-6E71C4F17915'
	self.MMResources["tunguskacannon"]["Instance"] = '5ED03B20-CEE4-52F7-6C9B-DDE56DE6F800'

	self.MMResources["tunguskabullets"] = {}
	self.MMResources["tunguskabullets"]["Partition"] = '22D80A30-0A76-176C-C559-6E71C4F17915'
	self.MMResources["tunguskabullets"]["Instance"] = '78DE0889-A11A-7660-A607-BB57A2995BA3'

	self.MMResources["vdvmg"] = {}
	self.MMResources["vdvmg"]["Partition"] = '2EA804A7-8232-11E0-823A-BD52CA6DC6B3'
	self.MMResources["vdvmg"]["Instance"] = '1E362E5E-3605-4A49-9207-BA3F403BE506'

	self.MMResources["vdvturret"] = {}
	self.MMResources["vdvturret"]["Partition"] = '2EA804A7-8232-11E0-823A-BD52CA6DC6B3'
	self.MMResources["vdvturret"]["Instance"] = 'DDBE49E9-86EC-471C-A53A-CE81929E0A51'

	self.MMResources["vdvturretrotate"] = {}
	self.MMResources["vdvturretrotate"]["Partition"] = '2EA804A7-8232-11E0-823A-BD52CA6DC6B3'
	self.MMResources["vdvturretrotate"]["Instance"] = '94FAA227-20B6-40B1-B0F7-28ADDCF45297'

	self.MMResources["quadbike"] = {}
	self.MMResources["quadbike"]["Partition"] = '08D3686F-A96A-11E1-9047-F3806E4ECBA6'
	self.MMResources["quadbike"]["Instance"] = '5BA1F26D-894A-BBAC-7E32-587645354615'

	self.MMResources["sprutsd"] = {}
	self.MMResources["sprutsd"]["Partition"] = 'A069F34C-3AE9-4030-8808-29882A555FA1'
	self.MMResources["sprutsd"]["Instance"] = '6ACD9A3B-FA8D-40F0-9F8A-F108EAF721F4'

	self.MMResources["sprutsdengine"] = {}
	self.MMResources["sprutsdengine"]["Partition"] = 'A069F34C-3AE9-4030-8808-29882A555FA1'
	self.MMResources["sprutsdengine"]["Instance"] = '9132543A-DAD6-408B-80A7-B6469BCB505A'



	self.MMResources["playerphys"] = {}
	self.MMResources["playerphys"]["Partition"] = '235CD1DA-8B06-4A7F-94BE-D50DA2D077CE'
	self.MMResources["playerphys"]["Instance"] = 'A10FF2AA-F3CF-416B-A79B-E8C5416A9EBC'

	self.MMResources["mpsoldier"] = {}
	self.MMResources["mpsoldier"]["Partition"] = 'F256E142-C9D8-4BFE-985B-3960B9E9D189'
	self.MMResources["mpsoldier"]["Instance"] = '1C721510-AD42-4AFD-B613-04DC37D0FC1F'

	self.MMResources["yump"] = {}
	self.MMResources["yump"]["Partition"] = '235CD1DA-8B06-4A7F-94BE-D50DA2D077CE'
	self.MMResources["yump"]["Instance"] = '3129BCFE-000E-4001-9F8F-316E5835C9FC'

	self.MMResources["pose_stand"] = {}
	self.MMResources["pose_stand"]["Partition"] = '235CD1DA-8B06-4A7F-94BE-D50DA2D077CE'
	self.MMResources["pose_stand"]["Instance"] = '69A866A2-DF7C-4BAD-B55F-99536F2551F6'

	self.MMResources["pose_standair"] = {}
	self.MMResources["pose_standair"]["Partition"] = '235CD1DA-8B06-4A7F-94BE-D50DA2D077CE'
	self.MMResources["pose_standair"]["Instance"] = 'DF7475F9-216E-48C3-AED1-5483EFA3BB15'

	self.MMResources["pose_swimming"] = {}
	self.MMResources["pose_swimming"]["Partition"] = '235CD1DA-8B06-4A7F-94BE-D50DA2D077CE'
	self.MMResources["pose_swimming"]["Instance"] = 'C3755191-6B9F-4B88-8677-59488AFC7530'

	self.MMResources["pose_climbing"] = {}
	self.MMResources["pose_climbing"]["Partition"] = '235CD1DA-8B06-4A7F-94BE-D50DA2D077CE'
	self.MMResources["pose_climbing"]["Instance"] = 'AF7A12E9-D79A-4856-8C03-3C88DF1ED8A6'

	self.MMResources["pose_chute"] = {}
	self.MMResources["pose_chute"]["Partition"] = '235CD1DA-8B06-4A7F-94BE-D50DA2D077CE'
	self.MMResources["pose_chute"]["Instance"] = 'F39A8591-BA69-4BE9-B289-B2A0B336A7EE'


	-- vehicles can be imported by supplying blueprints, entities, and logic referrences required
	self.MMResources["a10"] = {}
	self.MMResources["a10"]["Partition"] = 'D07E3830-85FD-4C0E-819E-23640D2B2ECB'
	self.MMResources["a10"]["Instance"] = '46B31051-405C-40E0-A7F0-62283823CC7C'
	self.MMResources["a10"]["Blueprints"] = {
		'CC50390A-A29A-0C75-33A0-36DEDCFD0DA8', -- A-10_THUNDERBOLT_WingTipLeft
		'B3E9860F-EE10-44F3-B4DC-5730BE251159', -- A-10_THUNDERBOLT
		'66D8092F-AAC9-CD4B-C906-D0EACBFA4CF0', -- A-10_THUNDERBOLT_WreckTail
		'3E66EB3E-6984-18D4-3AFB-F8ED7EFBEA8F', -- A-10_THUNDERBOLT_WingTipRight
		'44C82567-14E3-48DA-BB9A-104D57CA1546', -- A-10_THUNDERBOLT_WreckBody
		'FD0A16D5-E92A-C4EE-52BC-19BC622E409D' -- A-10_THUNDERBOLT_WreckFront
	}
	self.MMResources["a10"]["Entities"] = {
		'FDCA8108-7A40-11E0-AC6E-B8454A26D179', -- A-10_THUNDERBOLT_WreckTail
		'EB482D1E-7A40-11E0-AC6E-B8454A26D179', -- A-10_THUNDERBOLT_WreckBody
		'46B31051-405C-40E0-A7F0-62283823CC7C', -- A10_THUNDERBOLT
		'14E8A763-E3D0-4131-BBC3-8BD2B5581FB3', -- A10_THUNDERBOLT
		'2DCB8669-210A-4E82-AF2B-B84173CE9622', -- A10_THUNDERBOLT
		'D85CB473-7A40-11E0-AC6E-B8454A26D179', -- A-10_THUNDERBOLT_WreckFront
		'86C1CA84-3179-4FA1-9F1A-6BB13EF14FE0', -- A10_THUNDERBOLT
		'93B4369E-7B30-11E0-A197-B95FBA46DD5F', -- A-10_THUNDERBOLT_WingTipRight
		'BA5EE5A4-A1A3-4914-84FD-10D99C2685F4', -- A10_THUNDERBOLT
		'521F87C0-F67D-4DB7-82F5-9653584098F2', -- A10_THUNDERBOLT
		'7555A6CF-FB4B-4285-9D2A-FEC678F7A713', -- A10_THUNDERBOLT
		'76B634E2-7B30-11E0-A197-B95FBA46DD5F', -- A-10_THUNDERBOLT_WingTipLeft
		'2F5148E7-A5B4-4C1C-A3FE-1BE3419571EC', -- A10_THUNDERBOLT
		'C9AD39F3-8B65-47F4-AC7C-60737990B6DF' -- A10_THUNDERBOLT
	}
	self.MMResources["a10"]["LogicReferrence"] = {
		'8FBCD462-B87C-465F-91D4-658D992CC8FD', -- A10_THUNDERBOLT
		'74311DF0-1047-47DD-9920-DF09857ADD2E' -- A10_THUNDERBOLT
	}

	self.MMResources["a10_bullets"] = {}
	self.MMResources["a10_bullets"]["Partition"] = '71B9175E-431B-405F-8E7A-6CA6745BEE47'
	self.MMResources["a10_bullets"]["Instance"] = '79D9D672-27CC-433A-AB04-86B07F2F73CE'

	self.MMResources["civcar03"] = {}
	self.MMResources["civcar03"]["Partition"] = '1A52E780-FEF6-11DF-B32D-B2D8A97C362D'
	self.MMResources["civcar03"]["Instance"] = '4547A158-030C-B7B4-9043-4ADB726FAF8C'
	self.MMResources["civcar03"]["Blueprints"] = {
		'4547A158-030C-B7B4-9043-4ADB726FAF8C',
		'9A02F5D2-33F2-11DE-99D3-98DCCAF38B4D'
	}
	self.MMResources["civcar03"]["Entities"] = {'8C7B446F-8BBC-780F-F25B-4328A7BC2303'}

	self.MMResources["civcar03engine"] = {}
	self.MMResources["civcar03engine"]["Partition"] = '1A52E780-FEF6-11DF-B32D-B2D8A97C362D'
	self.MMResources["civcar03engine"]["Instance"] = '12F45D91-4D34-49C6-897F-2EB8ECA9F070'

	self.MMResources["simplecarenginesound"] = {}
	self.MMResources["simplecarenginesound"]["Partition"] = '3203023E-4A22-4B10-9698-E994174BF557'
	self.MMResources["simplecarenginesound"]["Instance"] = '509CCE6F-7363-441E-A062-71419DCFD50E'

	self.MMResources["deliveryvan"] = {}
	self.MMResources["deliveryvan"]["Partition"] = 'FF60B55F-7BEA-11E0-B9A5-818EB3538184'
	self.MMResources["deliveryvan"]["Instance"] = '74D984EC-29FD-365A-5052-41E81AFB6DEC'
	self.MMResources["deliveryvan"]["Blueprints"] = {'74D984EC-29FD-365A-5052-41E81AFB6DEC'}
	self.MMResources["deliveryvan"]["Entities"] = {'2CB916D5-51C6-18BC-7685-3E417DE1C48F'}

	-- can be guid or instance.nameSid
	-- prevents this 'vehicle' from having its properties changed
	self.SturdifyBlacklist = {
		["18178664-DDBD-55C8-8D69-3E05030CA399"] = true, -- T-UGS_Vehicle
		["3F6D23B3-9520-F810-1F95-1CE64C22B30C"] = true, -- SOFLAM
		["C6248092-D0A7-EB93-F1E4-B5405F370180"] = true, -- MAV
		["DBE1A4B1-EF7B-4F22-7737-848A88968D7F"] = true, -- RadioBeacon_Projectile
		["D9183C94-D7DC-9809-30CA-721793BB2E04"] = true, -- AGM-144_Hellfire_TV
		["CRAM"] = true,
		["Kornet"] = true,
		["TOW"] = true,
		["GUNSHIP"] = true,
	}

	-- level resources can specify what to mount and what order
	self.MMResources["Levels/MP_007/MP_007"] = {
		["Partition"] = 'CC4B754F-DC2D-11DF-B4FF-DE2D36FBFBF4',
		["Registry"] = '958A27B8-F6B4-AE8C-4AE8-1FC8E2AB60BF',
		["SuperBundles"] = {},
		["Bundles"] = {'CURRENTLEVEL'},
		["Vehicles"] = {} -- vehicles listed should be resources already registered
	}

	self.MMResources["Levels/XP3_Desert/XP3_Desert"] = {
		["Partition"] = '4CA1C116-7FA3-4163-A17E-325ACD02FD4F',
		["Registry"] = '273AC4A3-21D1-3D7E-B740-9387A30E1AF7',
		["SuperBundles"] = {
			'SPChunks',
			'Levels/MP_007/MP_007',
			'Levels/SP_Tank/SP_Tank',
			'XP3Chunks',
			'Levels/XP3_Desert/XP3_Desert'
		},
		["Bundles"] = {
			'Levels/MP_007/MP_007',
			'Levels/SP_Tank/SP_Tank',
            'Levels/SP_Tank/HighwayToTeheran_01',
            'CURRENTLEVEL',
            'Levels/XP3_Desert/RushLarge0',
		},
		["Vehicles"] = {
			'a10', 'civcar03', 'deliveryvan'
		}
	}

	self.MMResources["Levels/XP3_Shield/XP3_Shield"] = {
		["Partition"] = '69AFE35D-259F-11E1-98E7-C42BEF8FFB67',
		["Registry"] = '4396E861-4042-A682-5CD8-B00184DFECA1',
		["SuperBundles"] = {
			
		},
		["Bundles"] = {
            'CURRENTLEVEL'
		},
		["Vehicles"] = {
			
		},
		["OOB"] = {
			{["Partition"] = '877F24E5-828F-4A52-874F-939839E9EE60', ["Volume"] = 'E9ABBA54-C1EA-4D14-AC66-762DE7E846A5'},
			{["Partition"] = '877F24E5-828F-4A52-874F-939839E9EE60', ["Volume"] = 'AFC13C53-D12C-440C-A887-1240F73BE4A4'},
			{["Partition"] = '877F24E5-828F-4A52-874F-939839E9EE60', ["Volume"] = '1B360806-C46F-4786-A127-824994F6F9DF'},

		}
	}

	for resourceName, resourceData in pairs(self.MMResources) do
		self.MMResources[resourceName].Loaded = false
	end

	-- only insert supported maps
	-- quick guid to name lookup table
	self.MapLookup = {
		['CC4B754F-DC2D-11DF-B4FF-DE2D36FBFBF4'] = 'Levels/MP_007/MP_007',
		['4CA1C116-7FA3-4163-A17E-325ACD02FD4F'] = 'Levels/XP3_Desert/XP3_Desert',
		['69AFE35D-259F-11E1-98E7-C42BEF8FFB67'] = 'Levels/XP3_Shield/XP3_Shield'
	}

	self.HeliLookup = { 
		["Vehicles/AH1Z/AH1Z"] = true,
		["Vehicles/AH6/AH6_Littlebird"] = true,
		["Vehicles/KA-60_Kasatka/KA-60_Kasatka"] = true,
		["Vehicles/Mi28/Mi28"] = true,
		["Vehicles/Venom/Venom"] = true,
		["Vehicles/Z11W/Z-11w"] = true,
	}
end

function MMResources:RegisterInstanceLoadHandlers()
	for resourceName, resourceData in pairs(self.MMResources) do
		if (resourceData.Partition and resourceData.Instance) then
			ResourceManager:RegisterInstanceLoadHandler(Guid(resourceData.Partition), Guid(resourceData.Instance), function(instance)
				self:SetLoaded(resourceName, true)
				self:CallLoadHandlers()
			end)
		end
	end
end

function MMResources:Register(resourceName, partition, guid)
	self.MMResources[resourceName] = {
		Partition = partition,
		Instance = guid,
		Loaded = false
	}
end

function MMResources:AddLoadHandler(context, callback)
	table.insert(self.LoadHandlers, { Context = context, Callback = callback })
end

function MMResources:CallLoadHandlers()
	for i=1, #self.LoadHandlers do
		self.LoadHandlers[i].Callback(self.LoadHandlers[i].Context, self)
	end
end


function MMResources:IsLoaded(resourceName)
	if not self.MMResources[resourceName] then
		print("Tried to check unregistered resource: "..tostring(resourceName))
		return false
	else
		return self.MMResources[resourceName].Loaded
	end
end

function MMResources:SetLoaded(resourceName, value)
	if not self.MMResources[resourceName] then
		print("Tried to set unregistered resource: "..tostring(resourceName))
	else
		if (value) then
			dprint("Resource Loaded: "..tostring(resourceName))
		end
		self.MMResources[resourceName].Loaded = value
	end
end

function MMResources:Get(resourceName)
	if (resourceName ~= nil) then
		return self.MMResources[resourceName]
	else
		return self.MMResources
	end
end

function MMResources:GetMap(guid)
	if (guid ~= nil) then
		return self.MapLookup[guid:ToString('D')]
	else
		return self.MapLookup
	end
end

function MMResources:GetPartition(resourceName)
	return ResourceManager:FindDatabasePartition(Guid(self.MMResources[resourceName].Partition))
end

function MMResources:GetInstance(resourceName, secondaryResource)
	if (secondaryResource ~= nil) then
		return ResourceManager:FindInstanceByGuid(Guid(self.MMResources[resourceName].Partition), Guid(self.MMResources[resourceName][secondaryResource]))
	else
		return ResourceManager:FindInstanceByGuid(Guid(self.MMResources[resourceName].Partition), Guid(self.MMResources[resourceName].Instance))
	end
end

function MMResources:AddToPartition(resourceName, partition)
	if not self.MMResources[resourceName] then
		print("Tried to add unregistered resource to partition: "..tostring(resourceName))
		return
	end

    print('Adding '..resourceName..' instances to partition...')
    self.MMResources[resourceName].Register = true
	local resourceData = self.MMResources[resourceName]

	if (resourceData.Entities) then
        print("Adding Entities ["..resourceName.."]...")
        for i = 1, #resourceData.Entities do
            local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.Entities[i]))
            if (res) then
                print("["..i.."] Added: "..res.typeInfo.name)
                partition:AddInstance(res)
            else
                print("["..i.."] Failed: "..resourceData.Entities[i])
            end
        end
    end
    if (resourceData.Blueprints) then
        print("Adding Blueprints ["..resourceName.."]...")
        for i = 1, #resourceData.Blueprints do
            local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.Blueprints[i]))
            if (res) then
                print("["..i.."] Added: "..res.typeInfo.name)
                partition:AddInstance(res)
            else
                print("["..i.."] Failed: "..resourceData.Blueprints[i])
            end
        end
    end
    if (resourceData.LogicReferrence) then
        print("Adding Logic Referrences ["..resourceName.."]...")
        for i = 1, #resourceData.LogicReferrence do
            local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.LogicReferrence[i]))
            if (res) then
                print("["..i.."] Added: "..res.typeInfo.name)
                partition:AddInstance(res)
            else
                print("["..i.."] Failed: "..resourceData.LogicReferrence[i])
            end
        end
    end
end

function MMResources:CreateRegistryContainer()
	local resourceContainer = RegistryContainer()
    
    print('Creating instance registry...')
    local registrySize = 0

    for resourceName, resourceData in pairs(self.MMResources) do
    	if (resourceData.Register) then 
	        if (resourceData.Entities) then
	            print("Adding Entities ["..resourceName.."]...")
	            for i = 1, #resourceData.Entities do
	                local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.Entities[i]))
	                if (res) then
	                    print("["..i.."] Added: "..res.typeInfo.name)
	                    resourceContainer.entityRegistry:add(res)
	                    registrySize = registrySize+1
	                else
	                    print("["..i.."] Failed: "..resourceData.Entities[i])
	                end
	            end
	        end
	        if (resourceData.Blueprints) then
	            print("Adding Blueprints ["..resourceName.."]...")
	            for i = 1, #resourceData.Blueprints do
	                local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.Blueprints[i]))
	                if (res) then
	                    print("["..i.."] Added: "..res.typeInfo.name)
	                    resourceContainer.blueprintRegistry:add(res)
	                    registrySize = registrySize+1
	                else
	                    print("["..i.."] Failed: "..resourceData.Blueprints[i])
	                end
	            end
	        end
	        if (resourceData.LogicReferrence) then
	            print("Adding Logic Referrences ["..resourceName.."]...")
	            for i = 1, #resourceData.LogicReferrence do
	                local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.LogicReferrence[i]))
	                if (res) then
	                    print("["..i.."] Added: "..res.typeInfo.name)
	                    resourceContainer.referenceObjectRegistry:add(res)
	                    registrySize = registrySize+1
	                else
	                    print("["..i.."] Failed: "..resourceData.LogicReferrence[i])
	                end
	            end
	        end
	    end
    end
    if (registrySize > 0) then
    	return resourceContainer
    else
    	return
    end
end


function MMResources:IsSturdifyBlacklisted(instance)
	if (instance:Is('VehicleEntityData')) then
		local vehicleData = VehicleEntityData(instance)

		return (self.SturdifyBlacklist[instance.instanceGuid:ToString('D')] == true or vehicleData.nameSid == '' or self.SturdifyBlacklist[vehicleData.nameSid] == true)
	else
		return self.SturdifyBlacklist[instance.instanceGuid:ToString('D')] == true
	end
end

function MMResources:IsHelicopter(instance)
	local vehicleBlueprint = VehicleBlueprint(instance)
	return self.HeliLookup[vehicleBlueprint.name] == true
end

function MMResources:ScaleTransforms(transformList, scale)

	if (transformList == nil or #transformList < 1) then 
		return
	end
	if (scale == nil) then 
		scale = 1
	end

	for i=1, #transformList do

		local transform = nil

		if (transformList[i].typeInfo.name ~= 'LinearTransform' and transformList[i].transform) then 
			transform = transformList[i].transform
		else 
			transform = transformList[i]
		end

		if (transform.left == nil) then
			transform.right = transform.right * scale
		else
			transform.left.x = scale
		end

		transform.up.y = scale
		transform.forward.z = scale

		transform.trans.x = transform.trans.x * scale
		transform.trans.y = transform.trans.y * scale
		transform.trans.z = transform.trans.z * scale
	end

end

return MMResources()