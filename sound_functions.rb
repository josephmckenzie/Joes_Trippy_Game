def game_sounds
  require 'win32/sound'
  include Win32
end

def error
  Sound.play('C:\Windows\Media\malfunction.wav')
end

def need_input
  Sound.play('C:\Windows\Media\malfunction_need_input.wav')
end

def gameover
  Sound.play('C:\Windows\Media\gameover.wav')
end