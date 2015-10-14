#Here is where my sound functions are as well as a few ideas for sounds too.


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

def police_siren
  Sound.play('C:\Windows\Media\police_siren.wav')
end

def door_open
  Sound.play('C:\Windows\Media\door_open.wav')
end

def tv_static
  Sound.play('C:\Windows\Media\tv_static.wav')
end

def snoring
  Sound.play('C:\Windows\Media\snoring.wav')
end

def cough_3x
  Sound.play('C:\Windows\Media\cough_3x.wav')
end

def knock_at_door
  Sound.play('C:\Windows\Media\knock_at_door.wav')
end

def whats_your_name
  Sound.play('C:\Windows\Media\whats_your_name.wav')
end

def anyone_home
  Sound.play('C:\Windows\Media\anyone_home.wav')
end




