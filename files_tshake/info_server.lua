--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
local function keko_tshake(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = {ID = "TextParseModeMarkdown"}
  tdcli_function ({
  ID = "SendMessage",
  chat_id_ = chat_id,
  reply_to_message_id_ = reply_to_message_id,
  disable_notification_ = disable_notification,
  from_background_ = 1,
  reply_markup_ = nil,
  input_message_content_ = {
  ID = "InputMessageText",
  text_ = text,
  disable_web_page_preview_ = disable_web_page_preview,
  clear_draft_ = 0,
  entities_ = {},
  parse_mode_ = TextParseMode,
  },
  }, dl_cb, nil)
  end
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then 
if (msg.content_.text_ == 'stats server' or msg.content_.text_ == 'معلومات السيرفر') then 
  local text2 = 'Info Server : \n'
  local TshAkETEAM = database:info()
  text2 = text2..'1 - *Uptime Days* : `'..TshAkETEAM.server.uptime_in_days..'('..TshAkETEAM.server.uptime_in_seconds..' seconds)`\n'
  text2 = text2..'2 - *Commands Processed* : `'..TshAkETEAM.stats.total_commands_processed..'`\n'
  text2 = text2..'3 - *Expired Keys* : `'..TshAkETEAM.stats.expired_keys..'`\n'
  text2 = text2..'4 - *Ops/sec* : `'..TshAkETEAM.stats.instantaneous_ops_per_sec..'`\n'
  send(msg.chat_id_, msg.id_, 1, text2, 1, 'md')
end
end
end
return {
	keko_tshake = keko_tshake,
}
--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]