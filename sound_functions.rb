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

def doing_dave?
  Sound.play('C:\Windows\Media\doing_dave.wav')
end

def what_is_it?
  Sound.play('C:\Windows\Media\what_is_it?.wav')
end