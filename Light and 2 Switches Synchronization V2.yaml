alias: Pasillo - Conmutado Luces
description: Sincroniza los interruptores de luces del pasillo
trigger:
  - platform: state
    entity_id:
      - light.pasillo_dimmer_luces
      - switch.salon_interruptor_luces_pasillo_up
      - switch.pasillo_interruptor_luces_dormitorio_up
action:
  - variables:
      entities:
        - light.pasillo_dimmer_luces
        - switch.salon_interruptor_luces_pasillo_up
        - switch.pasillo_interruptor_luces_dormitorio_up
      new_state: "{{ trigger.to_state.state }}"
      others: "{{ entities | reject('eq', trigger.entity_id) | list }}"
  - choose:
      - conditions: "{{ new_state == 'on' }}"
        sequence:
          - service: homeassistant.turn_on
            target:
              entity_id: "{{ others | select('is_state', 'off') | list }}"
      - conditions: "{{ new_state == 'off' }}"
        sequence:
          - service: homeassistant.turn_off
            target:
              entity_id: "{{ others | select('is_state', 'on') | list }}"
mode: single
