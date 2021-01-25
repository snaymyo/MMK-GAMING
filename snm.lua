on = "(on)"
off = "(off)"
k1 = on
k2 = on
k3 = on
c1 = on
c2 = on
c3 = on
c4 = on
c5 = on
c6 = on
c7 = on
ww1 = on
if gg.getTargetPackage() == "com.tencent.ig"  or gg.getTargetPackage() == "com.pubg.krmobile" then
gg.clearResults()
else
gg.setVisible(false)
gg.alert("??PUBG NOT FOUND..!!??")
os.exit()
end
log = {} 
for i = 1, 40000 do 
table.insert(log, {address = 127 + i, flags = 12, values = 127}) 
end 
clock = os.clock() 
time = os.time() 
for i = 1, 6 do gg.addListItems(log) end 
if os.clock() - clock > 2 then 
gg.removeListItems(log)  
os.exit() 
end  
gg.clearList()
function split(szFullString, szSeparator)
local nFindStartIndex = 1 
local nSplitIndex = 1 
local nSplitArray = {} while true do 
local 
nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) 
if not nFindLastIndex then 
nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) 
break end 
nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) 
nFindStartIndex = nFindLastIndex + string.len(szSeparator) 
nSplitIndex = nSplitIndex + 1 end return 
nSplitArray end function 
xgxc(szpy, MS) for x = 1, #(MS) do 
xgpy = szpy + MS[x]["offset"] xglx = MS[x]["type"] 
xgsz = MS[x]["value"] 
gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) 
xgsl = xgsl + 1 end end function 
MoShinp(MoShi) 
gg.clearResults() 
gg.setRanges(MoShi[1]["memory"]) 
gg.searchNumber(MoShi[3]["value"], MoShi[3]["type"]) 
if gg.getResultCount() == 0 then 
gg.toast(MoShi[2]["name"] .. "")
else 
gg.refineNumber(MoShi[3]["value"], MoShi[3]["type"]) 
gg.refineNumber(MoShi[3]["value"], MoShi[3]["type"]) 
gg.refineNumber(MoShi[3]["value"], MoShi[3]["type"]) 
if gg.getResultCount() == 0 then 
gg.toast(MoShi[2]["name"] .. "") 
else 
sl = gg.getResults(999999) 
sz = gg.getResultCount() 
xgsl = 0 if sz > 999999 then 
sz = 999999 end for i = 1, sz do 
pdsz = true for v = 4, #(MoShi) do if 
pdsz == true then 
pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + MoShi[v]["offset"] 
pysz[1].flags = MoShi[v]["type"] 
szpy = gg.getValues(pysz) 
pdpd = MoShi[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") 
tzszpd = szpd[1] 
pyszpd = szpd[2] 
if tzszpd == pyszpd then 
pdjg = true pdsz = true else 
pdjg = false pdsz = false end end end 
if pdjg == true then 
szpy = sl[i].address xgxc(szpy, MS) 
xgjg = true end end 
if xgjg == true then 
gg.toast(MoShi[2]["name"] .. "" .. xgsl .. "") 
else 
gg.toast(MoShi[2]["name"] .. "") 
end 
end 
end 
end


function SearchWrite(Search, Write, Type)
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber(Search[1][1], Type)
    local count = gg.getResultCount()
    local result = gg.getResults(count)
    gg.clearResults()
    local data = {} 
    local base = Search[1][2] 
    
   if (count > 0) then
        for i, v in ipairs(result) do
            v.isUseful = true 
        end
        
        for k=2, #Search do
            local tmp = {}
            local offset = Search[k][2] - base 
            local num = Search[k][1] 
            
            for i, v in ipairs(result) do
                tmp[#tmp+1] = {} 
                tmp[#tmp].address = v.address + offset  
                tmp[#tmp].flags = v.flags  
            end
            
            tmp = gg.getValues(tmp) 
            
            for i, v in ipairs(tmp) do
                if ( tostring(v.value) ~= tostring(num) ) then 
                    result[i].isUseful = false 
                end
            end
        end
  
        for i, v in ipairs(result) do
            if (v.isUseful) then 
                data[#data+1] = v.address
            end
        end
     
        if (#data > 0) then
           gg.toast(""..#data.."")
           local t = {}
           local base = Search[1][2]
           for i=1, #data do
               for k, w in ipairs(Write) do
                   offset = w[2] - base
                   t[#t+1] = {}
                   t[#t].address = data[i] + offset
                   t[#t].flags = Type
                   t[#t].value = w[1]
                  
                   if (w[3] == true) then
                       local item = {}
                       item[#item+1] = t[#t]
                       item[#item].freeze = true
                       gg.addListItems(item)
                   end
                 
               end
           end
           gg.setValues(t)
       
        else
            gg.toast("", false)
            return false
        end
    else
        gg.toast("")
        return false
    end
end


local app = {}
function Assert(data)
if data == nil or data == "" or data == "nil" then
return false
else
return true
end
end
function mearrass(memory, array)
if Assert(memory) and Assert(array) then
return true
else
return false
end
end
function typetab(array, type)
local datatype = {}
for i = 1, #array do
if Assert(array[i].type) then
table.insert(datatype, i, array[i].type)
else
if Assert(type) then
table.insert(datatype, i, type)
else
return false
end
end
end
return true, datatype
end
function app.memorysearch(memory, array, type)
gg.setVisible(false)
local rx = mearrass(memory, array)
if rx then
local rx, datatype = typetab(array, type)
if rx then
if Assert(array[1].hv) then
gg.clearResults()
gg.setRanges(memory)
gg.searchNumber(array[1].lv .. "~" .. array[1].hv, datatype[1])
else
gg.clearResults()
gg.setRanges(memory)
gg.searchNumber(array[1].lv, datatype[1])
end
if gg.getResultCount() == 0 then
return false
else
local tab = {}
local data = gg.getResults(gg.getResultCount())
gg.clearResults()
for i = 1, #data do
data[i].rx = true
end
for i = 2, #array do
local t = {}
local offset = array[i].offset
for x = 1, #data do
t[#t + 1] = {}
t[#t].address = data[x].address + offset
t[#t].flags = datatype[i]
end
local t = gg.getValues(t)
for z = 1, #t do
if Assert(array[i].hv) then
if tonumber(t[z].value) < tonumber(array[i].lv) or tonumber(t[z].value) > tonumber(array[i].hv) then
data[z].rx = false
end
else
if tostring(t[z].value) ~= tostring(array[i].lv) then
data[z].rx = false
end
end
end
end
for i = 1, #data do
if data[i].rx then
tab[#tab + 1] = data[i].address
end
end
if #tab > 0 then
return true, tab
else
return false
end
end
else
print("wrong type parameter")
gg.toast("wrong type parameter")
os.exit()
end
else
print("memory or array parameter error")
gg.toast("memory or array parameter error")
os.exit()
end
end
function app.memoryread(addr, type)
local t = {}
t[1] = {}
t[1].address = addr
t[1].flags = type
if #t > 0 then
return true, gg.getValues(t)[1].value
else
return false
end
end
function app.memorywrite(addr, type, value, freeze)
local t = {}
t[1] = {}
t[1].address = addr
t[1].flags = type
t[1].value = value
if #t > 0 then
if Assert(freeze) then
t[1].freeze = freeze
--gg.setValues(t)
return gg.addListItems(t)
else
return gg.setValues(t)
end
else
return false
end
end
function edit(orig,ret)_om=orig[1].memory or orig[1][1]_ov=orig[3].value or orig[3][1]_on=orig[2].name or orig[2][1]gg.clearResults()gg.setRanges(_om)gg.searchNumber(_ov,orig[3].type or orig[3][2])sz=gg.getResultCount()if sz<1 then gg.toast(_on.."¿ªÆôÊ§°Ü")else sl=gg.getResults(720)for i=1,sz do ist=true for v=4,#orig do if ist==true and sl[i].value==_ov then cd={{}}cd[1].address=sl[i].address+(orig[v].offset or orig[v][2])cd[1].flags=orig[v].type or orig[v][3]szpy=gg.getValues(cd)cdlv=orig[v].lv or orig[v][1]cdv=szpy[1].value if cdlv==cdv then pdjg=true ist=true else pdjg=false ist=false end end end if pdjg==true then szpy=sl[i].address for x=1,#(ret)do xgpy=szpy+(ret[x].offset or ret[x][2])xglx=ret[x].type or ret[x][3]xgsz=ret[x].value or ret[x][1]xgdj=ret[x].freeze or ret[x][4]xgsj={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xgsj[1].freeze=xgdj gg.addListItems(xgsj)else gg.setValues(xgsj)end end xgjg=true end end if xgjg==true then gg.toast(_on.."³É¹¦")else gg.toast(_on.."Ê§°Ü")end end end
function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then gg.toast("ËÑË÷µ½"..#data.."ÌõÊý¾Ý") local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast("Ð¡ÄÏ"..#t.."¸ö´úÂë") gg.addListItems(t) else gg.toast("Ð¡ÄÏ", false) return false end else gg.toast("²»·¢ÏÖ´úÂë") return false end end
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "Ê§°Ü") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "Ê§°Ü") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "³É¹¦" .. xgsl .. "¸ö´úÂë") else gg.toast(qmnb[2]["name"] .. "³É¹¦") end end end end
function Fxs(Search, Write,Neicun,Mingcg,Shuzhiliang)  gg.clearResults()  gg.setRanges(Neicun)  gg.setVisible(false)  gg.searchNumber(Search[1][1], Search[1][3])  local count = gg.getResultCount()  local result = gg.getResults(count)  gg.clearResults()  local data = {}   local base = Search[1][2]    if (count > 0) then  for i, v in ipairs(result) do  v.isUseful = true  end  for k=2, #Search do  local tmp = {}  local offset = Search[k][2] - base   local num = Search[k][1]    for i, v in ipairs(result) do  tmp[#tmp+1] = {}  tmp[#tmp].address = v.address + offset  tmp[#tmp].flags = Search[k][3]  end    tmp = gg.getValues(tmp)    for i, v in ipairs(tmp) do  if ( tostring(v.value) ~= tostring(num) ) then  result[i].isUseful = false  end  end  end    for i, v in ipairs(result) do  if (v.isUseful) then  data[#data+1] = v.address  end  end  if (#data > 0) then  gg.toast(Mingcg.."ËÑË÷µ½"..#data.."ÌõÊý¾Ý")  local t = {}  local base = Search[1][2]  if Shuzhiliang == "" and Shuzhiliang > 0 and Shuzhiliang < #data then   Shuzhiliang=Shuzhiliang  else  Shuzhiliang=#data  end  for i=1, Shuzhiliang do  for k, w in ipairs(Write) do  offset = w[2] - base  t[#t+1] = {}  t[#t].address = data[i] + offset  t[#t].flags = w[3]  t[#t].value = w[1]  if (w[4] == true) then  local item = {}  item[#item+1] = t[#t]  item[#item].freeze = true  gg.addListItems(item)  end  end  end  gg.setValues(t)  gg.toast(Mingcg.."already edited"..#t.."¸ö´úÂë")     gg.addListItems(t)  else  gg.toast(Mingcg.."³É¹¦", false)  return false  end  else  gg.toast("ÕÒ·ñ´æÊ§°Ü") return false  end end  

function setvalue(address, flags, value)
  SNM("Modify address value(Address, value type, value to be modified)")
  local tt = {}
  tt[1] = {}
  tt[1].address = address
  tt[1].flags = flags
  tt[1].value = value
  gg.setValues(tt)
end--Fᴜɴᴄᴛɪᴏɴ

if gg.isPackageInstalled("com.gxlkj.tl") then
    gg.alert("Uninstall Your Decryption GG APK", "🇴 🇰") 
    os.exit()
  end
  if gg.isPackageInstalled("com.wtkc.gg") then
    gg.alert("Uninstall Your Decryption GG APK", "🇴 🇰") 
    os.exit()
  end
  if gg.isPackageInstalled("sstool.only.com.sstool") then
    gg.alert("uninstall your sstool to Run Script")
    os.exit() end
  if gg.isPackageInstalled("com.prabalgaming.logger") then
    gg.alert("uninstall your logger gg to Run Script")
    os.exit()
  end
   if gg.isPackageInstalled("app.greyshirts.sslcapture") then
    gg.alert("uninstall your packet capture app")
    os.exit()
  end
   if gg.isPackageInstalled("com.guoshi.httpcanary") then
    gg.alert("uninstall your Http Canary app")
    os.exit()
  end
   if gg.isPackageInstalled("com.minhui.networkcapture") then
    gg.alert("uninstall your Capture")
    os.exit()
  end
   if gg.isPackageInstalled("com.js.internetguard") then
    gg.alert("uninstall your capture")
    os.exit()
  end
   if gg.isPackageInstalled("com.unitedapps.netguard") then
    gg.alert("uninstall your capture")
    os.exit()
  end

Date = "2022113013:31"
date = os.date("%Y%m%d%X")
if date > Date then
gg.alert("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁   \n\n  သက်တန်းကုန်ဆုံးသွားပါပြီ  Adminထံ Date ထပ်တောင်းပါ  TELEGRAM - @DoctorMaster199", "🇴 🇰") 
return
end
gg.setVisible(false)
gg.alert("  Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
gg.toast("■□□□□□□□□□10%")
gg.sleep("150")
gg.toast("■■□□□□□□□□20%")
gg.sleep("150")
gg.toast("■■■□□□□□□□30%")
gg.sleep("150")
gg.toast("■■■■□□□□□□40%")
gg.sleep("150")
gg.toast("■■■■■□□□□□50%")
gg.sleep("150")
gg.toast("■■■■■■□□□□60%")
gg.sleep("150")
gg.toast("■■■■■■■□□□70%")
gg.sleep("150")
gg.toast("■■■■■■■■□□80%")
gg.sleep("150")
gg.toast("■■■■■■■■■□90%")
gg.sleep("150")
gg.toast("■■■■■■■■■■100%")
gg.sleep("100")
gg.toast("🆂🅽🅼 🅶🅰🅼🅸🅽🅶 🅼🆈🅰🅽🅼🅰🆁") 
gg.clearResults()
gg.setVisible(true)
function HOME()
kkk = gg.multiChoice({"🛡️ ʙʏᴘᴀss 🛡️ [ ʟᴏʙʙʏ ]      ","🏠 ᴡᴀʟʟʜᴀᴄᴋ & ᴄᴏʟᴏʀ ᴍᴇɴᴜ 🏠 [ ᴛʀᴀɪɴɪɴɢ/ɢᴀᴍᴇ ]      ","🏠  Aʟʟ ᴡᴀʟʟʜᴀᴄᴋ & ᴄᴏʟᴏʀ ᴍᴇɴᴜ 🏠 [ ᴛʀᴀɪɴɪɴɢ/ɢᴀᴍᴇ ]     " ,"🔫 Wᴇᴀᴘᴏɴ Hᴀᴄᴋ 🔫 [ ʟᴏʙʙʏ ]      ","🎯 Oᴛʜᴇʀ Hᴀᴄᴋ 🎯 [ ʟᴏʙʙʏ ]      ","📡 ᴀɴᴛᴇɴɴᴀ 📡 [ ɢᴀᴍᴇ ]      ", "🆘 REPORT CLEAR [ ɢᴀᴍᴇ ]      ","   ᴇxɪᴛ ғʀᴏᴍ sᴄʀɪᴘᴛ  "}, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
if kkk == nil then
else
if kkk[1] == true then
A()
end -- KKK
if kkk[2] == true then
B()
end -- KKK
if kkk[3] == true then
WALLhack()
end -- KKK
if kkk[4] == true then

C()
end -- KKK
if kkk[5] == true then
D()
end -- KKK
if kkk[6] == true then
E()
end -- KKK
if kkk[7] == true then
rp()
end -- KKK
if kkk[8] == true then
EXIT()
end -- KKK
end
KK = -1
end

function rp()
gg.clearResults()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("909391408;808923191::8", gg.TYPE_DWORD)
gg.getResults(999)
gg.editAll("1089886885", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("909391408", gg.TYPE_DWORD)
gg.getResults(999)
gg.editAll("1089886885", gg.TYPE_DWORD)
os.remove("/data/data/com.pubg.krmobile/app_appcache")
os.remove("/data/data/com.pubg.krmobile/app_bugly")
os.remove("/data/data/com.pubg.krmobile/app_crashrecord")
os.remove("/data/data/com.pubg.krmobile/app_databases")
os.remove("/data/data/com.pubg.krmobile/app_geolocation")
os.remove("/data/data/com.pubg.krmobile/app_tbs")
os.remove("/data/data/com.pubg.krmobile/app_textures")
os.remove("/data/data/com.pubg.krmobile/app_webview")
os.remove("/data/data/com.pubg.krmobile/app_webview_imsdk_inner_webview")
os.remove("/data/data/com.pubg.krmobile/cache")
os.remove("/data/data/com.pubg.krmobile/code_cache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/Tencent")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.pubg.krmobile/app_appcache")
  os.remove("/data/data/com.pubg.krmobile/app_bugly")
  os.remove("/data/data/com.pubg.krmobile/app_crashrecord")
  os.remove("/data/data/com.pubg.krmobile/app_databases")
  os.remove("/data/data/com.pubg.krmobile/app_geolocation")
  os.remove("/data/data/com.pubg.krmobile/app_tbs")
  os.remove("/data/data/com.pubg.krmobile/app_textures")
  os.remove("/data/data/com.pubg.krmobile/app_webview")
  os.remove("/data/data/com.pubg.krmobile/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.pubg.krmobile/cache")
  os.remove("/data/data/com.pubg.krmobile/code_cache")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/tbslog")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
  os.remove("/storage/emulated/0/tencent")
  os.remove("/storage/emulated/0/Tencent")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.vng.pubgmobile/app_appcache")
  os.remove("/data/data/com.vng.pubgmobile/app_bugly")
  os.remove("/data/data/com.vng.pubgmobile/app_crashrecord")
  os.remove("/data/data/com.vng.pubgmobile/app_databases")
  os.remove("/data/data/com.vng.pubgmobile/app_geolocation")
  os.remove("/data/data/com.vng.pubgmobile/app_tbs")
  os.remove("/data/data/com.vng.pubgmobile/app_textures")
  os.remove("/data/data/com.vng.pubgmobile/app_webview")
  os.remove("/data/data/com.vng.pubgmobile/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.vng.pubgmobile/cache")
  os.remove("/data/data/com.vng.pubgmobile/code_cache")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/tbslog")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
  os.remove("/storage/emulated/0/tencent")
  os.remove("/storage/emulated/0/Tencent")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.vng.pubgmobile/app_appcache")
  os.remove("/data/data/com.vng.pubgmobile/app_bugly")
  os.remove("/data/data/com.vng.pubgmobile/app_crashrecord")
  os.remove("/data/data/com.vng.pubgmobile/app_databases")
  os.remove("/data/data/com.vng.pubgmobile/app_geolocation")
  os.remove("/data/data/com.vng.pubgmobile/app_tbs")
  os.remove("/data/data/com.vng.pubgmobile/app_textures")
  os.remove("/data/data/com.vng.pubgmobile/app_webview")
  os.remove("/data/data/com.vng.pubgmobile/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.vng.pubgmobile/cache")
  os.remove("/data/data/com.vng.pubgmobile/code_cache")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/tbslog")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
  os.remove("/storage/emulated/0/tencent")
  os.remove("/storage/emulated/0/Tencent")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.tencent.ig/app_appcache")
  os.remove("/data/data/com.tencent.ig/app_bugly")
  os.remove("/data/data/com.tencent.ig/app_crashrecord")
  os.remove("/data/data/com.tencent.ig/app_databases")
  os.remove("/data/data/com.tencent.ig/app_geolocation")
  os.remove("/data/data/com.tencent.ig/app_tbs")
  os.remove("/data/data/com.tencent.ig/app_textures")
  os.remove("/data/data/com.tencent.ig/app_webview")
  os.remove("/data/data/com.tencent.ig/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.tencent.ig/cache")
  os.remove("/data/data/com.tencent.ig/code_cache")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
  os.remove("/storage/emulated/0/tencent")
  os.remove("/storage/emulated/0/Tencent")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
  os.remove("/storage/emulated/0/.backups")
  os.remove("/data/data/com.tencent.ig/app_appcache")
  os.remove("/data/data/com.tencent.ig/app_bugly")
  os.remove("/data/data/com.tencent.ig/app_crashrecord")
  os.remove("/data/data/com.tencent.ig/app_databases")
  os.remove("/data/data/com.tencent.ig/app_geolocation")
  os.remove("/data/data/com.tencent.ig/app_tbs")
  os.remove("/data/data/com.tencent.ig/app_textures")
  os.remove("/data/data/com.tencent.ig/app_webview")
  os.remove("/data/data/com.tencent.ig/app_webview_imsdk_inner_webview")
  os.remove("/data/data/com.tencent.ig/cache")
  os.remove("/data/data/com.tencent.ig/code_cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/Tencent")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/.backups")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.tencent.ig/app_appcache")
os.remove("/data/data/com.tencent.ig/app_bugly")
os.remove("/data/data/com.tencent.ig/app_crashrecord")
os.remove("/data/data/com.tencent.ig/cache")
os.remove("/data/data/com.tencent.ig/code_cache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.pubg.krmobile/app_appcache")
os.remove("/data/data/com.pubg.krmobile/app_bugly")
os.remove("/data/data/com.pubg.krmobile/app_crashrecord")
os.remove("/data/data/com.pubg.krmobile/cache")
os.remove("/data/data/com.pubg.krmobile/code_cache")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.vng.pubgmobile/app_appcache")
os.remove("/data/data/com.vng.pubgmobile/app_bugly")
os.remove("/data/data/com.vng.pubgmobile/app_crashrecord")
os.remove("/data/data/com.vng.pubgmobile/cache")
os.remove("/data/data/com.vng.pubgmobile/code_cache")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/cache")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.rekoo.pubgm/app_appcache")
os.remove("/data/data/com.rekoo.pubgm/app_bugly")
os.remove("/data/data/com.rekoo.pubgm/app_crashrecord")
os.remove("/data/data/com.rekoo.pubgm/cache")
os.remove("/data/data/com.rekoo.pubgm/code_cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/ca-bundle.pem")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/ProgramBinaryCache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/1375135419_47_0.13.0.11098_20190617165748_1981158817_cures.ifs.res")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir")
os.remove("/data/data/com.tencent.ig/app_appcache")
os.remove("/data/data/com.tencent.ig/app_bugly")
os.remove("/data/data/com.tencent.ig/app_crashrecord")
os.remove("/data/data/com.tencent.ig/cache")
os.remove("/data/data/com.tencent.ig/code_cache")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/MidasOverse")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/MidasOverse")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/MidasOverse")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
os.remove("/mnt/shell/0/emulated/Android/data/com.pubg.krmobile/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.pubg.krmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.tmgp.pubgmhd/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.tmgp.pubgmhd/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.tmgp.pubgmhd/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.tmgp.pubgmhd/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.tmgp.pubgmhd/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.vng.pubgmobile/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.vng.pubgmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.vng.pubgmobile/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.ig/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.igce/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.igce/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.igce/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.igce/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.igce/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.iglite/cache/GCloud.ini")
os.remove("/mnt/shell/0/emulated/Android/data/com.tencent.iglite/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.iglite/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.iglite/cache/GCloud.ini")
os.remove("/sdcard/Android/data/com.tencent.iglite/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
gg.clearResults()
gg.sleep(400)
gg.toast("■□□□□□□10%")
gg.sleep(300)
gg.toast("■■□□□□□20%")
gg.sleep(300)
gg.toast("■■■□□□□40%")
gg.sleep(300)
gg.toast("■■■■□□□60%")
gg.sleep(300)
gg.toast("■■■■■□□80%")
gg.sleep(300)
gg.toast("■■■■■■□90%")
gg.sleep(300)
gg.toast("■■■■■■■100%")
gg.sleep(500)
gg.toast("REPORTLAR ")
end

function A()
BYPASS = gg.multiChoice({"🌐 ↪Gʟᴏʙᴀʟ Bʏᴘᴀss↩","🇰🇷 ↪Kᴏʀᴇᴀɴ Bʏᴘᴀss↩","🌐 ↪Gʟᴏʙᴀʟ 🇰🇷 Kᴏʀᴇᴀɴ Bʏᴘᴀss↩"," 🔙 ʙᴀᴄᴋ _ ᴛᴏ _ ʜᴏᴍᴇ "}, nil, " ᴡᴀʟʟ ᴄᴏʟᴏᴜʀ ғᴜɴᴄᴛɪᴏɴ ")
if BYPASS == nil then
else
if BYPASS[1] == true then
GB()
end -- KKK
if BYPASS[2] == true then
KR()
end -- KKK
if BYPASS[3] == true then
BYD()
end -- KKK
if BYPASS[4] == true then
HOME()
end -- KKK
end -- KKK
KK = -1
end -- KKK

function BYD()
gg.clearResults()
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/cache')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/cache/GCloud.ini')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/ca-bundle.pem')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/ProgramBinaryCache')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_temp')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/puffer_res.eifs')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Paks/1375135419_47_0.13.0.11098_20190617165748_1981158817_cures.ifs.res')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/RoleInfo')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora')
os.remove('/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/PufferTmpDir')
os.remove('/data/data/com.tencent.ig/app_appcache')
os.remove('/data/data/com.tencent.ig/app_bugly')
os.remove('/data/data/com.tencent.ig/app_crashrecord')
os.remove('/data/data/com.tencent.ig/cache')
os.remove('/data/data/com.tencent.ig/code_cache')
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
os.remove("/storage/emulated/0/tencent")
os.remove("/storage/emulated/0/MidasOverse")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/tbslog")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations")
os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")

gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("65538~262403;67109377;67109633;67109633", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("65538~262403", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("67109633", 4)
for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("70658~590336;67109377;67109633", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("70658~590336", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("67109633", 4)
  for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("196,864 ~ 590336; 67109377; 67109633", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("196,864 ~ 590336", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("67109633", 4)
for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("65795 ~ 590336; 67109377; 67109633", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("65795 ~ 590336;", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("67109633", 4)
  for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
  
 gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("65795~590336;67109377;67109633;67109633", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("65795~590336", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("67109633", 4)
for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("135682;144387", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("135682", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("67109633", 4)
  for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
  
 gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("134658;131586", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("134658", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("67109633", 4)
for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("134914;131330", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("134914", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("67109633", 4)
  for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
  
  gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("133378;262403", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("133378", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("67109633", 4)
for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("131586;131842", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("131586", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("67109633", 4)
  for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    
   gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("132098;133635", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("132098", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("67109633", 4)
for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("13,073.3740234375", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("67109633", 4)
  for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    
   gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("2.2958874e-41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("67109633", 4)
for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("9.21956299e-41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResultsCount()
  revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("67109633", 4)
  for i, i in ipairs((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if i.flags == gg.TYPE_DWORD then
    end
  end
  gg.addListItems((gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.clearResults()
  gg.clearList()
    gg.clearResults()
  
  os.remove("/data/data/com.tencent.ig/app_crashrecord/1004")
  os.remove("/data/data/com.tencent.ig/files/__tsecache.dat")
  os.remove("/data/data/com.tencent.ig/files/AdjustAttribution")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoActivityState")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoPackageQueue")
  os.remove("/data/data/com.tencent.ig/files/apm_cc")
  os.remove("/data/data/com.tencent.ig/files/AppEventsLogger.persistedevents")
  os.remove("/data/data/com.tencent.ig/files/cache.crc.dat")
  os.remove("/data/data/com.tencent.ig/files/gcTestConfig.txt")
  os.remove("/data/data/com.tencent.ig/files/hawk_data_init")
  os.remove("/data/data/com.tencent.ig/files/local_crash_lock")
  os.remove("/data/data/com.tencent.ig/files/tersafe.update")
  os.remove("/data/data/com.tencent.ig/files/mycpuinfo")
  os.remove("/data/data/com.tencent.ig/files/tpnlcache.data")
  os.remove("/data/data/com.tencent.ig/files/tss_app_915c.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_cs_stat2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_uts_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss.i.m.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config2.xml.6dab626b")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config3.xml")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/mn_cache.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss_emu_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss.ano2.dat")
  os.remove("/storage/emulated/0/tencent/Midas/Log/com.pubg.krmobile/MidasLog.mmap")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/cacheFile.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache/GCloud.config")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/vmpcloudconfig.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/Epic Games/KeyValueStore.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate/SaveGames/JKGuestRegisterCnt.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppBaseConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AudioPluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/BuildConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/CustomDeviceList.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceProfiles.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceSwitchers.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/EditorPerProjectUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Engine.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Game.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/GameUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Hardware.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IMSDKConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Input.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/LogSuppression.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/MidasConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OBHttp.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OpenIDCommand.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/PufferDownloader.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Scalability.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/ServerSwitch.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UAE.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Updater.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserCustom.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora/dns.txt")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/CommonSaveGame_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/LeagueStatue.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/loginInfoFile.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/MailPhoneLogin.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/playerprefs.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/business_res_download_priority_table_new")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/cadge_table")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/dubber_table_ext")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/easy_buy_cfg")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_award_table")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_task_table")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/new_level_task_cover_table")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/social_authorize_config")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/upgrade_parameter")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_loglist.json")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_uuid_define.json")
  os.remove("/data/data/com.tencent.ig/app_crashrecord/1004")
  os.remove("/data/data/com.tencent.ig/files/__tsecache.dat")
  os.remove("/data/data/com.tencent.ig/files/AdjustAttribution")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoActivityState")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoPackageQueue")
  os.remove("/data/data/com.tencent.ig/files/apm_cc")
  os.remove("/data/data/com.tencent.ig/files/AppEventsLogger.persistedevents")
  os.remove("/data/data/com.tencent.ig/files/cache.crc.dat")
  os.remove("/data/data/com.tencent.ig/files/gcTestConfig.txt")
  os.remove("/data/data/com.tencent.ig/files/hawk_data_init")
  os.remove("/data/data/com.tencent.ig/files/local_crash_lock")
  os.remove("/data/data/com.tencent.ig/files/tersafe.update")
  os.remove("/data/data/com.tencent.ig/files/mycpuinfo")
  os.remove("/data/data/com.tencent.ig/files/tpnlcache.data")
  os.remove("/data/data/com.tencent.ig/files/tss_app_915c.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_cs_stat2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_uts_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss.i.m.dat")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.pubg.krmobile/cache")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/GameErrorNoRecords")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config2.xml.6dab626b")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config3.xml")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/mn_cache.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss_emu_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss.ano2.dat")
  os.remove("/storage/emulated/0/tencent/Midas/Log/com.tencent.ig/MidasLog.mmap")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/cacheFile.txt")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/cache/GCloud.config")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/vmpcloudconfig.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/Epic Games/KeyValueStore.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate/SaveGames/JKGuestRegisterCnt.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppBaseConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AudioPluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/BuildConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/CustomDeviceList.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceProfiles.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceSwitchers.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/EditorPerProjectUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Engine.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Game.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/GameUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Hardware.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IMSDKConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Input.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/LogSuppression.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/MidasConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OBHttp.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OpenIDCommand.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/PufferDownloader.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Scalability.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/ServerSwitch.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UAE.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Updater.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserCustom.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora/dns.txt")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/CommonSaveGame_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/LeagueStatue.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/loginInfoFile.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/MailPhoneLogin.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/playerprefs.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/business_res_download_priority_table_new")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/cadge_table")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/dubber_table_ext")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/easy_buy_cfg")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_award_table")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_task_table")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/new_level_task_cover_table")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/social_authorize_config")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/upgrade_parameter")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_loglist.json")
  os.remove("/storage/emulated/0/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_uuid_define.json")
  os.remove("/data/data/com.tencent.ig/app_crashrecord/1004")
  os.remove("/data/data/com.tencent.ig/files/__tsecache.dat")
  os.remove("/data/data/com.tencent.ig/files/AdjustAttribution")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoActivityState")
  os.remove("/data/data/com.tencent.ig/files/AdjustIoPackageQueue")
  os.remove("/data/data/com.tencent.ig/files/apm_cc")
  os.remove("/data/data/com.tencent.ig/files/AppEventsLogger.persistedevents")
  os.remove("/data/data/com.tencent.ig/files/cache.crc.dat")
  os.remove("/data/data/com.tencent.ig/files/gcTestConfig.txt")
  os.remove("/data/data/com.tencent.ig/files/hawk_data_init")
  os.remove("/data/data/com.tencent.ig/files/local_crash_lock")
  os.remove("/data/data/com.tencent.ig/files/tersafe.update")
  os.remove("/data/data/com.tencent.ig/files/mycpuinfo")
  os.remove("/data/data/com.tencent.ig/files/tpnlcache.data")
  os.remove("/data/data/com.tencent.ig/files/tss_app_915c.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_cs_stat2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_uts_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss.i.m.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config2.xml.6dab626b")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/config3.xml")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/mn_cache.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss_emu_c2.dat")
  os.remove("/data/data/com.tencent.ig/files/tss_tmp/tss.ano2.dat")
  os.remove("/storage/emulated/0/tencent/Midas/Log/com.rekoo.pubgm/MidasLog.mmap")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/cacheFile.txt")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/cache/GCloud.config")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/vmpcloudconfig.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/login-identifier.txt")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/Epic Games/KeyValueStore.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate/SaveGames/JKGuestRegisterCnt.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AntiCheat.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppBaseConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AppConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/AudioPluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/BuildConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/CustomDeviceList.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceProfiles.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/DeviceSwitchers.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/EditorPerProjectUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Engine.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Game.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/GameUserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Hardware.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IGH5CachePluginConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/IMSDKConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Input.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/LogSuppression.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/MidasConfig.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OBHttp.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/OpenIDCommand.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/PufferDownloader.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Scalability.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/ServerSwitch.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UAE.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/Updater.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserCustom.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/UserSettings.ini")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Pandora/dns.txt")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/CommonSaveGame_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/LeagueStatue.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/loginInfoFile.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/MailPhoneLogin.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/personalprefs_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/playerprefs.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4123188938540329.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/SaveGames/RecruitFilterSetting_4126599880770857.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/business_res_download_priority_table_new")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/cadge_table")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/dubber_table_ext")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/easy_buy_cfg")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_award_table")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/mentor_task_table")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/new_level_task_cover_table")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/social_authorize_config")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/TableDatas/upgrade_parameter")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_loglist.json")
  os.remove("/storage/emulated/0/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/UpdateInfo/apollo_uuid_define.json")
gg.toast("■■■■■■■■■■100%")
gg.alert("🛡️ KOERA Bypass Successfully🛡️", "🇴 🇰") 
end

function GB()
  gg.clearResults()
  os.remove("src/main/java/com/google/errorprone/annotations")
  os.remove("src/main/java/com/google/errorprone/annotations")
  os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
  os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("196,864;16,842,753::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  if gg.getResultCount() == 0 then
  
    gg.processKill()
    os.exit()
  else
    gg.searchNumber("196,864", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    n = gg.getResultCount()
    pg = gg.getResults(n)
    for i = 1, n do
      gg.addListItems({
        [1] = {
          address = pg[i].address + 236,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address + 232,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address + 228,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address + 340,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address + 344,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address - 314,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
    end
  end
  gg.clearList()
  gg.clearResults()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("2.2958874e-41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("9.21956299e-41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("135682;144387", gg.TYPE_DWORD)
  gg.refineNumber("135682", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("134658;131586", gg.TYPE_DWORD)
  gg.refineNumber("134658", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("133378;262403", gg.TYPE_DWORD)
  gg.refineNumber("133378", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("131842;132098", gg.TYPE_DWORD)
  gg.refineNumber("131842", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("133378;262403", gg.TYPE_DWORD)
  gg.refineNumber("133378", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.clearResults()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("13,073.3740234375", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.alert("BYPASS GLOBAL ACTIVATED")
end

function B()
WALL = gg.multiChoice({"☃️  WALLHACK 675"..ww1,"☃️ COLOR Gʀᴇᴇɴ"..c1,"☃️ COLOR BLUE "..c2,"☃️ COLOR  WHITE "..c3,"☃️ COLOR  RED "..c4,"☃️ COLOR YELLOW"..c5," 🔙 ʙᴀᴄᴋ _ ᴛᴏ _ ʜᴏᴍᴇ "}, nil, " ᴡᴀʟʟ ᴄᴏʟᴏᴜʀ ғᴜɴᴄᴛɪᴏɴ ")
if WALL == nil then
else
if WALL[1] == true then
WH1()
end -- KKK
if WALL[2] == true then
WH2()
end -- KKK
if WALL[3] == true then
blu()
end -- KKK
if WALL[4] == true then
white()
end -- KKK
if WALL[5] == true then
WH3()
end -- KKK
if WALL[6] == true then
WH4()
end -- KKK
if WALL[7] == true then
HOME()
end -- KKK
end -- KKK
KK = -1
end -- KKK

function WH1()
if ww1 == on then
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200")
  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("930")
wc1 =  gg.getResults(999)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.toast("️WALLHACK SUCCESS️")
ww1 = off
else
gg.clearResults()
gg.setValues(wc1)
gg.toast("️SUCCESS")
ww1 = on
end
end -- KKK
 -- KKK


function WH4()
if c5 == on then
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
 KCC6 = gg.getResults(10)
  gg.editAll("8199", gg.TYPE_DWORD)
gg.sleep(500)
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8201",gg.TYPE_DWORD)
KC5 = gg.getResults(25)
gg.editAll("8199", 4)
gg.clearResults()
gg.toast("️SUCCESS️")
c5 = off
else
gg.clearResults()
gg.setValues(KCC6)
gg.sleep(500)
gg.setValues(KC5)
gg.toast("️SUCCESS")
c5 = on
end
end -- KKK

function WH3()
if c4 == on then
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
KCC4 =  gg.getResults(10)
  gg.editAll("8199", gg.TYPE_DWORD)
  gg.clearResults()
gg.toast("️SUCCESS️")
gg.sleep(500)
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8201",gg.TYPE_DWORD)
KCCC4 = gg.getResults(25)
gg.editAll("8200", 4)
gg.clearResults()
gg.toast("️SUCCESS️")
c4 = off
else
gg.clearResults()
gg.setValues(KCC4)
gg.sleep(500)
gg.setValues(KCCC4)
gg.toast("️SUCCESS")
c4 = on
end
end -- KKK

function WH2()
if c1 == on then
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8201",gg.TYPE_DWORD)
KC1 = gg.getResults(16)
gg.editAll("8199", 4)
gg.clearResults()
gg.toast("️SUCCESS️")
c1 = off
else
gg.clearResults()
gg.setValues(KC1)
gg.toast("️SUCCESS")
c1 = on
end
end -- KKK


function WHV2()
if c1 == on then
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO | gg.REGION_BAD)
gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
KC1 = gg.getResults(100)
gg.editAll("8199", 4)
gg.clearResults()
gg.toast("️SUCCESS️")
c1 = off
else
gg.clearResults()
gg.setValues(KC1)
gg.toast("️SUCCESS")
c1 = on
end
end -- KKK


function WH22()
if k1 == on then
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-1331928307225851337", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineAddress("DEC", -1, gg.TYPE_QWORD, gg.SIGN_EQUAL, 0, -1, 0)
RC1 = gg.getResults(2)
gg.editAll("-1331928311210704896", gg.TYPE_QWORD)
gg.clearResults()
gg.toast("️SUCCESS")
k1 = off
else
gg.clearResults()
gg.setValues(RC1)
gg.toast("️SUCCESS")
k1 = on
end
end -- KKK

function white()
if c3 == on then
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
KCK8 =  gg.getResults(10)
  gg.editAll("8199", gg.TYPE_DWORD)
  gg.clearResults()
gg.toast("️SUCCESS️")
gg.sleep(500)
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8201",gg.TYPE_DWORD)
KC8 = gg.getResults(16)
gg.editAll("8198", 4)
gg.clearResults()
gg.toast("️SUCCESS️")
c3 = off
else
gg.clearResults()
gg.setValues(KC8)
gg.sleep(500)
gg.setValues(KCK8)
gg.toast("️SUCCESS")
c3 = on
end
end -- KKK
 -- KKK

function blu()
if c2 == on then
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
KKC3 =  gg.getResults(10)
  gg.editAll("8199", gg.TYPE_DWORD)
  gg.clearResults()
gg.toast("️SUCCESS️")
gg.sleep(500)
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8201",gg.TYPE_DWORD)
KC3 = gg.getResults(16)
gg.editAll("8196", 4)
gg.clearResults()
gg.toast("️SUCCESS️")
c2 = off
else
gg.clearResults()
gg.setValues(KC3)
gg.sleep(500)
gg.setValues(KKC3)
gg.toast("️SUCCESS")
c2 = on
end
end -- KKK


function C()
WEAPON = gg.multiChoice({"☃️ ↪Lᴇss Rᴇᴄᴏɪʟ↩"..k1,"☃️ ↪ᴴˢ↩"..k2,"☃️ ↪VIP ᴴˢ↩"..k3,"☃️ ↪IPᴀᴅ Vɪᴇᴡ↩","☃️ ↪Bʟᴀᴄᴋ Sᴋʏ↩","🐰 FADT PARACHUTE"," 🔙 ʙᴀᴄᴋ _ ᴛᴏ _ ʜᴏᴍᴇ "}, nil, " ᴡᴀʟʟ ᴄᴏʟᴏᴜʀ ғᴜɴᴄᴛɪᴏɴ ")
if WEAPON == nil then
else
if WEAPON[1] == true then
WP1()
end -- KKK
if WEAPON[2] == true then
AHSS()
end -- KKK
if WEAPON[3] == true then
MB()
end -- KKK
if WEAPON[4] == true then
WP3()
end --
if WEAPON[5] == true then
WP4()
end -- KKK
if WEAPON[6] == true then
para()
end -- KKK
if WEAPON[7] == true then
HOME()
end -- KKK
end -- KKK
KK = -1
end -- KKK

function para()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("220;178;15 ", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("220", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(300)
gg.editAll("335", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("🎉ғᴀsᴛ ᴘᴀʀᴀᴄʜᴜᴛᴇ")
end

function WP11()
if k1 == on then
gg.clearResults()
gg.setVisible(false)
gg.clearResults()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-290186560", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("BF0")
RC1 = gg.getResults(10)
gg.editAll("0", gg.TYPE_DWORD)
gg.clearResults()
gg.setVisible(false)
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-2.2673448e24;-1.36203639e28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("-1.36203639e28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
RC2 = gg.getResults(10)
gg.editAll("0", gg.TYPE_FLOAT)
gg.clearResults()
gg.setVisible(false)
gg.toast("️SUCCESS")
k1 = off
else
gg.clearResults()
gg.setValues(RC1)
gg.setValues(RC2)
gg.toast("️SUCCESS")
k1 = on
end
end -- KKK


function WP1()
if k1 == on then
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-1331928307225851337", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineAddress("DEC", -1, gg.TYPE_QWORD, gg.SIGN_EQUAL, 0, -1, 0)
RC1 = gg.getResults(2)
gg.editAll("-1331928311210704896", gg.TYPE_QWORD)
gg.clearResults()
gg.toast("️SUCCESS")
k1 = off
else
gg.clearResults()
gg.setValues(RC1)
gg.toast("️SUCCESS")
k1 = on
end
end -- KKK

function WP2()
gg.clearResults()
gg.setRanges(32)
gg.clearResults("9.20161819458;23;25;30.5", 16, false, 536870912, 0, -1)
gg.searchNumber("25;30.5", 16, false, 536870912, 0, -1)
gg.getResults(10)
gg.editAll("200", 16)
gg.clearResults()
gg.setVisible(false)
gg.toast("️SUCCESS")
end -- KKK

function WP3()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("220;178;15 ", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("220", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(300)
gg.editAll("335", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("️SUCCESS")
end -- KKK

function WP4()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3.4028235e38;0.05000000075::5", gg.TYPE_FLOAT, false)
gg.searchNumber("0.05000000075", gg.TYPE_FLOAT, false)
gg.getResults(30)
gg.editAll("100", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("️SUCCESS")
end -- KKK

function D()
OTHER = gg.multiChoice({"☃️ ↪Aʟʟ Cᴀʀ Jᴜᴍᴘ↩","☃️ ↪Mᴀɢɪᴄ Bᴜʟʟᴇᴛ↩","☃️ ↪Special Mᴀɢɪᴄ Bᴜʟʟᴇᴛ↩","☃️ ↪Nᴏ Fᴏɢ↩","☃️ ↪Nᴏ Gʀᴀss↩","☃️ ↪Sᴍᴀʟʟ Cʀᴏss Hᴀɪʀ↩","☃️ ↪Aɪᴍ Bᴏᴛ↩","☃️ ↪AWM Bʀᴜsᴛ Bᴜʟʟᴇᴛ↩"," 🔙 ʙᴀᴄᴋ _ ᴛᴏ _ ʜᴏᴍᴇ "}, nil, " ᴡᴀʟʟ ᴄᴏʟᴏᴜʀ ғᴜɴᴄᴛɪᴏɴ ")
if OTHER == nil then
else
if OTHER[1] == true then
OTH1()
end -- KKK
if OTHER[2] == true then
OTH2()
end -- KKK
if OTHER[3] == true then
MB()
end -- KKK
if OTHER[4] == true then
OTH3()
end -- KKK
if OTHER[5] == true then
OTH4()
end -- KKK
if OTHER[6] == true then
OTH5()
end -- KKK
if OTHER[7] == true then
OTH6()
end -- KKK
if OTHER[8] == true then
OTH7()
end -- KKK
if OTHER[9] == true then
HOME()
end -- KKK
end -- KKK
KK = -1
end -- KKK

function AHSS()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(100000)
gg.editAll("400", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("24;26;46.36692428589", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("24;26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(100000)
gg.editAll("-9999999", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("25;23;30.5",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("23;25;30.5",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("25;23;30.5",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("23;25;30.5",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(10)
gg.editAll("180",gg.TYPE_FLOAT)
gg.clearResults()
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
 if v.flags == gg.TYPE_FLOAT then
v.value = "200"
v.freeze = true
 end
end
gg.addListItems(t)
t = nil
gg.clearResults()
gg.alert(" AUTO HEATSHOT  ", "🇴 🇰") 
end

function MB()
gg.clearResults()gg.setRanges(gg.REGION_BAD)
gg.searchNumber("-88.66608428955;26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-466", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("-88.73961639404;28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-568", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.201618;30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("280", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | gg.REGION_CODE_APP)
gg.searchNumber("0.10000000149;64.50088500977", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("0.10000000149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(50)
gg.editAll("8", gg.TYPE_FLOAT)
gg.clearResults()
gg.clearResults()
gg.setRanges(gg.REGION_BAD)
gg.searchNumber("-88.66608428955;26:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-460", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("-88.73961639404;28:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-560", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.201618;30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("250", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | gg.REGION_CODE_APP)
gg.searchNumber("-298284466;-1.304566e23F", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("-298284466", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(99)
gg.editAll("0", gg.TYPE_DWORD)
gg.clearResults()
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("25;30.5", 16, false, 536870912, 0, -1)
gg.getResults(10)
gg.editAll("250", 16)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15;28;16;26;8;18", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(56)
gg.editAll("-1339", gg.TYPE_FLOAT)
gg.clearResults()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | gg.REGION_CODE_APP)
gg.searchNumber("0.9986295104", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("0.9986295104", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(99)
gg.editAll("1224995", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(32)
gg.clearResults("9.20161819458;23;25;30.5", 16, false, 536870912, 0, -1)
gg.searchNumber("25;30.5", 16, false, 536870912, 0, -1)
gg.getResults(10)
gg.editAll("200", 16)
gg.clearResults()
gg.alert(" MB  ", "🇴 🇰")
end

function OTH1()
gg.alert(" One Activate One Jump 🙂 ")
gg.alert()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-980.0F;4,000.0F;0.30000001192F;5.0F::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("-980.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(30)
gg.editAll("25000", gg.TYPE_FLOAT)
gg.sleep(750)
gg.editAll("-980", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("️SUCCESS")
end -- KKK

function OTH2()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.20161819458;23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("245", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("25;30.5", 16, false, 536870912, 0, -1)
gg.getResults(100)
gg.editAll("300;305", 16)
gg.clearResults()
gg.toast("️SUCCESS")
end -- KKK

function OTH3()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(":Default__ExponentialHeightFog", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(500)
gg.editAll("0", gg.TYPE_BYTE)
gg.toast("️SUCCESS")
gg.clearResults()
end -- KKK

function OTH4()
gg.clearResults()
gg.setVisible(false)
edit({{gg.REGION_CODE_APP},{"SUCCESS"},{1179403647,gg.TYPE_DWORD},{65793,4,gg.TYPE_DWORD},{2621443,16,gg.TYPE_DWORD},{52,28,gg.TYPE_DWORD},{115516964,32,gg.TYPE_DWORD}}, {{0,39165928,gg.TYPE_DWORD}})
gg.setVisible(false)
gg.clearResults()
end -- KKK

function OTH5()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("1D900A00h;012FFF1Eh:25", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.setVisible(false)
gg.refineNumber("495,979,008", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1)
gg.editAll("16", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("️SUCCESS")
end -- KKK

function OTH6()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1F;-8.6457681e12F;15F;28F;16F;26F;8F;18F:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("15.0F;28.0F;16.0F;26.0F;8.0F;18.0F:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(500)
gg.editAll("95", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | 16384)
gg.searchNumber("-1,883,348,481,058,764,210", gg.TYPE_QWORD)
gg.getResults(99)
gg.editAll("-1,883,348,485,055,444,540", gg.TYPE_QWORD)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-511703038;-336691171:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("-511703038", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-476053504", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-1903895621994000383", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("-1903895621994000382", gg.TYPE_QWORD)
gg.clearResults()
gg.setRanges(16384)
gg.searchNumber("-511703038;-336586961:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("-511703038", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll("-476053504", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(16384)
gg.searchNumber("1.6615354e35;-5.8049376e26:9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("1.6615354e35", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(6)
gg.editAll("1.6615351e35", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(16384)
gg.searchNumber("-1903895621994000383", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("-1903895621994000382", gg.TYPE_QWORD)
gg.clearResults()
gg.setRanges(16384)
gg.searchNumber("2015175168", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(6)
gg.editAll("0", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(16384)
gg.searchNumber("1.6615354e35;-5.8048945e26:9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("1.6615354e35", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(6)
gg.editAll("1.6615351e35", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("️SUCCESS")
end -- KKK



function WALLhack()
  
WALL11 = gg.multiChoice({
    "🏘💛 SNAPDRAGON 625",
    "🏘💛 SNAPDRAGON 636",
    "🏘💛 SNAPDRAGON 660",
    "🏘💛 SNAPDRAGON 665",
    "🏘💛 SNAPDRAGON 675",
    "🏘💛 SNAPDRAGON 710",
    "🏘💛 SNAPDRAGON 712",
    "🏘💛 SNAPDRAGON 720",
    "🏘💛 SNAPDRAGON 820",
    "🏘💛 SNAPDRAGON 835",
    "🏘💛 SNAPDRAGON 845",
    "🏘💛 SNAPDRAGON 855",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
    if WALL11 == nil then
  else
    if WALL11[1] == true then
      WHC625()
    end
    if WALL11[2] == true then
      WHC636()
    end
    if WALL11[3] == true then
      WHC660()
    end
    if WALL11[4] == true then
      WHC665()
    end
    if WALL11[5] == true then
      WHC675()
    end
    if WALL11[6] == true then
      WHC710()
    end
    if WALL11[7] == true then
      WHC712()
    end
    if WALL11[8] == true then
      WHC720()
    end
    if WALL11[9] == true then
      WHC820()
    end
    if WALL11[10] == true then
      WHC835()
    end
    if WALL11[11] == true then
      WHC845()
    end
    if WALL11[12] == true then
      WHC855()
    end
    if WALL11[13] == true then
      HOME()
    end
    kk = -1
  end
end

function WHC625()
  CL625 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 625",
    "🏘💛 COLOR GREEN\n╰➥ For Snapdragon 625",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 625",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 625",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL625 == nil then
  else
    if CL625[1] == true then
      C6251()
    end
    if CL625[2] == true then
      C6252()
    end
    if CL625[3] == true then
      C6253()
    end
    if CL625[4] == true then
      C6254()
    end
    if CL625[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C6251()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6252()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("768;32769;-2134900717", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("32769", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("10", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("0;32770;-2134900716", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("32770", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("5", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6253()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6254()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC636()
  CL636 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 636",
    "🏘💛 COLOR GREEN\n╰➥ For Snapdragon 636",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 636",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 636",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL636 == nil then
  else
    if CL636[1] == true then
      C6361()
    end
    if CL636[2] == true then
      C6362()
    end
    if CL636[3] == true then
      C6363()
    end
    if CL636[4] == true then
      C6364()
    end
    if CL636[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C6361()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6362()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("768;32769;-2134900717", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("32769", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("10", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("0;32770;-2134900716", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("32770", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("5", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6363()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6364()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC660()
  CL660 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 660",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 660",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 660",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 660",
    "🔙Back"
  }, nil, "🌹𝐅𝐨𝐮𝐫 𝐘𝐨𝐮𝐭𝐡𝐬 𝐎𝐅 𝐂𝐡𝐞𝐚𝐭𝐞𝐫 𝐖𝐨𝐫𝐥𝐝🌹\n●▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬●\n📲 FACEBOOK :🌹𝐅??𝐮?? 𝐘𝐨𝐮𝐭𝐡𝐬 𝐎𝐅 𝐂𝐡𝐞𝐚𝐭𝐞𝐫 𝐖𝐨𝐫𝐥𝐝🌹\n ●▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬●")
  if CL660 == nil then
  else
    if CL660[1] == true then
      C6601()
    end
    if CL660[2] == true then
      C6602()
    end
    if CL660[3] == true then
      C6603()
    end
    if CL660[4] == true then
      C6604()
    end
    if CL660[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C6601()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6602()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("768;32769;-2134900717", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("32769", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("10", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("0;32770;-2134900716", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("32770", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("5", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6603()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6604()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC665()
  CL665 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 665",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 665",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 665",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 665",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL665 == nil then
  else
    if CL665[1] == true then
      C6651()
    end
    if CL665[2] == true then
      C6652()
    end
    if CL665[3] == true then
      C6653()
    end
    if CL665[4] == true then
      C6654()
    end
    if CL665[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C6651()
  gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
gg.getResults(63825)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
gg.getResults(63825)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.setVisible(false)
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("2.0F;1.1202056e-19F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("80", gg.TYPE_FLOAT)
gg.clearResults()
gg.setVisible(false)
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("2.0F;4.53595472e-29F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("80", gg.TYPE_FLOAT)
gg.clearResults()
gg.alert("ᴡᴀʟʟʜᴀᴄᴋ sᴅ 665 ")
gg.clearResults()
gg.clearResults()
gg.searchNumber("8200;8201;8202", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(100000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("7;7;9", gg.TYPE_DWORD)
gg.clearResults()
gg.alert("ᴄᴏʟᴏʀ 665 ʏᴇʟʟᴏᴡ ")
end

function C6652()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO | gg.REGION_BAD)
gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
gg.getResults(63825)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO | gg.REGION_BAD)
gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
gg.getResults(63825)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber('8201;8202', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll('7;9', gg.TYPE_DWORD)
gg.clearResults()
gg.toast("665 GREEN BODY")
end

function C6653()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6654()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC675()
  CL675 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 675",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 675",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 675",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 675",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL675 == nil then
  else
    if CL675[1] == true then
      C6751()
    end
    if CL675[2] == true then
      C6752()
    end
    if CL675[3] == true then
      C6753()
    end
    if CL675[4] == true then
      C674()
    end
    if CL675[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C6751()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6752()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("768;32769;-2134900717", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("32769", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("10", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("0;32770;-2134900716", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("32770", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("5", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C6753()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C674()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.8948778e-40;4.7408166e21;2.0:93", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("504", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("3.37670946121;3.37548875809;2.0:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineAddress("980", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC710()
  CL710 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 710",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 710",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 710",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 710",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL710 == nil then
  else
    if CL710[1] == true then
      C7101()
    end
    if CL710[2] == true then
      C7102()
    end
    if CL710[3] == true then
      C7103()
    end
    if CL710[4] == true then
      C7104()
    end
    if CL710[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C7101()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C7102()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C7103()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133071;8200;1194380048:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("0E8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C7104()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC712()
  CL712 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 712",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 712",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 712",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 712",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL712 == nil then
  else
    if CL712[1] == true then
      C7121()
    end
    if CL712[2] == true then
      C7122()
    end
    if CL712[3] == true then
      C7123()
    end
    if CL712[4] == true then
      C7124()
    end
    if CL712[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C7121()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C7122()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C7123()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.14906474e-41;1.14920487e-41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(69)
  gg.editAll("1.14892461e-41", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C7124()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC720()
  CL720 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 720",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 720",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 720",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 720",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL720 == nil then
  else
    if CL720[1] == true then
      C7201()
    end
    if CL720[2] == true then
      C7202()
    end
    if CL720[3] == true then
      C7203()
    end
    if CL720[4] == true then
      C7204()
    end
    if CL720[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C7201()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C7202()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C7203()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.14906474e-41;1.14920487e-41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(69)
  gg.editAll("1.14892461e-41", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C7204()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC820()
  CL820 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 820",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 820",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 820",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 820",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL820 == nil then
  else
    if CL820[1] == true then
      C8201()
    end
    if CL820[2] == true then
      C8202()
    end
    if CL820[3] == true then
      C8203()
    end
    if CL820[4] == true then
      C8204()
    end
    if CL820[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C8201()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("6;7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8202()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8203()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8204()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC835()
  CL835 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 835",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 835",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 835",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 835",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL835 == nil then
  else
    if CL835[1] == true then
      C8351()
    end
    if CL835[2] == true then
      C8352()
    end
    if CL835[3] == true then
      C8353()
    end
    if CL835[4] == true then
      C8354()
    end
    if CL835[5] == true then
      HOME()
    end
    kk = -1
  end
end

function C8351()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8352()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.14906474e-41;1.14920487e-41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(69)
  gg.editAll("1.14892461e-41", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8353()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8354()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("8,200;1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(131072)
  gg.searchNumber("8,196D;8,192D;8,200D::", 4, false, 536870912, 0, -1)
  gg.searchNumber("8200", 4, false, 536870912, 0, -1)
  gg.getResults(10)
  gg.editAll("7", 4)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
  gg.setVisible(false)
end

function WHC845()
  CL845 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ for Snapdragon 845",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 845",
    "🏘💛 COLOR RED YELLOW BODY\n╰➥ For Snapdragon 845",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 845",
    "🏘💛 COLOR BLUE BODY\n╰➥ For Snapdragon 845",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL845 == nil then
  else
    if CL845[1] == true then
      C8451()
    end
    if CL845[2] == true then
      C8452()
    end
    if CL845[3] == true then
      C8453()
    end
    if CL845[4] == true then
      C8454()
    end
    if CL845[5] == true then
      C8455()
    end
    if CL845[6] == true then
      HOME()
    end
    kk = -1
  end
end

function C8451()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("6;7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8452()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8453()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("1.14906474e-41;1.14920487e-41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(69)
  gg.editAll("1.14892461e-41", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8454()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8455()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("1,194,344,481;8,201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("8199", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function WHC855()
  CL855 = gg.multiChoice({
    "🏘💛 COLOR YELLOW BODY\n╰➥ For Snapdragon 855",
    "🏘💛 COLOR GRENN BODY\n╰➥ For Snapdragon 855",
    "🏘💛 COLOR GREEN YELLOW\n╰➥ for Snapdragon 855",
    "🏘💛 COLOR RED BODY\n╰➥ For Snapdragon 855",
    "🏘💛 COLOR BLUE BODY\n╰➥ For Snapdragon 855",
    "🔙Back"
  }, nil, "Sɴᴍ Gᴀᴍɪɴɢ \n\n sᴄʀɪᴘᴛ : Sᴀɪ Nᴀʏ Mʏᴏ \n 💻𝙵𝙰𝙲𝙴𝙱𝙾𝙾𝙺 - https://t.me/DoctorMaster199",  "🅽🅴🆇🆃")
  if CL855 == nil then
  else
    if CL855[1] == true then
      C8551()
    end
    if CL855[2] == true then
      C8552()
    end
    if CL855[3] == true then
      C8553()
    end
    if CL855[4] == true then
      C8554()
    end
    if CL855[5] == true then
      C8555()
    end
    if CL855[6] == true then
      HOME()
    end
    kk = -1
  end
end

function C8551()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("6;7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8552()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.setRanges(gg.REGION_VIDEO)
  gg.searchNumber("8200;8201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("100", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(550292)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.toast("ACTIVE ✓")
end

function C8553()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.setRanges(gg.REGION_VIDEO)
  gg.searchNumber("8200;8201:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("100", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(550292)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8200;8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("6;7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8554()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.searchNumber("1,194,344,481;8,201:5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(15)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end

function C8555()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("5.1097599e21;8.2676609e-44;2.0:13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("200", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("2.0;0.69314718246;0.00999999978:29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineAddress("9B0", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(63825)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Loading..")
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("537133066;8200;1194344459;8201:13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.refineNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(63825)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ACTIVE ✓")
end


function KR()

gg.clearResults()
  os.remove("src/main/java/com/google/errorprone/annotations")
  os.remove("src/main/java/com/google/errorprone/annotations")
  os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
  os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("196,864;16,842,753::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  if gg.getResultCount() == 0 then
    gg.processKill()
    os.exit()
  else
    gg.searchNumber("196,864", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    n = gg.getResultCount()
    pg = gg.getResults(n)
    for i = 1, n do
      gg.addListItems({
        [1] = {
          address = pg[i].address + 236,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address + 232,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address + 228,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address + 340,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address + 344,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
      gg.addListItems({
        [1] = {
          address = pg[i].address - 314,
          flags = 4,
          freeze = true,
          value = 67109633
        }
      })
    end
  end
  gg.clearList()
  gg.clearResults()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("2.2958874e-41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("9.21956299e-41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("135682;144387", gg.TYPE_DWORD)
  gg.refineNumber("135682", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("134658;131586", gg.TYPE_DWORD)
  gg.refineNumber("134658", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("133378;262403", gg.TYPE_DWORD)
  gg.refineNumber("133378", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("131842;132098", gg.TYPE_DWORD)
  gg.refineNumber("131842", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("133378;262403", gg.TYPE_DWORD)
  gg.refineNumber("133378", gg.TYPE_DWORD)
  gg.getResults(50000)
  gg.clearResults()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("13,073.3740234375", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50000)
  gg.editAll("67109633", gg.TYPE_FLOAT)
  gg.clearResults()
 gg.alert("BYPASS KOREA ACTIVATED")
end

function OTH7()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setRanges("91, 000.0;2.29999995232;1.79999995232:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("2.29999995232;1.79999995232:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(15)
gg.editAll("0", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("")
end -- KKK

function E()
gg.setVisible(false)
  gg.clearResults()
  gg.setVisible(false)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("88.50576019287F;87.27782440186F;-100.91194152832F;1F::13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("88.50576019287F;87.27782440186F;1F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("1.86875;1.86875;999;1.86875;1.86875;999", gg.TYPE_FLOAT)
  gg.setVisible(false)
  gg.clearResults()
  gg.setVisible(false)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.98900693655~0.98900723457;0.14786802232~0.14786840975;1.1920926e-7::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("0.98900693655~0.98900723457", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("25000", gg.TYPE_FLOAT)
  gg.setVisible(false)
  gg.clearResults()
  gg.setVisible(false)
  gg.toast("ᴀɴᴛᴇɴᴀ")

end -- KKK

function EXIT()
gg.skipRestoreState()
  os.exit()
  gg.setVisible(true)
end
while true do
  Time = os.date("%G-%m-%d | Time: %H:%M:%S")
  if gg.isVisible(true) then
    gg.setVisible(false)
    HOME()
  end
end
while true do
  if gg.isVisible(true) then
    PUBGSM = 1
    gg.setVisible(false)
  end
  gg.clearResults()
  if PUBGSM == 1 then
    HOME()
  end
end