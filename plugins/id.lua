--[[
#      ▇▇▇                              ▇▇▇            ▄▇▇▇▇▇▄              ▇▇                                    ▇▇                
#      ▇▇   ▇                        ▇   ▇▇          ▄▇                ▇▄                     ▇▇                  ▇▇
#      ▇▇     ▇ @hlh313   ▇     ▇▇         ▄▇    ▄▄▄    ▇▄                             ▇▇ ▇▇
#      ▇▇        ▇             ▇         ▇▇     ▄▇                            ▇▄                       ▇▇ ▇▇ ¦ Dev : @Q2O10
#      ▇▇           ▇       ▇            ▇▇   ▄▇ ¦ Dev : @Q2O10  ▇▄              ▇▇                 ▇▇
#      ▇▇              ▇▇                ▇▇  ▄▇                                    ▇▄   ▇▇                                  ▇▇¦ Source ISLAM BY @Q2O10
#---------------------------------------------------------------------
]]
local function iBoss(msg,MsgText)

if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
return modadd(msg)  
end
 
if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end
end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then

if not MsgText[2] and not msg.reply_id then
if redis:get(boss..'lock_id'..msg.chat_id_) then
local msgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "🎫┇معرفـك ❪ @"..data.username_.." ❫\n" else UserNameID = "" end
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
nko = points
else
nko = '0'
end
local rfih = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if data.photos_[0] then 
ali = {
'بمكن ازحف😹😌',
'بشر زربه💩',
'لاقيمه للقمر امام وجهك🌚🥀',
'خليني احبك🙈❤️',
'ببكن خاص 🌚😹',
'ببكن حلق🙊💋',
'لاخلقه ولا اخلاق☹️😹',
'امشي ورا السده🌚😹',
'يحفظك ابو هاشم🌚😹',
'وجه زربه💩😹',
'ياحلو منين الله جابك🙈❤️',
'خلينه نكبل🙈❤️',
'طيح الله حظك وحظ ابوك😹',
'مارتاحلك😐',
'ااااخ كلبي طك من الحلوين',
'ادمن وكف الايدي فدوه',
'خلصن الحلوات اجو الحلوين',
'تحبني؟🙈',


}
ssssys = ali[math.random(#ali)]
sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,
'🎇┇'..ssssys..'\n'
..'🎟┇ايديـك ❪ '..msg.sender_user_id_..' ❫\n'
..UserNameID
..'👮‍♀️┇رتبتـك ❪ '..msg.TheRank..' ❫\n'
..'🎲┇تفاعلك ❪ '..Get_Ttl(msgs)..' ❫\n'
..'💬┇رسائلك ❪ '..msgs..' ❫\n'
..'🚸┇سحكاتـك ❪ '..rfih..' ❫\n'
..'💎┇مجوهراتك ❪ '..nko..' ❫\n'
,dl_cb,nil)
else
sendMsg(msg.chat_id_,msg.id_,
'📬┇لا يمكنني عرض صورتك لانك قمت بحظر البوت او ليس لديك صوره ...!\n'..'['..UserNameID..']'
..'🎟┇ايديـك ❪ '..msg.sender_user_id_..' ❫\n'
..'📡┇رتبتـك ❪ '..msg.TheRank..' ❫\n'
..'🎲┇تفاعلك ❪ '..Get_Ttl(msgs)..' ❫\n'
..'💬┇رسائلك ❪ '..msgs..' ❫\n'
..'🚸┇سحكاتـك ❪ '..rfih..' ❫\n'
..'📞┇الـجـهـات ❪ '..NumGha..' ❫\n'
..'💎┇مجوهراتك ❪ '..zz..' ❫\n')
end
end) 
end ,nil)
end
return false
end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "المجموعه" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(boss..'group:name'..msg.chat_id_) or '')
redis:set(boss..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"👨🏻‍💻¦  ❪ مـعـلومـات الـمـجـموعـه ❫\n\n"
.."*👥¦* عدد الاعـضـاء ⇜ ❪ *"..data.member_count_.."* ❫"
.."\n*📛¦* عدد المحظـوريـن ⇜ ❪ *"..data.kicked_count_.."* ❫"
.."\n*👨🏻‍🔧¦* عدد الادمـنـيـه ⇜ ❪ *"..data.administrator_count_.."* ❫"
.."\n*⚜¦* ايدي المجموعه ⇜ ❪`"..msg.chat_id_.."`❫"
.."\n\n⚜¦ الاسم ⇜ ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(boss..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.." \n📌*¦* تم تثبيت الرساله \n✓")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* عذرا لا يمكنني التثبيت .\n🎟*¦* لست مشرف او لا املك صلاحيه التثبيت \n ❕')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then
return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."  \n💬*¦* تم الغاء تثبيت الرساله \n✓")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* عذرا لا يمكنني الغاء التثبيت .\n🎟*¦* لست مشرف او لا املك صلاحيه التثبيت \n ❕')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* عذرا عزيزي '..msg.TheRankCmd..' .\n🎟*¦* لا توجد رساله مثبته لاقوم بازالتها \n ❕')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end 
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "♦️*┇*هذا الامر يخص {المطور,المنشئ} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end 
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "♦️*┇*هذا الامر يخص {المطور,المنشئ} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.SudoUser then return "♦️*┇*هذا الامر يخص {المطور,المطور الاساسي} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.SudoUser then return "♦️*┇*هذا الامر يخص {المطور,المطور الاساسي} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end

if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end 
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end


--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"		 then return lock_All(msg) end
if MsgText[2] == "الوسائط" 	 then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"    	     then return mute_text(msg) end
if MsgText[2] == "المتحركه" 		 then return mute_gif(msg) end
if MsgText[2] == "الصور" 			 then return mute_photo(msg) end
if MsgText[2] == "الفيديو"			 then return mute_video(msg) end
if MsgText[2] == "البصمات" 		then  return mute_audio(msg) end
if MsgText[2] == "الصوت" 		then return mute_voice(msg) end
if MsgText[2] == "الملصقات" 	then return mute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return mute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return mute_forward(msg) end
if MsgText[2] == "الموقع"	 	then return mute_location(msg) end
if MsgText[2] == "الملفات" 		then return mute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return mute_inline(msg) end
if MsgText[2] == "الالعاب" 		then return mute_game(msg) end
if MsgText[2] == "الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return lock_link(msg) end
if MsgText[2] == "التاك" 		then return lock_tag(msg) end
if MsgText[2] == "المعرفات" 	then return lock_username(msg) end
if MsgText[2] == "التعديل" 		then return lock_edit(msg) end
if MsgText[2] == "الكلايش" 		then return lock_spam(msg) end
if MsgText[2] == "التكرار" 		then return lock_flood(msg) end
if MsgText[2] == "البوتات" 		then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return lock_markdown(msg) end
if MsgText[2] == "الويب" 		then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح" 		then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[2] == "الدردشه" 		then return unmute_text(msg) 	end
if MsgText[2] == "الصور" 		then return unmute_photo(msg) 	end
if MsgText[2] == "الفيديو" 		then return unmute_video(msg) 	end
if MsgText[2] == "البصمات" 		then return unmute_audio(msg) 	end
if MsgText[2] == "الصوت" 		then return unmute_voice(msg) 	end
if MsgText[2] == "الملصقات" 	then return unmute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return unmute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return unmute_forward(msg) end
if MsgText[2] == "الموقع" 		then return unmute_location(msg) end
if MsgText[2] == "الملفات" 		then return unmute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[2] == "الالعاب" 		then return unmute_game(msg) 	end
if MsgText[2] == "الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return unlock_link(msg) 	end
if MsgText[2] == "التاك" 		then return unlock_tag(msg) 	end
if MsgText[2] == "المعرفات" 	then return unlock_username(msg) end
if MsgText[2] == "التعديل" 		then return unlock_edit(msg) 	end
if MsgText[2] == "الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[2] == "التكرار" 		then return unlock_flood(msg) 	end
if MsgText[2] == "البوتات" 		then return unlock_bots(msg) 	end
if MsgText[2] == "البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[2] == "الويب" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "التثبيت" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
if not redis:get(boss..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(boss..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(boss..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"🙋🏼‍♂️*¦* تم انشاء رابط جديد \n🔖¦ ["..LinkGp.."]\n🔖¦ لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"📛¦ لا يمكنني انشاء رابط للمجموعه .\n🎟¦ لانني لست مشرف في المجموعه \n ❕")
end
else
return sendMsg(msg.chat_id_,msg.id_,"📛¦ لقد قمت بانشاء الرابط سابقا .\n🎟¦ ارسل { الرابط } لرؤيه الرابط  \n ❕")
end
return false
end 

if MsgText[1] == "الرابط" then
if not redis:get(boss..'linkGroup'..msg.chat_id_) then 
return "📡*¦* اوه 🙀 لا يوجد رابط ☹️\n🔖*¦*لانشاء رابط ارسل { انشاء رابط } \n📡" 
end
local GroupName = redis:get(boss..'group:name'..msg.chat_id_)
local GroupLink = redis:get(boss..'linkGroup'..msg.chat_id_)
return "🔖¦رابـط الـمـجـمـوعه 💯\n🌿¦ "..Flter_Markdown(GroupName).." :\n\n["..GroupLink.."]\n"
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
local GroupLink = redis:get(boss..'linkGroup'..msg.chat_id_)
if not GroupLink then return "📡*¦* اوه 🙀 لا يوجد هنا رابط\n🔖¦ *رجائا اكتب [ضع رابط]*🔃" end
local Text = "🔖¦رابـط الـمـجـمـوعه 💯\n🌿¦ "..Flter_Markdown(redis:get(boss..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "🙋🏼‍♂️*¦* عذرا عزيزي \n🌿¦ لم استطيع ارسالك الرابط لانك قمت بحظر البوت\n!"
elseif res == 400 then
return "🙋🏼‍♂️*¦* عذرا عزيزي \n🌿¦  لم استطيع ارسالك الرابط يجب عليك مراسله البوت اولا \n!"
end
if res == 200 then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."  \n🌿¦ تم ارسال الرابط خاص لك 🔃"
end
end


if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
redis:setex(boss..'rulse:witting'..msg.sender_user_id_,300,true)
return '📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل القوانين  للمجموعه 🍃'
end

if MsgText[1] == "القوانين" then
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return "🙋🏻‍♂*¦* مرحبأ عزيري القوانين كلاتي 👇🏻\n📛¦ ممنوع نشر الروابط \n⚠️¦ ممنوع التكلم او نشر صور اباحيه \n⚔¦ ممنوع  اعاده توجيه\n💭¦ ممنوع التكلم بلطائفه \n♥️¦ الرجاء احترام المدراء والادمنيه\n"
else 
return "*🔖¦القوانين :*\n"..redis:get(boss..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "📡*¦* حدود التكرار ,  يجب ان تكون ما بين  *[2-50]*" 
end
redis:set(boss..'flood'..msg.chat_id_,MsgText[2]) 
return "📡*¦* تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
if 500 < tonumber(MsgText[2]) then return "📛*¦* حدود المسح ,  يجب ان تكون ما بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⛑¦* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  \n✓")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⛑¦* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  \n✓")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end

local Admins = redis:scard(boss..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "📡*¦* اوه ☢ هنالك خطأ 🚸\n📛¦ عذرا لا يوجد ادمنيه ليتم مسحهم ✓" 
end
redis:del(boss..'admins:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم مسح {"..Admins.."} من الادمنيه في البوت \n✓"
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
local Mn3Word = redis:scard(boss..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "📡*¦* عذرا لا توجد كلمات ممنوعه ليتم حذفها ✓" 
end
redis:del(boss..':Filter_Word:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n🔖¦ تم مسح {*"..Mn3Word.."*} كلمات من المنع ✓"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return "📛¦ عذرا لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(boss..'rulse:msg'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم حذف القوانين بنجاح ✓"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
if not redis:get(boss..'welcome:msg'..msg.chat_id_) then 
return "📡*¦* اوه ☢ هنالك خطأ 🚸\n📛¦ عذرا لا يوجد ترحيب ليتم مسحه ✓" 
end
redis:del(boss..'welcome:msg'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم حذف الترحيب بنجاح \n✓"
end


if MsgText[2] == "المنشئيين" then
if not msg.SudoUser then return "♦️*┇*هذا الامر يخص {المطور} فقط  \n❕" end
local NumMnsha = redis:scard(boss..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "📛¦ عذرا لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(boss..':MONSHA_BOT:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..NumMnsha.." *} من المنشئيين\n✓"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local NumMDER = redis:scard(boss..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "📛¦ عذرا لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(boss..'owners:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..NumMDER.." *} من المدراء  \n✓"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end

local list = redis:smembers(boss..'banned:'..msg.chat_id_)
if #list == 0 then return "*📌¦ لا يوجد مستخدمين محظورين  *" end
message = '📋*¦* قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(boss..'banned:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..#list.." *} من المحظورين  \n✓"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
local MKTOMEN = redis:scard(boss..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "📡*¦* لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(boss..'is_silent_users:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..MKTOMEN.." *} من المكتومين  \n✓"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
local MMEZEN = redis:scard(boss..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*⚙️*¦ لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(boss..'whitelist:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..MMEZEN.." *} من المميزين  \n✓"
end

if MsgText[2] == 'الرابط' then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
if not redis:get(boss..'linkGroup'..msg.chat_id_) then 
return "*⚙️*¦ لا يوجد رابط مضاف اصلا " 
end
redis:del(boss..'linkGroup'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم مسح رابط المجموعه \n✓"
end


end 
--End del 


if MsgText[1] == "ضع اسم" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
redis:setex(boss..'name:witting'..msg.sender_user_id_,300,true)
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الاسم  للمجموعه \n🛠"
end


if MsgText[1] == "حذف صوره" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ تم حذف صوره آلمـجمـوعهہ 🌿\n✓')
end


if MsgText[1] == "ضع صوره" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ تم تغيير صوره آلمـجمـوعهہ ⠀\n✓')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ ليس لدي صلاحيه تغيير الصوره \n🤖 ¦ يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n✓')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '📭¦ حسننا عزيزي 🍁\n🌄 ¦ الان قم بارسال الصوره\n🛠' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
redis:setex(boss..'about:witting'..msg.sender_user_id_,300,true) 
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الوصف  للمجموعه\n🛠" 
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return GetListAdmin(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return ownerlist(msg) 
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return whitelist(msg) 
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ} فقط  \n❕" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"🔖| لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "📌| عـدد الـبـوتات •⊱ {* "..(Total - 1).." *} ⊰•\n\n"
if NumBot == 0 then 
TextR = TextR.."📮| لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."🔖| لم يتم طـرد {* "..NumBotAdmin.." *} بوت لآنهہ‌‏م مـشـرفين."
else
TextR = TextR.."📮| تم طـرد كــل البوتآت بنجآح .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '🤖| قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *★*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

📮| لـديـک {]]..total..[[} بـوتـآت
🔖| ملاحظة : الـ ★ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "♦️*┇*هذا الامر يخص {المطور,المنشئ} فقط  \n❕" end
sendMsg(msg.chat_id_,msg.id_,'🔛| جاري البحث عـن الـحـسـابـات المـحذوفـة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(boss..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(boss..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(boss..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"🚸 ¦ تم طـرد {* "..NumMemDone.." *} من آلحسـآبآت آلمـحذوفهہ‏‏ 🌿")
else
sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ لا يوجد حسابات محذوفه في المجموعه 🌿')
end
end
end,nil)
end
end,nil)
return false
end  


if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "♦️*┇*هذا الامر يخص {المطور} فقط  \n❕" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(boss..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️¦ في مجموعه  » »  '..redis:get(boss..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ عزيزي المطور ✋🏿\n👨🏻‍🔧¦ شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "♦️*┇*هذا الامر يخص {المطور} فقط  \n❕" end
if MsgText[2] == '1' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم تفعيل الاشتراك  👍🏿\n📆¦  الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(boss..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
local check_time = redis:ttl(boss..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end


if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1] == "كشف البوت" and not MsgText[2] then
if not msg.Director then return "♦️*┇*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n❕" end
GetChatMember(msg.chat_id_,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusMember" then 
sendMsg(msg.chat_id_, msg.id_,'📡*¦* جيد , الـبــوت ادمــن الان \n')
else 
sendMsg(msg.chat_id_, msg.id_,'📡*¦* كلا البوت ليس ادمن في المجموعة 📛')
end
end)
return false
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n✔️¦ ❪ الاحـصـائـيـات الـرسـائـلك ❫\n \n"
.."💬¦ الـرسـائـل ❪ `"..msgs.."` ❫\n"
.."📞¦ الـجـهـات ❪ `"..NumGha.."` ❫\n"
.."📸¦ الـصـور ❪ `"..photo.."` ❫\n"
.."📽¦ الـمـتـحـركـه ❪ `"..animation.."` ❫\n"
.."🔖¦ الـمـلـصـقات ❪ `"..sticker.."` ❫\n"
.."🎙¦ الـبـصـمـات ❪ `"..voice.."` ❫\n"
.."🔊¦ الـصـوت ❪ `"..audio.."` ❫\n"
.."🎞¦ الـفـيـديـو ❪ `"..video.."` ❫\n"
.."📬¦ الـتـعـديـل ❪ `"..edited.."` ❫\n\n"
.."📊¦ تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1]== 'جهاتي' then
return '🧟‍♂*¦*  عدد جهہآتگ آلمـضـآفهہ‏‏ » 【'..(redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..'】 . \n🐾'
end


if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="👨🏽‍🔧¦ اهـلا بـك عزيزي في معلوماتك 🥀 \n"
.."ـ.——————————\n"
.."🗯¦ الاســم ❪ "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." ❫\n"
.."💠¦ المعرف ❪ "..ResolveUser(data).." ❫\n"
.."⚜️¦ الايـدي ❪ `"..msg.sender_user_id_.."` ❫\n"
.."🚸¦ رتبتــك ❪ "..msg.TheRank.." ❫\n"
.."🔰¦ـ ❪ `"..msg.chat_id_.."` ❫\n"
.."ـ.——————————\n"
.." ❪ الاحـصـائـيـات الـرسـائـل ❫\n"
.."💬¦ الـرسـائـل ❪ `"..msgs.."` ❫\n"
.."📞¦ الـجـهـات ❪ `"..NumGha.."` ❫\n"
.."📸¦ الـصـور ❪ `"..photo.."` ❫\n"
.."📽¦ الـمـتـحـركـه ❪ `"..animation.."` ❫\n"
.."🔖¦ الـمـلـصـقات ❪ `"..sticker.."` ❪\n"
.."🎙¦ الـبـصـمـات ❪ `"..voice.."` ❫\n"
.."🔊¦ الـصـوت ❪ `"..audio.."` ❫\n"
.."🎞¦ الـفـيـديـو ❪ `"..video.."` ❫\n"
.."📬¦ الـتـعـديـل ❪`"..edited.."` ❫\n\n"
.."📊¦ تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
.."ـ.——————————\n"
.."👨🏻‍💻¦ مـطـور البوت •⊱ "..SUDO_USER.." ⊰•\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "تفعيل" then

if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
redis:set(boss..'welcom:witting'..msg.sender_user_id_,true) 
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ ارسل كليشه الترحيب الان\n\n🔖¦ ملاحظه تستطيع اضافه دوال للترحيب مثلا :\n🗒¦ اضهار قوانين المجموعه  » *{القوانين}*  \n📰¦  اضهار الاسم العضو » *{الاسم}*\n🏷¦ اضهار المعرف العضو » *{المعرف}*\n🏷¦ اضهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if redis:get(boss..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(boss..'welcome:msg'..msg.chat_id_))
else 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."  \n🌿¦ نورت المجموعه \n💂🏼‍♀️" 
end 
end


if MsgText[1] == "كشف"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end


if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "♦️*┇*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n❕" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "♦️*┇*هذا الامر يخص {المطور,المنشئ} فقط  \n❕" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"♦️*┇*هذا الامر يخص {المطور الاساسي} فقط  \n❕" end
local mtwren = redis:scard(boss..':SUDO_BOT:')
if mtwren == 0 then  return "⚙️*¦* عذرا لا يوجد مطورين في البوت  ✖️" end
redis:del(boss..':SUDO_BOT:') 
return "📛*¦* تم مسح {* "..mtwren.." *} من المطورين ☔️\n✓"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"♦️*┇*هذا الامر يخص {المطور الاساسي} فقط  \n❕" end
local addbannds = redis:scard(boss..'gban_users')
if addbannds ==0 then 
return "*⚙️¦ قائمة الحظر فارغه .*" 
end
redis:del(boss..'gban_users') 
return "⚙️*¦* تـم مـسـح { *"..addbannds.." *} من قائمه العام\n✓" 
end 

if msg.SudoBase then

if MsgText[1] == "رفع مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" then
local groups = redis:smembers(boss..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'💯*¦* جـيـد , لا توجد مجموعات وهميه \n✓')
else
sendMsg(msg.chat_id_,msg.id_,'📑*¦* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n🚸*¦* تـم تنظيف  •⊱ { *'..GroupDel..'*  } ⊰• مجموعه \n📉*¦* اصبح العدد الحقيقي الان •⊱ { *'..GroupsIsFound..'*  } ⊰• مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" then
local pv = redis:smembers(boss..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(boss..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'👨🏼‍⚕️| جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'📑*¦* عدد المشتركين •⊱ { *'..#pv..'*  } ⊰•\n🚸*¦* تـم تنظيف  •⊱ { *'..NumPvDel..'*  } ⊰• مشترك \n📉*¦* اصبح العدد الحقيقي الان •⊱ { *'..SenderOk..'*  } ⊰• من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🌄" then
redis:setex(boss..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'📭¦ حسننا عزيزي 🍁\n🌄 ¦ الان قم بارسال الصوره للترحيب \n🛠' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then 
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(boss..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[⚜┊اهلا انآ بوت آسـمـي ]]..redis:get(boss..':NameBot:')..[[ ✓
👨🏻‍✈️┊آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت
📛┊مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...

🎭┊مـعـرف الـمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
]])

return false
else
return "📛| لا توجد صوره مضافه للترحيب في البوت \n📌| لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(boss..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '📭¦ حسننا عزيزي 🍁\n💬¦ الان قم بارسال الكليشه \n🛠' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(boss..':addnumberusers',MsgText[2]) 
return '💱*¦* تم وضـع شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..MsgText[2]..'】* عضـو  🍁\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'🚸*¦* شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..redis:get(boss..':addnumberusers')..'】* عضـو  🍁\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🔝" then 
if not msg.SudoUser then return "♦️*┇*هذا الامر يخص {المطور} فقط  \n❕" end
return '📮*¦* عدد المجموعات المفعلة » `'..redis:scard(boss..'group:ids')..'`  ➼' 
end

if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "♦️*┇*هذا الامر يخص {المطور} فقط  \n❕" end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "♦️*┇*هذا الامر يخص {المطور} فقط  \n❕" end
if redis:sismember(boss..'group:ids',MsgText[2]) then
local name_gp = redis:get(boss..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'📛*¦* تم تعطيل المجموعه بأمر من المطور  \n🚸*¦* سوف اغادر جاوو 🚶🏻🚶🏻 ...\n✘')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '📛*¦* تم تعطيل المجموعه ومغادرتها \n🏷*¦* المجموعةة » ['..name_gp..']\n🎫*¦* الايدي » ( *'..MsgText[2]..'* )\n✓'
else 
return '📛*¦* لا توجد مجموعه مفعله بهذا الايدي !\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(boss..":TEXT_SUDO") or '🗃¦ لا توجد كليشه المطور .\n📰¦ يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n📡'
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه 📣" then
if not msg.SudoUser then return"♦️*┇*هذا الامر يخص {المطور} فقط  \n❕" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
end
redis:setex(boss..'fwd:'..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل التوجيه للاذاعه \n🔛" 
