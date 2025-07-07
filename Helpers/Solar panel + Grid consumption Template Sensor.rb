{{ 
  (states('sensor.current_power')|float(0) +
  states('sensor.active_power')|float(0) * -1 / 1000) | abs | round(2) 
}}